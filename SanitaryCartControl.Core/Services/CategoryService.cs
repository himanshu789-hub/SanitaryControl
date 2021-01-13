using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.Extensions.Configuration;
using SanitaryCartControl.Core.Helpher;
using Microsoft.Extensions.Options;
namespace SanitaryCartControl.Core.Services
{
    public class CategoryService : ICategoryService
    {
        readonly string _con;
        public CategoryService(IOptions<ConnectionStringOptions> connection)
        {
            _con = connection.Value.SQLConnection;
        }
        public int? GetProductTypeById(int CategoryId)
        {
            int result = 0;
            using (var con = new SqlConnection(_con))
            {
                string StoredProcedureName = "GetTypeImmediateResult";
                using (var cmd = new SqlCommand(StoredProcedureName, con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlParameter InputParameter = new SqlParameter()
                    {
                        ParameterName = "@Id",
                        Value = CategoryId,
                        DbType = System.Data.DbType.Int32
                    };
                    SqlParameter OutputParameter = new SqlParameter()
                    {
                        ParameterName = "@ResultId",
                        Value = CategoryId,
                        DbType = System.Data.DbType.Int32,
                        Direction = System.Data.ParameterDirection.Output
                    };
                    cmd.Parameters.Add(InputParameter);
                    cmd.Parameters.Add(OutputParameter);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    result = (int)OutputParameter.Value;
                }
            }
            using (var context = new SanitaryCartContext(_con))
            {
                ProductType productType = context.ProductTypes.FirstOrDefault(e => e.CategoryIdFk == result);
                return productType?.AttributeIdFk;
            }
        }
        // using (var context = new SanitaryCartContext(_con))
        // {
        //     ProductType productType = context.ProductType.FirstOrDefault(e => e.CategoryIdFk == parentId);
        //     return productType.AttributeIdFk;
        // }
        public AncestorCategoryBLL GetAllAncestors(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var categories = context.Categories.FromSqlRaw<Category>("GetRootPath @Id={0}", Id).ToList();
                var first = categories.First();
                AncestorCategoryBLL ancestorCategoryBLL = new AncestorCategoryBLL
                {
                    Ancestors = new List<AncestorCategoryBLL>(),
                    Title = first.Titlle,
                    Id = first.Id
                };
                foreach (var item in categories.Where(e => e.Id != Id))
                    ancestorCategoryBLL.Ancestors.Add(new AncestorCategoryBLL() { Id = item.Id, Title = item.Titlle, Ancestors = null });

                return ancestorCategoryBLL;
            }
        }


        public int GetImmediateNodeId(int categoryId)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var sqlParameter = new SqlParameter("Id", categoryId);
                var ImmediateParent = context.Categories.FromSqlRaw<Category>("EXECUTE GetImmediateNode {0}", categoryId).AsEnumerable().FirstOrDefault();
                return ImmediateParent.Id;
            }

        }

        public IEnumerable<CategoryBLL> GetCategoryListByBrandIdOption(int? brandId = null)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IList<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();
                var list = context.Categories.AsNoTracking().Include(e => e.SeriesBrand).Include(e => e.SeriesHolderCategories).ToList().AsEnumerable();

                if (brandId != null)
                {
                    int[] SeriesHolderIds = context.SeriesHolderCategories.AsNoTracking().Select(e => e.CategoryIdFk).ToArray();
                    list = list.Where(e =>
                     {
                         if (e.SeriesBrand != null)
                         {
                             if (e.SeriesBrand.BrandIdFk == brandId)
                                 return true;
                             else
                                 return false;
                         }
                         else
                             return true;
                     }).ToList();
                    foreach (var item in SeriesHolderIds)
                    {
                        if (list.Where(e => e.ParentId == item).Count() == 0)
                            list = list.Where(e => e.Id != item);
                    }

                }

                foreach (var item in list)
                {
                    CategoryBLLs.Add(new CategoryBLL() { Id = item.Id, ParentId = item.ParentId, Title = item.Titlle, Categories = null });
                }
                return GetTree(CategoryBLLs, null);
            }

        }
        ICollection<CategoryBLL> GetTree(ICollection<CategoryBLL> categories, int? parentId = null)
        {
            return categories.Where(e => e.ParentId == parentId).Select(e => new CategoryBLL()
            {
                Id = e.Id,
                Title = e.Title,
                ParentId = e.ParentId,
                Categories = GetTree(categories, parentId: e.Id).ToList()
            }).ToList();
        }

        public IEnumerable<CategoryInfo> GetChildren(int Id, int Page, int Count)
        {
            ICollection<CategoryInfo> categoryInfos = new List<CategoryInfo>();
            string sql = "SELECT c1.Id AS Id,c1.Titlle AS Title,IIF(COUNT(*)>1,1,0) AS IsSubCategory,c1.ImagePath FROM Category AS c1 LEFT JOIN Category AS c2 ON c2.ParentId = c1.Id WHERE c1.ParentId = @Id GROUP BY c1.Id,c1.Titlle,c1.ImagePath";
            using (var con = new SqlConnection(_con))
            {
                using (var cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    cmd.Parameters.Add(new SqlParameter { Value = Id, ParameterName = "@Id" });
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            categoryInfos.Add(new CategoryInfo()
                            {
                                Id = reader.GetInt32(0),
                                IsSubCategory = reader.GetInt32(2) != 0,
                                Title = reader.GetString(1),
                                ImagePath = reader["ImagePath"] as string
                            });
                        }
                    }
                    con.Close();
                }
            }
            return categoryInfos.Skip(Page * Count).Take(Count);
        }

        public IEnumerable<CategoryBreadcrumbInfo> GetNonSeriesHolderBreadcrumps()
        {
            ICollection<CategoryBreadcrumbInfo> categoryBreadcrumbInfos = new List<CategoryBreadcrumbInfo>();
            using (var con = new SqlConnection(_con))
            {
                using (var cmd = new SqlCommand())
                {
                    con.Open();
                    string sql = "EXECUTE GetNonSeriesHolderCategoryBreadcrumb @Seperator";
                    cmd.Connection = con;
                    cmd.CommandText = sql;
                    cmd.Parameters.Add(new SqlParameter
                    {
                        Value = '>',
                        TypeName = "@Seperator",
                        SqlDbType = System.Data.SqlDbType.NChar
                    });
                    SqlDataReader sqlDataReader = cmd.ExecuteReader();

                    if (sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                            categoryBreadcrumbInfos.Add(new CategoryBreadcrumbInfo
                            {
                                Id = sqlDataReader.GetInt32(0),
                                Breadcrumps = sqlDataReader.GetString(1) as string,
                                ImagePath = sqlDataReader["ImagePath"] as string
                            });
                    }
                }
            }
            return categoryBreadcrumbInfos;
        }

        public CategoryBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Category category = context.Categories.FirstOrDefault(e => e.Id == Id);
                if (category == null)
                    return null;

                return new CategoryBLL()
                {
                    Id = category.Id,
                    ParentId = category.ParentId,
                    Title = category.Titlle,
                    Categories = null
                };
            }
        }

        public bool UpdateImageById(int Id, string newImagePath)
        {
            using (var context = new SanitaryCartContext(_con))
            {

                Category category = context.Categories.FirstOrDefault(e => e.Id == Id);
                if (category == null)
                    return false;
                category.ImagePath = newImagePath;
                context.SaveChanges();
                return true;
            }
        }
    }
}