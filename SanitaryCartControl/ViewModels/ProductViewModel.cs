using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
namespace SanitaryCartControl.ViewModels
{
    public class ProductViewModel
    {
      public ProductDTO Product { get; set; }
      public IFormCollection Images{get;set;}

    }
}
