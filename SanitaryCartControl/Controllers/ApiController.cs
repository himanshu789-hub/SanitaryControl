using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SanitaryCartControl.Core.Contracts.Services;

namespace SanitaryCartControl.Controllers
{
    public class ApiController : Controller
    {
        ICategoryService _categoryService;
        public ApiController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        public JsonResult GetAllCategory()
        {
            return Json(_categoryService.GetCategoryListByBrandIdOptionally());
        }
        [ResponseCache(Duration = 360, Location = ResponseCacheLocation.Any)]
        public JsonResult GetSufficientCategory()
        {
            return Json(_categoryService.GetCategoryListUptoFirstLevel());
        }
        public override void OnActionExecuted(ActionExecutedContext context)
        {
            if (context.Exception != null)
            {
                context.Result = new StatusCodeResult(Microsoft.AspNetCore.Http.StatusCodes.Status500InternalServerError);
            }
        }

    }
}