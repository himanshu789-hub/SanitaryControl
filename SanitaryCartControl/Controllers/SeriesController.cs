using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using System.Linq;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Razor.TagHelpers;
using SanitaryCartControl.Extensions;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.Core.Contracts.Services;
namespace SanitaryCartControl.Controllers
{
    public class SeriesController : BaseController
    {
        readonly ISeriesService _seriesService;
        readonly IBrandService _brandService;
        public SeriesController(IHostEnvironment host, ISeriesService seriesService, IBrandService brandService) : base(host)
        {
            _seriesService = seriesService;
            _brandService = brandService;
        }
        string imagePath = @"/images/series";

        [HttpGet]
        public IActionResult GetSeriesCategory()
        {
            return Json(_seriesService.GetCategory());
        }
        [HttpGet]
        public IActionResult GetByParentId([BindRequired] int Id)
        {
            return Json(_seriesService.GetByParentId(Id));

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
                return new OkObjectResult(Id);
            }
            return BadRequest();
        }
        [HttpGet]
        public IActionResult Add(byte? brandId, int? categoryId, string categoryName)
        {
            if (brandId == null || categoryId == null)
            {
                SeriesViewModel seriesViewModel = new SeriesViewModel();
                seriesViewModel.Brands = _brandService.GetBrands();
                seriesViewModel.Category = _seriesService.GetCategory();
                return View(seriesViewModel);
            }
            else
            {
                SeriesViewModel seriesViewModel = new SeriesViewModel();
                seriesViewModel.Series.Brand_Id_Fk = (byte)brandId;
                seriesViewModel.Series.Category_Id_FK = (int)categoryId;
                ViewData.Add("Name", categoryName);
                seriesViewModel.Brands = _brandService.GetBrands();
                return View(seriesViewModel);
            }
        }
    }
}