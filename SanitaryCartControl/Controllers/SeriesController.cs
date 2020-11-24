using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using System.Linq;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Razor.TagHelpers;
using SanitaryCartControl.Extensions;
using System.ComponentModel.DataAnnotations;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.Enums;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.Controllers
{

    [Authorize(Roles = ApplicationRoles.Both)]
    public class SeriesController : BaseController
    {
        readonly ISeriesService _seriesService;
        readonly IBrandService _brandService;
        readonly ICategoryService _categoryService;
        public SeriesController(IHostEnvironment host, ISeriesService seriesService, IBrandService brandService, ICategoryService categoryService) : base(host)
        {
            _seriesService = seriesService;
            _brandService = brandService;
            _categoryService = categoryService;
        }
        string imagePath = @"/images/series";

        [HttpGet]
        public IActionResult GetSeriesCategory()
        {
            return Json(_seriesService.GetCategory());
        }
        [HttpGet]
        public IActionResult Edit(int Id)
        {

            SeriesViewModel seriesViewModel = new SeriesViewModel();
            seriesViewModel.Brands = _brandService.GetBrands();
            seriesViewModel.Category = _seriesService.GetCategory();
            SeriesBLL seriesBLL = _seriesService.GetById(Id);
            if (seriesBLL == null)
                return View("Success", new MessageViewModel()
                {
                    IsSuccess = false,
                    Link = @Url.Action("Add")
                });


            seriesViewModel.Series = new SeriesDTO()
            {
                Id = seriesBLL.Id,
                ParentId = seriesBLL.Parent.Key,
                Brand_Id_Fk = seriesBLL.BrandId,
                Category_Id_FK = seriesBLL.Category.Value.Key,
                ImagePath = seriesBLL.ImagPath,
                Name = seriesBLL.Title
            };
            ViewData.Add("Name", seriesBLL.Parent.Value);
            return View(seriesViewModel);
        }
        [HttpPost]
        public IActionResult Edit(SeriesDTO series, IFormFile Image)
        {
            ModelState.RemoveIfPresent("Series.ImagePath");
            ModelState.RemoveIfPresent("Series.Image");

            if (Image != null)
            {
                string path = this.AddImage(Image, imagePath);
                series.ImagePath = path;
            }
            
            if (ModelState.IsValid)
            {

                bool IsUpdated = _seriesService.UpdateSeries(Converters.ToSeriesBLL(series));
                return View("Success", new MessageViewModel()
                {
                    IsSuccess = IsUpdated,
                    Link = Url.Action("ViewAll")
                });
            }
            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Link = Url.Action("ViewAll")
            });
        }
        [HttpGet]
        public IActionResult ViewAll(byte? brandId, int? categoryId, bool IsSecond)
        {

            ShowSeriesViewModel showSeriesViewModel = new ShowSeriesViewModel();
            showSeriesViewModel.Brands = _brandService.GetBrands();
            showSeriesViewModel.Category = _seriesService.GetCategory();

            if (IsSecond && brandId == null)
                ModelState.AddModelError("BrandId", "Please Select A Brand");
            if (IsSecond && categoryId == null)
                ModelState.AddModelError("CategoryId", "Please Select A Category");

            if (IsSecond && ModelState.IsValid)
                showSeriesViewModel.Series = _seriesService.GetByBrandAndParentId((byte)brandId, (int)categoryId);

            return View(showSeriesViewModel);
        }
        [HttpPost]
        public IActionResult Add(SeriesViewModel seriesViewModel)
        {
            ModelState.Remove("Series.Id");
            ModelState.Remove("Series.ImagePath");
            ModelState.Remove<SeriesViewModel>(expression => expression.Series.Category_Id_FK);
            if (ModelState.IsValid)
            {
                int Id = _seriesService.AddSeries(Converters.ToSeriesBLL(seriesViewModel.Series));
                IDictionary<string, object> values = new Dictionary<string, object>();
                values.Add("brandId", seriesViewModel.Series.Brand_Id_Fk);
                values.Add("parentId", seriesViewModel.Series.ParentId);
                return View("Success", new MessageViewModel()
                {
                    IsSuccess = true,
                    Link = @Url.Action("Add"),
                    Params = values
                });
            }
            return BadRequest();
        }
        [HttpGet]
        public IActionResult Add([FromQuery] byte? brandId, [FromQuery] int? parentId)
        {
            SeriesViewModel seriesViewModel = new SeriesViewModel();
            seriesViewModel.Brands = _brandService.GetBrands();
            seriesViewModel.Category = _seriesService.GetCategory();

            if (brandId == null || parentId == null)
            {
                return View(seriesViewModel);
            }
            else
            {
                seriesViewModel.Series = new SeriesDTO();
                seriesViewModel.Series.Brand_Id_Fk = (byte)brandId;
                seriesViewModel.Series.ParentId = (int)parentId;
                return View(seriesViewModel);
            }
        }
    }
}