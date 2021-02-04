using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Linq;
using SanitaryCartControl.Miscellaneous.Utilities;
using SanitaryCartControl.Miscellaneous.Models;
using System.Text;

namespace SanitaryCartControl.Areas.Miscellaneous
{
    public sealed class Converters
    {
        public static ProductDTO ToProductDTO(ProductBLL product)
        {
            ProductDTO productDTO = new ProductDTO();
            productDTO.Brand_Id_FK = product.Brand.Id;
            productDTO.Category_Id_FK = product.RootPath.Id;
            productDTO.Code = product.Code;
            productDTO.Description = product.Description;
            productDTO.Id = product.Id;
            productDTO.Name = product.Name;
            productDTO.Type = product.Type;
            productDTO.DateAdded = product.DateAdded;
            productDTO.DateUpdated = product.DateUpdated;
            return productDTO;
        }
        public static BreadcrumbInfo[] ToCategoryPathBreadcrumbs(AncestorCategoryBLL ancestorCategoryBLLs)
        {
            ICollection<BreadcrumbInfo> categoryPathResult = new List<BreadcrumbInfo>();
            foreach (var item in ancestorCategoryBLLs.Ancestors.Reverse())
            {
                categoryPathResult.Add(new BreadcrumbInfo(item.Title, Utilities.GetActionLinkForCategoryOrProduct(item.Id,!item.IsEndCategory,false)));
            }
            BreadcrumbInfo breadcrumbInfo = new BreadcrumbInfo(ancestorCategoryBLLs.Title, Utilities.GetActionLinkForCategoryOrProduct(ancestorCategoryBLLs.Id, !ancestorCategoryBLLs.IsEndCategory, false));

            categoryPathResult.Add(breadcrumbInfo);
            return categoryPathResult.ToArray();
        }
        public static IEnumerable<AttributeDTO> ToAttributeDTOList(IEnumerable<AttributeBLL> attributeBLLs)
        {
            if (attributeBLLs == null)
                throw new System.ArgumentNullException();

            ICollection<AttributeDTO> Attributes = new List<AttributeDTO>();
            foreach (var item in attributeBLLs)
            {
                Attributes.Add(new AttributeDTO()
                {
                    Id = item.Id,
                    AttributeId = item.AttributeId,
                    Price = item.Price,
                    Quantity = item.Quantity,
                    Value = item.Value,
                    IsActive = item.IsActive
                });
            }
            return Attributes;
        }
        public static IEnumerable<AttributeBLL> ToAttributeBLLList(IEnumerable<AttributeDTO> attributes)
        {
            if (attributes == null)
                throw new System.ArgumentNullException();

            ICollection<AttributeBLL> Attributes = new List<AttributeBLL>();
            foreach (var item in attributes)
            {
                Attributes.Add(new AttributeBLL()
                {
                    Id = item.Id,
                    AttributeId = item.AttributeId,
                    Price = item.Price,
                    Quantity = item.Quantity,
                    Value = item.Value,
                    IsActive = item.IsActive
                });
            }
            return Attributes;
        }

        public static ProductBLL ToProductBLL(ProductDTO productDTO, IEnumerable<AttributeDTO> attribute, string[] images)
        {
            ProductBLL product = new ProductBLL()
            {
                AttributeBLLs = Converters.ToAttributeBLLList(attribute),
                Brand = new BrandBLL() { Id = productDTO.Brand_Id_FK },
                Code = productDTO.Code,
                Images = images,
                Description = productDTO.Description,
                Name = productDTO.Name,
                Type = attribute.ElementAt(0).AttributeId,
                RootPath = new AncestorCategoryBLL() { Id = productDTO.Category_Id_FK },
                DateAdded = productDTO.DateAdded,
                Id = productDTO.Id,
                DateUpdated = productDTO.DateUpdated
            };
            return product;
        }

        public static SeriesBLL ToSeriesBLL(SeriesDTO series)
        {
            return new SeriesBLL()
            {
                BrandId = (byte)series.Brand_Id_Fk,
                Category = null,
                Parent = new KeyValuePair<int, string>(series.ParentId.Value, null),
                Id = series.Id,
                ImagPath = series.ImagePath,
                Title = series.Name,

            };
        }
        public static string ToBreadcrumbByCategoryBLL(CategoryBLL category, char seperator)
        {
            int breadcrumbLength = (category.Categories == null ? 0 : category.Categories.Count()) + 1;
            StringBuilder breadcrumbBuilder = new StringBuilder();
            if(category.Categories!=null)          
            foreach (var item in category.Categories.Reverse())
            {
                breadcrumbBuilder.Append(item.Title).Append(seperator+" ");
            }
            breadcrumbBuilder.Append(category.Title);
            return breadcrumbBuilder.ToString();

        }
        
    }
}