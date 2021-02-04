using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Data.SqlClient;
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
            AncestorCategoryBLL ancestorCategoryBLL = new AncestorCategoryBLL();
            using (var con = new SqlConnection(_con))
            {

                string sql = "EXECUTE GetRootPath @Id";
                SqlParameter paremeter = new SqlParameter
                {
                    Value = Id,
                    ParameterName = "@Id",
                    DbType = System.Data.DbType.Int32
                };
                using (var cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add(paremeter);
                    con.Open();
                    SqlDataReader sqlDataReader = cmd.ExecuteReader();
                    int count = 0;
                    if (sqlDataReader.HasRows)
                    {
                        while (sqlDataReader.Read())
                        {
                            if (count == 0)
                            {
                                ancestorCategoryBLL.IsEndCategory = !sqlDataReader.GetBoolean(1);//true if element has no children
                                ancestorCategoryBLL.Title = sqlDataReader["Title"] as string;
                                ancestorCategoryBLL.Id = sqlDataReader.GetInt32(0);
                                ancestorCategoryBLL.Ancestors = new List<AncestorCategoryBLL>();
                            }
                            else
                            {
                                ancestorCategoryBLL.Ancestors.Add(new AncestorCategoryBLL
                                {
                                    Ancestors = null,
                                    Id = sqlDataReader.GetInt32(0),
                                    Title = sqlDataReader["Title"] as string,
                                    IsEndCategory = sqlDataReader.GetBoolean(1)
                                });
                            }
                            count++;
                        }

                    }
                }
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
        public IEnumerable<CategoryBLL> GetCategoryListByBrandIdOptionally(int? brandId = null)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IEnumerable<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();

                var list = context.Categories.AsNoTracking().Include(e => e.SeriesBrand).ToList().AsEnumerable();
                IEnumerable<int> SeriesHolderIds = context.SeriesHolderCategories.AsNoTracking().Select(e => e.CategoryIdFk).ToArray();

                if (brandId != null)
                {

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
                CategoryBLLs = Helpher.HelpherMethods.ToCatgeoryBLL(list, SeriesHolderIds.ToArray());
                return GetTree(CategoryBLLs, null);
            }
        }
        IEnumerable<CategoryBLL> GetTree(IEnumerable<CategoryBLL> categories, int? parentId = null)
        {
            return categories.Where(e => e.ParentId == parentId).Select(e => new CategoryBLL()
            {
                Id = e.Id,
                Title = e.Title,
                ParentId = e.ParentId,
                Categories = e.IsEndPoint ? null : (ICollection<CategoryBLL>)GetTree(categories, e.Id),
                IsEndPoint = e.IsEndPoint
            }).ToList();
        }

        public IEnumerable<CategoryInfo> GetChildren(int Id)
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
                                HoldChildren = reader.GetInt32(2) != 0,
                                Title = reader.GetString(1),
                                ImagePath = reader["ImagePath"] as string
                            });
                        }
                    }
                    con.Close();
                }
            }
            return categoryInfos;
        }

        public IEnumerable<CategoryBreadcrumbInfo> GetNonSeriesHolderBreadcrumps()
        {
            ICollection<CategoryBreadcrumbInfo> categoryBreadcrumbInfos = new List<CategoryBreadcrumbInfo>();
            using (var con = new SqlConnection(_con))
            {
                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    con.Open();
                    string sql = "EXECUTE GetNonSeriesHolderCategoryBreadcrumb @Seperator";
                    cmd.CommandText = sql;
                    cmd.Parameters.Add(new SqlParameter
                    {
                        Value = '>',
                        ParameterName = "@Seperator",
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
                Category category = context.Categories.Include(e => e.SeriesHolderCategory).Include(e => e.InverseParent).FirstOrDefault(e => e.Id == Id);

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
        int[] GetSeriesHoldersIdsFromContext(SanitaryCartContext context)
        {
            return context.SeriesHolderCategories.AsNoTracking().Select(e => e.CategoryIdFk).ToArray();
        }

        public IEnumerable<CategoryBLL> GetCategoryListUptoFirstLevel()
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IEnumerable<Category> categories = context.Categories.FromSqlRaw<Category>("EXEC GetNodeTillFirstLevel").ToList();
                IEnumerable<int> SeriesHolderIds = GetSeriesHoldersIdsFromContext(context);
                return GetTree(HelpherMethods.ToCatgeoryBLL(categories, SeriesHolderIds.ToArray()), null);
            }
        }

        public IEnumerable<CategoryInfo> GetBaseCategories()
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IEnumerable<Category> categories = context.Categories.Where(e => e.ParentId == null).AsNoTracking().ToList();
                
                ICollection<CategoryInfo> categoryInfos = new List<CategoryInfo>();
                //assuming all category having parentId NULL.Thus Automatically SeriesHolder For Now Case As I Known All Root Have Children
                foreach (var item in categories)
                {
                    categoryInfos.Add(new CategoryInfo()
                    {
                        HoldChildren = true,
                        Id = item.Id,
                        ImagePath = item.ImagePath,
                        Title = item.Titlle
                    });
                }
                return categoryInfos;
            }
        }
    }
}