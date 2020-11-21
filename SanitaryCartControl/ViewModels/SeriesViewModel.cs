using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.DTOModels;
namespace SanitaryCartControl.ViewModels
{
    public class SeriesViewModel
    {
        public SeriesDTO Series{get;set;}
        public IFormFile Image{get;set;}
        public IEnumerable<BrandBLL> Brands{get;set;}
    }
}