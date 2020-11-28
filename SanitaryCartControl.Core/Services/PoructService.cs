using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;
using Enums = SanitaryCartControl.Core.Entities.Enums;
using System.Threading.Tasks;
using SanitaryCartControl.Core.Helpher;
namespace SanitaryCartControl.Core.Services
{
    public class ProductService : IProductService
    {
        readonly ICategoryService _categoryService;
        public ProductService(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        public IEnumerable<KeyValuePair<int, string>> GetAttrinuteValues(SanitaryCartControl.Core.Entities.Enums.ProductType type, int categoryId)
        {
            int rootId = _categoryService.GetRootId(categoryId);
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
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Size1)));
                        }
                        break;

                    case Entities.Enums.ProductType.TypeVaribale:
                        {
                            var result = context.Kind.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Kind1)));
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



        AncestorCategoryBLL GetAllAncestors(int ProductId)
        {
            using (var context = new SanitaryCartContext())
            {
                var categories = context.Category.FromSqlRaw<Category>("GetRootPath @Id={0}", ProductId).ToList();
                var first = categories.First();
                AncestorCategoryBLL ancestorCategoryBLL = new AncestorCategoryBLL
                {
                    Ancestors = new List<AncestorCategoryBLL>(),
                    Title = first.Titlle,
                    Id = first.Id
                };
                foreach (var item in categories.Where(e => e.Id != ProductId))
                    ancestorCategoryBLL.Ancestors.Add(new AncestorCategoryBLL() { Id = item.Id, Title = item.Titlle, Ancestors = null });
                return ancestorCategoryBLL;
            }
        }
        public ProductBLL GetById(int Id)
        {
            var Ancestors = this.GetAllAncestors(Id);
            using (var context = new SanitaryCartContext())
            {
                var Product = context.Product.AsNoTracking().Include(e => e.Image).Include(e => e.BrandIdFkNavigation).Include(e => e.TypeProductQuantity).Include(e => e.TypeProductQuantity).First(e => e.Id == Id);
                return Helpher.HelpherMethods.ToProductBLL(Product, Ancestors);
            }
        }

        public int GetProductType(int CategoryId)
        {
            int? parentId = _categoryService.GetRootId(CategoryId);
            using (var context = new SanitaryCartContext())
            {
                ProductType productType = context.ProductType.FirstOrDefault(e => e.CategoryIdFk == parentId);
                return productType.AttributeIdFk;
            }
        }
        public bool Update(ProductBLL product)
        {
            using (var context = new SanitaryCartContext())
            {
                Product OldProduct = context.Product.Include(e => e.TypeProductQuantity).Include(e => e.Image).FirstOrDefault(e => e.Id == product.Id);
                OldProduct.DateUpdated = product.DateUpdated;
                OldProduct.Description = product.Description;
                if (OldProduct == null)
                    return false;
                if (product.Images != null)
                {
                    context.Image.RemoveRange(context.Image.Where(e => e.Id == OldProduct.Id).ToList());
                    foreach (var item in product.Images)
                    {
                        OldProduct.Image.Add(new Image()
                        {
                            Path = item,
                            Type = OldProduct.Type
                        });
                    }
                }
                int[] AttributeId = product.AttributeBLLs.Where(e => e.Id != 0).Select(e => e.Id).ToArray();
                foreach (var item in AttributeId)
                {
                    TypeProductQuantity typeProductQuantity = OldProduct.TypeProductQuantity.FirstOrDefault(e => e.Id == item);
                    AttributeBLL attributeBLL = product.AttributeBLLs.FirstOrDefault(e => e.Id == item);
                    typeProductQuantity.IsActive = attributeBLL.IsActive;
                    typeProductQuantity.Price = attributeBLL.Price;
                    typeProductQuantity.Quantity = attributeBLL.Quantity;
                }
                IEnumerable<AttributeBLL> attributeBLLs = product.AttributeBLLs.Where(e => e.Id == 0);
                foreach (var item in attributeBLLs)
                {
                    OldProduct.TypeProductQuantity.Add(new TypeProductQuantity()
                    {
                        Value = item.Value,
                        Quantity = item.Quantity,
                        IsActive = true,
                        Price = item.Price,
                        AtributeType = item.AttributeId
                    });
                }
                context.SaveChanges();
                return true;
            }
        }
        public int Add(ProductBLL product)
        {
            using (var context = new SanitaryCartContext())
            {
                Product NewProduct = new Product
                {
                    Description = product.Description,
                    Name = product.Name,
                    Code = product.Code,
                    BrandIdFk = product.Brand.Id,
                    IsActive = true,
                    CategoryId = product.RootPath.Id,
                    Type = product.Type,
                    DateAdded = product.DateAdded,
                    DateUpdated = product.DateAdded
                };
                foreach (var item in product.AttributeBLLs)
                    NewProduct.TypeProductQuantity.Add(new TypeProductQuantity
                    {
                        AtributeType = item.AttributeId,
                        Price = item.Price,
                        Quantity = item.Quantity,
                        Value = item.AttributeId == ((byte)Enums.ProductType.NoneVariable) ? null : item.Value,
                        IsActive = true
                    });

                foreach (var item in product.Images)
                    NewProduct.Image.Add(new Image { Path = item, Type = product.Type });
                context.Product.Add(NewProduct);
                context.SaveChanges();

                return NewProduct.Id;
            }
        }

        public IEnumerable<ProductBLL> Search(string value)
        {
            using (var context = new SanitaryCartContext())
            {
                var products = context.Product.AsNoTracking().Where(e => e.Code == value || e.Name.Contains(value))
                  .Include(e => e.TypeProductQuantity)
                  .Include(e => e.BrandIdFkNavigation).Include(e => e.Category).ThenInclude(e => e.Parent).ToList();
                return HelpherMethods.ToProductBLLs(products.AsQueryable());
            }
        }

        public bool Delete(int Id)
        {
            using (var context = new SanitaryCartContext())
            {
                Product product = context.Product.FirstOrDefault(e => e.Id == Id);
                if (product != null)
                {
                    product.IsActive = false;
                    return true;
                }
                return false;
            }
        }
    }
}