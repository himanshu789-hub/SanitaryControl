using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Contracts.Services;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Linq;
using SanitaryCartControl.Miscellaneous.Converters;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.Core.Entities.Enums;
using Microsoft.AspNetCore.Authorization;

namespace SanitaryCartControl.Areas.Controllers
{
    [Area("Cms")]
    [Authorize(Roles = ApplicationRoles.Both)]
    public class CategoryController : BaseController
    {
        readonly ICategoryService _categoryService;
        string _imagePath = @"/images/category";
        public CategoryController(IHostEnvironment hostingEnvironment, ICategoryService categoryService) : base(hostingEnvironment)
        {
            _categoryService = categoryService;
        }
        
        public IActionResult GetNonSeriesHolder()
        {
            return View(_categoryService.GetNonSeriesHolderBreadcrumps().ToArray());
        }
        public IActionResult Edit([Microsoft.AspNetCore.Mvc.ModelBinding.BindRequired] int Id)
        {
            if (!ModelState.IsValid)
                return BadRequest();
            return View(_categoryService.GetById(Id));
        }
        [HttpPost]
        public IActionResult Edit(int? Id, [FromForm] IFormFile Image)
        {
            if (ModelState.IsValid)
            {
                string prevImagePath = _categoryService.GetById(Id.Value).ImagePath;
                if (prevImagePath != null)
                    this.DeleteImage(prevImagePath);
                string NewImagePath = this.AddImage(Image, _imagePath);
                bool IsUpdatedSuccesfull = _categoryService.UpdateImageById(Id.Value, NewImagePath);
                if (IsUpdatedSuccesfull)
                    return View("Success", new MessageViewModel()
                    {
                        IsSuccess = true,
                        Link = Url.Action("GetNonSeriesHolder", "Category", new { Areas = "Cms" })
                    });
            }
            IDictionary<string, object> dict = null;
            if (Id != null)
            {
                dict = new Dictionary<string, object>();
                dict.Add("Id", Id);
            }

            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Params = dict,
                Link = Url.Action("GetNonSeriesHolder", "Category", new { Areas = "Cms" })
            });
        }
    }
}