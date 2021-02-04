using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Miscellaneous.Models;
namespace SanitaryCartControl.ViewModels
{
    public class ItemViewModel
    {
        public bool IsEndCategory { get; set; }
        public IEnumerable<CategoryInfo> CategoryInfos{get;set;}
        public IEnumerable<ProductInfoBLL> ProductInfos{get;set;}
        public int ParentId{get;set;}
        public BreadcrumbInfo[] Breadcrumps;
    }
}