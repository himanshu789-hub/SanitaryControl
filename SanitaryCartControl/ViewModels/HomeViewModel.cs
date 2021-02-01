using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.ViewModels
{
    public class HomeViewModel
    {
        public IEnumerable<KeyValuePair<string,string>> Brands;
        public string[] Images{get;set;}
        public IEnumerable<CategoryInfo> BaseCategories{get;set;}
    }
}