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
        public IEnumerable<KeyValuePair<int, string>> GetAttrinuteValues(SanitaryCartControl.Core.Entities.Enums.ProductType type, int categoryId)
        {
            int rootId = this.GetRootId(categoryId);
            using (var context = new SanitaryCartContext())
            {
                ICollection<KeyValuePair<int, string>> Values = new List<KeyValuePair<int, string>>();
                switch (type)
                {
                    case Entities.Enums.ProductType.ColorVariable:
                        {
                            var result = context.Color.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;
                    case Entities.Enums.ProductType.SizeVariable:
                        {
                            var result = context.Size.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;

                    case Entities.Enums.ProductType.TypeVaribale:
                        {
                            var result = context.Kind.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;
                    case Entities.Enums.ProductType.NoneVariable:
                        break;
                    default:
                        throw new System.Exception("A Non Recognised Product Type Encountered");
                }
             return Values;   
            }
        }

        public IEnumerable<CategoryBLL> GetCategoryList(int brandId)
        {
            using (var context = new SanitaryCartContext())
            {
                IList<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();
                var list = context.Category.Include(e => e.SeriesBrand).ToList();

                foreach (var item in list)
                {
                    CategoryBLLs.Add(new CategoryBLL() { Id = item.Id, ParentId = item.ParentId, Title = item.Titlle, Categories = null });
                }
                return GetTree(CategoryBLLs, null);
            }

        }

        AncestorCategoryBLL GetAllAncestors(int ProductId)
        {
            using(var context = new SanitaryCartContext())
            {
            
            }
         throw new System.NotImplementedException();
        }
        public ProductBLL GetById(int Id)
        {
            var Ancestors = this.GetAllAncestors(Id);
            using(var context = new SanitaryCartContext())
            {
               var Product =  context.Product.AsNoTracking().Include(e=>e.Image).Include(e=>e.BrandIdFkNavigation).Include(e=>e.TypeProductQuantity).First(e => e.Id == Id);
               return Helpher.HelpherMethods.ToProductBLL(Product,Ancestors);       
            }
        }

        public int GetProductType(int CategoryId)
        {
            int? parentId = this.GetRootId(CategoryId);
            using (var context = new SanitaryCartContext())
            {
                ProductType productType = context.ProductType.FirstOrDefault(e => e.CategoryIdFk == parentId);
                return productType.AttributeIdFk;
            }
        }
        public int GetRootId(int categoryId)
        {
            using (var context = new SanitaryCartContext())
            {
                var Parent = context.Category.FromSqlRaw<Category>("GetRootNode @Id={0}", categoryId).AsEnumerable().FirstOrDefault();
                return Parent.Id;
            }
        }

        public ProductBLL Update(ProductBLL product)
        {
            throw new System.NotImplementedException();
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