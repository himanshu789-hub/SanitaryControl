using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.DTOModels;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.ViewModels
{
    public class SeriesViewModel
    {
        public SeriesDTO Series{get;set;}
        [Required(ErrorMessage="Please Select A Image To Upload")]
        public IFormFile Image{get;set;}
        public IEnumerable<BrandBLL> Brands{get;set;}

        public IEnumerable<KeyValuePair<int, string>> Category { get; set; }
    }
}