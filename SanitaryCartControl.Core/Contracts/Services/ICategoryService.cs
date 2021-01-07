using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ICategoryService
    {
         int? GetProductTypeById(int Id);
        IEnumerable<CategoryBLL> GetCategoryList(int? brandId=null);
        int GetImmediateNodeId(int categoryId);
        AncestorCategoryBLL GetAllAncestors(int Id);
        IEnumerable<CategoryInfo> GetChildren(int Id,int Page,int Count);
    }
}