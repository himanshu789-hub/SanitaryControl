using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.ViewModels
{
    public class ItemViewModel
    {
        public bool IsSubCategory { get; set; }
        public IEnumerable<CategoryInfo> CategoryInfos{get;set;}
        public IEnumerable<ProductInfoBLL> ProductInfos{get;set;}
        public int ParentId{get;set;}
    }
}