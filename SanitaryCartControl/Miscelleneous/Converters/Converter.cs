using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
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
            productDTO.DateAdded = product.DateAdded;
            productDTO.DateUpdated = product.DateUpdated;
            return productDTO;
        }
        // public static IEnumerable<AttributeDTO> ToAttributeDTOList(IEnumerable<AttributeBLL> attributeBLLs)
        // {
        //     if(attributeBLLs==null)
        //     throw new System.ArgumentNullException();

        //     ICollection<AttributeDTO> Attributes =  new List<AttributeDTO>();
        //     foreach (var item in attributeBLLs)
        //     {
        //         Attributes.Add(new AttributeDTO(){
        //             Id=item.Id,AttributeId=item.AttributeId,Price=item.Price,Quantity=item.Quantity,Value=item.Value});
        //     }
        //     return Attributes;
        // }
    }
}