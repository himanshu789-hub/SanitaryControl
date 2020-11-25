using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class ProductEditDTO
    {
        public ProductDTO Product{get;set;}
      
        [Required]
        public IEnumerable<AttributeDTO> Attributes{get;set;}
        
        public IFormFileCollection Images{get;set;}
    }
}