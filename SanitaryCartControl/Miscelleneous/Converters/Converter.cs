using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Linq;
namespace SanitaryCartControl.Helphers.Converters
{
    public class Converters{
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
        public static IEnumerable<AttributeDTO> ToAttributeDTOList(IEnumerable<AttributeBLL> attributeBLLs)
        {
            if(attributeBLLs==null)
            throw new System.ArgumentNullException();

            ICollection<AttributeDTO> Attributes =  new List<AttributeDTO>();
            foreach (var item in attributeBLLs)
            {
                Attributes.Add(new AttributeDTO(){
                    Id=item.Id,
                    AttributeId=item.AttributeId,
                    Price=item.Price,
                    Quantity=item.Quantity,
                    Value=item.Value,IsActive=item.IsActive
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
                    Value = item.Value
                });
            }
            return Attributes;
        }

        public static ProductBLL ToProductBLL(ProductDTO productDTO,IEnumerable<AttributeDTO> attribute,string[] images)
        {
            ProductBLL product = new ProductBLL(){
            AttributeBLLs = Converters.ToAttributeBLLList(attribute),
            Brand=new BrandBLL(){Id=productDTO.Brand_Id_FK},
            Code=productDTO.Code,
            Images=images,
            Description=productDTO.Description,
            Name=productDTO.Name,
            Type=attribute.ElementAt(0).AttributeId,
            RootPath = new AncestorCategoryBLL(){Id=productDTO.Category_Id_FK},
            DateAdded=productDTO.DateAdded
            };
            return product;
        }
        public static SeriesBLL ToSeriesBLL(SeriesDTO series)
        {
            return new SeriesBLL(){
                BrandId=(byte)series.Brand_Id_Fk,
                CategoryId=series.Category_Id_FK,
                Id=series.Id,
                ImagPath=series.ImagePath,
                Title=series.Name
            };
        }
    }
}