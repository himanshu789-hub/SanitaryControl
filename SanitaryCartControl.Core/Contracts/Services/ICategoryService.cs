using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ICategoryService
    {
         int? GetProductTypeById(int Id);
        IEnumerable<CategoryBLL> GetCategoryList(int brandId);
        int GetImmediateNodeId(int categoryId);
        AncestorCategoryBLL GetAllAncestors(int Id);
    }
}