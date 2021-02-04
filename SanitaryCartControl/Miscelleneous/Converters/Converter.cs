using System.Collections.Generic;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Linq;
using SanitaryCartControl.Miscellaneous.Utilities;
using SanitaryCartControl.Miscellaneous.Models;
namespace SanitaryCartControl.Miscellaneous.Converters
{
    public sealed class Converters
    {

        public static BreadcrumbInfo[] GetBreadcrumbsFromAncestorsBLL(AncestorCategoryBLL ancestorCategoryBLL)
        {
            ICollection<BreadcrumbInfo> breadcrumbInfos = new List<BreadcrumbInfo>();
            
            if (ancestorCategoryBLL != null)
            {
                
                foreach (var item in ancestorCategoryBLL.Ancestors.Reverse())
                {
                    string categoryLink = Utilities.Utilities.GetActionLinkForCategoryOrProduct(item.Id,item.IsEndCategory,false);
                    BreadcrumbInfo breadcrumb = new BreadcrumbInfo(item.Title, categoryLink);
                    breadcrumbInfos.Add(breadcrumb);
                }
            }
            breadcrumbInfos.Add(new BreadcrumbInfo(ancestorCategoryBLL.Title,Utilities.Utilities.GetActionLinkForCategoryOrProduct(ancestorCategoryBLL.Id,ancestorCategoryBLL.IsEndCategory,false)));
            return breadcrumbInfos.ToArray();
        }
    }
}