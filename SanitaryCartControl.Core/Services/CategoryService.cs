using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.Extensions.Options;
using Microsoft.Extensions.Configuration;
using SanitaryCartControl.Core.Helpher;
namespace SanitaryCartControl.Core.Services
{
    public class CategoryService : ICategoryService
    {
        readonly string _con;
        public CategoryService(IOptions<ConnectionStringOptions> connectionString)
        {
            _con = connectionString.Value.SQLConnection;
        }
        public int? GetProductTypeById(int CategoryId)
        {
            int result  = 0;
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
                    cmd.ExecuteNonQuery();
                    con.Close();
                    if(OutputParameter.Value==null)
                    result= (int)OutputParameter.Value;
                }
            }
            using(var context=new SanitaryCartContext(_con))
            {
             ProductType productType = context.ProductType.FirstOrDefault(e=>e.CategoryIdFk==result);
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
                var categories = context.Category.FromSqlRaw<Category>("GetRootPath @Id={0}", Id).ToList();
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
                var ImmediateNode = context.Category.FromSqlRaw<Category>("GetImmedaiteNode @Id={0}", categoryId).AsEnumerable().FirstOrDefault();
                return ImmediateNode.Id;
            }

        }

        public IEnumerable<CategoryBLL> GetCategoryList(int brandId)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IList<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();
                int[] SeriesHolderIds = context.SeriesHolderCategory.AsNoTracking().Select(e => e.CategoryIdFk).ToArray();

                var list = context.Category.AsNoTracking().Include(e => e.SeriesBrand).Include(e => e.SeriesHolderCategory).ToList().Where(e =>
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
                });
                foreach (var item in SeriesHolderIds)
                {
                    if (list.Where(e => e.ParentId == item).Count() == 0)
                        list = list.Where(e => e.Id != item);
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

    }
}