using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Contracts.Services;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Linq;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.Http;
namespace SanitaryCartControl.Areas.Controllers
{
    [Area("Cms")]
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
        public IActionResult Edit(int Id)
        {
            string[] categoryToRootTitle = Converters.ToCategoryPathArray(_categoryService.GetAllAncestors(Id));
            ViewData.Add("CategoryToRootTitle", categoryToRootTitle);
            return View(_categoryService.GetById(Id));
        }
        [HttpPost]
        public IActionResult Edit(int? Id, IFormFile image)
        {
            if (ModelState.IsValid)
            {
                string prevImagePath = _categoryService.GetById(Id.Value).ImagePath;
                if (prevImagePath != null)
                    this.DeleteImage(prevImagePath);
                string NewImagePath = this.AddImage(image, _imagePath);
                _categoryService.UpdateImageById(Id.Value, NewImagePath);
            }
            IDictionary<string, object> dict = null;
            if (Id != null)
            {
                dict = new Dictionary<string, object>();
                dict.Add("Id", Id);
            }

            return View("Sucess", new MessageViewModel()
            {
                IsSuccess = false,
                Params = dict,
                Link = Url.Action("GetNonSeriesHolder", "Category", new { Areas = "Cms" })
            });
        }
    }
}