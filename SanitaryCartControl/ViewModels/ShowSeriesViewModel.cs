using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.ViewModels
{
    public class ShowSeriesViewModel
    {
        public IEnumerable<BrandBLL> Brands{get;set;}
        public IEnumerable<KeyValuePair<int,string>> Category{get;set;}
    }
}