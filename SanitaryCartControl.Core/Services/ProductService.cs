using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Enums = SanitaryCartControl.Core.Entities.Enums;
using Microsoft.Extensions.Options;
using SanitaryCartControl.Core.Helpher;
namespace SanitaryCartControl.Core.Services
{
    public class ProductService : IProductService
    {
        readonly ICategoryService _categoryService;
        readonly string _con;
        public ProductService(ICategoryService categoryService, IOptions<ConnectionStringOptions> connection)
        {
            _categoryService = categoryService;
            _con = connection.Value.SQLConnection;
        }
        public IEnumerable<KeyValuePair<int, string>> GetAttrinuteValues(SanitaryCartControl.Core.Entities.Enums.ProductType type, int categoryId)
        {
            int rootId = _categoryService.GetImmediateNodeId(categoryId);
            using (var context = new SanitaryCartContext(_con))
            {
                ICollection<KeyValuePair<int, string>> Values = new List<KeyValuePair<int, string>>();
                switch (type)
                {
                    case Entities.Enums.ProductType.ColorVariable:
                        {
                            var result = context.Colors.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;
                    case Entities.Enums.ProductType.SizeVariable:
                        {
                            var result = context.Sizes.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Size1)));
                        }
                        break;

                    case Entities.Enums.ProductType.TypeVaribale:
                        {
                            var result = context.Kinds.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
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
        public ProductBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var Product = context.Products.AsNoTracking().Include(e => e.Images).Include(e => e.BrandIdFkNavigation).Include(e => e.TypeProductQuantities).First(e => e.Id == Id);
                var Ancestors = _categoryService.GetAllAncestors(Product.CategoryId);
                return Helpher.HelpherMethods.ToProductBLL(Product, Ancestors);
            }
        }
        public bool Update(ProductBLL product)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Product OldProduct = context.Products
                .Include(e => e.TypeProductQuantities)
                .Include(e => e.Images)
                .FirstOrDefault(e => e.Id == product.Id);
                
                OldProduct.DateUpdated = product.DateUpdated;
                
                OldProduct.Description = product.Description;
                
                if (OldProduct == null)
                    return false;
                if (product.Images != null)
                {
                    context.Images.RemoveRange(OldProduct.Images);
                    foreach (var item in product.Images)
                    {
                        OldProduct.Images.Add(new Image()
                        {
                            Path = item,
                            Type = OldProduct.Type
                        });
                    }
                }
                int[] AttributeId = product.AttributeBLLs.Where(e => e.Id != 0).Select(e => e.Id).ToArray();
                foreach (var item in AttributeId)
                {
                    TypeProductQuantity typeProductQuantity = OldProduct.TypeProductQuantities.FirstOrDefault(e => e.Id == item);
                    AttributeBLL attributeBLL = product.AttributeBLLs.FirstOrDefault(e => e.Id == item);
                    typeProductQuantity.IsActive = attributeBLL.IsActive;
                    typeProductQuantity.Price = attributeBLL.Price;
                    typeProductQuantity.Quantity = attributeBLL.Quantity;
                }
                IEnumerable<AttributeBLL> attributeBLLs = product.AttributeBLLs.Where(e => e.Id == 0);
                foreach (var item in attributeBLLs)
                {
                    OldProduct.TypeProductQuantities.Add(new TypeProductQuantity()
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
            using (var context = new SanitaryCartContext(_con))
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
                    NewProduct.TypeProductQuantities.Add(new TypeProductQuantity
                    {
                        AtributeType = item.AttributeId,
                        Price = item.Price,
                        Quantity = item.Quantity,
                        Value = item.AttributeId == ((byte)Enums.ProductType.NoneVariable) ? null : item.Value,
                        IsActive = true
                    });

                foreach (var item in product.Images)
                    NewProduct.Images.Add(new Image { Path = item, Type = product.Type });
                context.Products.Add(NewProduct);
                context.SaveChanges();

                return NewProduct.Id;
            }
        }
        public IEnumerable<ProductBLL> Search(string value)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var products = context.Products.AsNoTracking().Where(e => e.Code == value || e.Name.Contains(value))
                  .Include(e => e.TypeProductQuantities)
                  .Include(e => e.BrandIdFkNavigation).Include(e => e.Category).ThenInclude(e => e.Parent).ToList();
                return HelpherMethods.ToProductBLLs(products.AsQueryable());
            }
        }
        public bool Delete(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Product product = context.Products.FirstOrDefault(e => e.Id == Id);
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