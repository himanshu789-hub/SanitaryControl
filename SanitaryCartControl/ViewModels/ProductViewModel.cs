using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
namespace SanitaryCartControl.ViewModels
{
    public class ProductViewModel
    {
        public ProductDTO Product { get; set; }
        public IFormFileCollection Images { get; set; }
        public IList<AttributeDTO> Attributes { get; set; }
    }
}
