using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.ViewModels
{
    public class ProductEditViewModel
    {
        public ProductDTO Product { get; set; }
        public string[] Images { get; set; }
        public string BreadCrumps{get;set;}
        public BrandBLL Brand{get;set;}
        public AttributeDTO[] Attributes { get; set; }
        
    }
}
