using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ICategoryService
    {
        IEnumerable<CategoryBLL> GetCategoryList(int brandId);
        int GetRootId(int categoryId);
    }
}