using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.AspNetCore.Authorization;

namespace SanitaryCartControl.Controllers
{
    [IgnoreAntiforgeryToken]
    public class ApiController:Controller
    {
    
    ICategoryService _categoryService;
        public ApiController(ICategoryService categoryService)
        {
             _categoryService = categoryService;
        }
      public JsonResult GetAllCategory()
      {
          return Json(_categoryService.GetCategoryListByBrandIdOption());
      }
    }
}