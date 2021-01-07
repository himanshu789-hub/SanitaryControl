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
using System.Threading;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.Enums;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.Areas.Controllers
{

    [Area("Cms")]

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
        [IgnoreAntiforgeryToken]
        public JsonResult CheckNameExistsUnderParentIdAndBrandId(SeriesNameRemoteValidate seriesNameRemote)
        {
            ModelState.RemoveIfPresent("Series.Id");

            if (ModelState.IsValid)
            {
                string name = seriesNameRemote.name;
                int ParentId = seriesNameRemote.ParentId;
                int BrandId = seriesNameRemote.BrandId;
                int? Id = seriesNameRemote.Id;
                bool IsNameExists =_seriesService.IsNameExists(name, ParentId, BrandId, Id); 
                return Json(!IsNameExists);
            }
            throw new System.Exception("Didn't Obtain Name Or ParentId while checking series name");
        }
        [HttpPost]
        public IActionResult Edit(SeriesDTO series, IFormFile Image)
        {
            ModelState.RemoveIfPresent("Series.ImagePath");
            ModelState.RemoveIfPresent("Series.Image");

            if (Image != null)
            {
                Thread DeleteThread = new Thread(() => this.DeleteImage(series.ImagePath));
                DeleteThread.Start();
                string path = this.AddImage(Image, imagePath);
                series.ImagePath = path;
            }
            IDictionary<string, object> values = new Dictionary<string, object>();
            SeriesBLL seriesBLL = _seriesService.GetById(series.Id);
            values.Add("brandId", series.Brand_Id_Fk);
            values.Add("categoryId", seriesBLL.Parent.Key);
            values.Add("IsSecond", true);
            if (ModelState.IsValid)
            {
                bool IsUpdated = _seriesService.UpdateSeries(Converters.ToSeriesBLL(series));
                return View("Success", new MessageViewModel()
                {
                    IsSuccess = IsUpdated,
                    Link = Url.Action("ViewAll"),
                    Params = values
                });
            }
            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Params = values,
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
            IDictionary<string, object> values = new Dictionary<string, object>();
            values.Add("brandId", seriesViewModel.Series.Brand_Id_Fk);
            values.Add("parentId", seriesViewModel.Series.ParentId);
            if (ModelState.IsValid)
            {
                seriesViewModel.Series.ImagePath = this.AddImage(seriesViewModel.Image,imagePath);
                int Id = _seriesService.AddSeries(Converters.ToSeriesBLL(seriesViewModel.Series));
                return View("Success", new MessageViewModel()
                {
                    IsSuccess = true,
                    Link = @Url.Action("Add"),
                    Params = values
                });
            }
            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Link = @Url.Action("Add"),
                Params = values
            });
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
                ViewData.Add("ShouldVisible", brandId != null && parentId != null);
                seriesViewModel.Series = new SeriesDTO();
                seriesViewModel.Series.Brand_Id_Fk = (byte)brandId;
                seriesViewModel.Series.ParentId = (int)parentId;
                return View(seriesViewModel);
            }
        }
    }
}