using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;
using System.Threading.Tasks;
namespace SanitaryCartControl.Core.Services
{
    public class ProductService : IProductService
    {
        
        public IEnumerable<KeyValuePair<int, string>> GetAttrinuteValues(Entities.Enums.ProductType type, int categoryId)
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<CategoryBLL> GetCategoryList(int brandId)
        {
           using(var context=  new SanitaryCartContext())
           {
                IList<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();
                var list = context.Category.Include(e=>e.SeriesBrand).ToList();
                var leafs =    list.Where(e=>list.Where(i=>i.ParentId==e.Id).Count()==0).Select(e=>e.Id);                  
                var resultWithoutLeaf =list.Where(e=>!leafs.Contains(e.Id)).ToList();
                var leafResultWthBrand = list.Where(e=>leafs.Contains(e.Id) && e.SeriesBrand.BrandIdFk==brandId).ToList();
                resultWithoutLeaf.AddRange(leafResultWthBrand);
                
                foreach (var item in resultWithoutLeaf)
                {
                      CategoryBLLs.Add(new CategoryBLL(){Id=item.Id,ParentId=item.ParentId,Title=item.Titlle,Categories=null});    
                }
                return GetTree(CategoryBLLs,null);
           }
           
        }

        public int GetProductType(int CategoryId)
        {
           using(var context = new SanitaryCartContext())
           {
               
               throw new System.NotImplementedException();
           }
        }

        public int GetRootId(int categoryId)
        {
            throw new System.NotImplementedException();
        }

        ICollection<CategoryBLL> GetTree(ICollection<CategoryBLL> categories,int? parentId = null)
        {
           return categories.Where(e=>e.ParentId==parentId).Select(e=>new CategoryBLL(){
               Id=e.Id,
               Title=e.Title,
               ParentId=e.ParentId,
               Categories=GetTree(categories,parentId:e.Id).ToList()
           }).ToList();    
        }
    }
}