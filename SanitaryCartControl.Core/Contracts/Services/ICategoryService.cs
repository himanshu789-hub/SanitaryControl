using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ICategoryService
    {
         int? GetProductTypeById(int Id);
        IEnumerable<CategoryBLL> GetCategoryListByBrandIdOptionally(int? brandId=null);
        int GetImmediateNodeId(int categoryId);
        CategoryBLL GetById(int Id);
        bool UpdateImageById(int Id,string newImagePath);
        AncestorCategoryBLL GetAllAncestors(int Id);
        IEnumerable<CategoryBreadcrumbInfo> GetNonSeriesHolderBreadcrumps();
        IEnumerable<CategoryInfo> GetChildren(int Id);
    }
}