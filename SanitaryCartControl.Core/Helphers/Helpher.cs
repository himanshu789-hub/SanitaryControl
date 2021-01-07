using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Entities.DALModels;
using System.Collections.Generic;
using System.Linq;
namespace SanitaryCartControl.Core.Helpher
{

    public class HelpherMethods
    {
        public static bool IsEfCoreExceptions(System.Exception e)
        {
            if (e is Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException)
            {
                return true;
            }
            else if (e is Microsoft.EntityFrameworkCore.DbUpdateException)
            {
                return true;
            }
            else
                return false;
        }
        public static ProductBLL ToProductBLL(Product product, AncestorCategoryBLL ancestors)
        {
            if (product == null || ancestors == null)
                throw new System.ArgumentNullException();
            if (product.BrandIdFkNavigation == null || product.TypeProductQuantities == null)
                throw new System.NullReferenceException();

            ProductBLL productBLL = new ProductBLL();
            productBLL.Id = product.Id;
            productBLL.Type = product.Type;
            productBLL.Name = product.Name;
            productBLL.Brand = HelpherMethods.ToBrandBLL(product.BrandIdFkNavigation);
            productBLL.Description = product.Description;
            productBLL.DateUpdated = product.DateUpdated;
            productBLL.DateAdded = product.DateAdded;
            productBLL.Name = product.Name;
            productBLL.Code = product.Code;
            productBLL.RootPath = ancestors;
            productBLL.Images = product.Images.Select(e => e.Path).ToArray();
            productBLL.AttributeBLLs = HelpherMethods.ToAttributeBLL(product.TypeProductQuantities);
            return productBLL;
        }

        public static IEnumerable<ProductBLL> ToProductBLLs(IQueryable<Product> products)
        {
            if (products == null || products.Where(e => e.BrandIdFkNavigation == null || e.TypeProductQuantities == null || e.BrandIdFkNavigation == null).Count() > 0)
            {
                throw new System.ArgumentNullException();
            }

            ICollection<ProductBLL> productBLLs = new List<ProductBLL>();
            foreach (var product in products)
            {
                ProductBLL productBLL = new ProductBLL()
                {
                    Id = product.Id,
                    Type = product.Type,
                    Name = product.Name,
                    Description = product.Description,
                    Brand = HelpherMethods.ToBrandBLL(product.BrandIdFkNavigation),
                    Code = product.Code,
                    RootPath = new AncestorCategoryBLL()
                    {
                        Id = product.Category.Id,
                        Title = product.Category.Titlle,
                        Ancestors = new List<AncestorCategoryBLL>()
                    },
                    AttributeBLLs = HelpherMethods.ToAttributeBLL(product.TypeProductQuantities)
                };
                var element = product.Category.Parent;
                while (element != null)
                {
                    productBLL.RootPath.Ancestors.Add(new AncestorCategoryBLL()
                    {
                        Ancestors = null,
                        Id = element.Id,
                        Title = element.Titlle
                    });
                    element = element.Parent;
                }
                productBLLs.Add(productBLL);
            }
            return productBLLs;
        }

        public static BrandBLL ToBrandBLL(Brand brand)
        {
            return new BrandBLL() { Id = brand.Id, ImagePath = brand.ImagePath, Name = brand.Name };
        }
        public static IEnumerable<AttributeBLL> ToAttributeBLL(IEnumerable<TypeProductQuantity> items)
        {
            ICollection<AttributeBLL> attributeBLLs = new List<AttributeBLL>();
            foreach (var item in items)
            {
                attributeBLLs.Add(new AttributeBLL()
                {
                    Id = item.Id,
                    AttributeId = item.AtributeType,
                    Price = item.Price,
                    Quantity = item.Quantity,
                    Value = item.Value,
                    IsActive = (bool)item.IsActive
                });
            }
            return attributeBLLs;
        }
        public static IEnumerable<SeriesBLL> ToSeriesBLL(IQueryable<SeriesBrand> series)
        {
            if (series == null || series.Where(e => e.CategoryIdFkNavigation == null).Count() > 0)
                throw new System.ArgumentNullException();

            ICollection<SeriesBLL> seriesBLLs = new List<SeriesBLL>();
            foreach (var item in series)
            {
                seriesBLLs.Add(new SeriesBLL()
                {
                    Id = item.Id,
                    BrandId = (byte)item.BrandIdFk,
                    Title = item.CategoryIdFkNavigation.Titlle,
                    Category = new KeyValuePair<int, string>(item.CategoryIdFkNavigation.Id,item.CategoryIdFkNavigation.Titlle),
                    ImagPath = item.CategoryIdFkNavigation.ImagePath
                });
            }
            return seriesBLLs;
        }

        public static SeriesBLL ToSeriesBLL(SeriesBrand item)
        {
            if (item == null || item.CategoryIdFkNavigation == null || item.CategoryIdFkNavigation.Parent==null)
                throw new System.ArgumentNullException();

            ICollection<SeriesBLL> seriesBLLs = new List<SeriesBLL>();
            return new SeriesBLL()
            {
                Id = item.Id,
                BrandId = (byte)item.BrandIdFk,
                Title = item.CategoryIdFkNavigation.Titlle,
                Parent=new KeyValuePair<int, string>(item.CategoryIdFkNavigation.Parent.Id,item.CategoryIdFkNavigation.Parent.Titlle),
                Category = new KeyValuePair<int, string>(item.CategoryIdFkNavigation.Id,item.CategoryIdFkNavigation.Titlle),
                ImagPath = item.CategoryIdFkNavigation.ImagePath
            };
        }

    }
}