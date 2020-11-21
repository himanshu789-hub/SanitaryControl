using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using System.Linq;
using SanitaryCartControl.Extensions;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.Core.Contracts.Services;
namespace SanitaryCartControl.Controllers
{
    public class SeriesController : BaseController
    {
        readonly ISeriesService _seriesService;
        readonly IBrandService _brandService;
        public SeriesController(IHostEnvironment host, ISeriesService seriesService,IBrandService brandService) : base(host)
        {
            _seriesService = seriesService;
            _brandService = brandService;
        }
        string imagePath = @"/images/series";
        [HttpPost]
        public IActionResult Add(SeriesViewModel seriesViewModel)
        {
            ModelState.Remove("Series.Id");
            ModelState.Remove("Series.ImagePath");
            if (ModelState.IsValid)
            {
                int Id = _seriesService.AddSeries(Converters.ToSeriesBLL(seriesViewModel.Series));
                
                return Json(Id);
            }
            return View(seriesViewModel);
        }
        [HttpGet]
        public IActionResult Add(byte? brandId,int? categoryId,string categoryName)
        {
            if (brandId == null || categoryId == null)
                return View(new SeriesViewModel());
            else
            {
                SeriesViewModel seriesViewModel = new SeriesViewModel();
                seriesViewModel.Series.Brand_Id_Fk =(byte) brandId;
                seriesViewModel.Series.Category_Id_FK =(int) categoryId;
                ViewData.Add("Name",categoryName);
                seriesViewModel.Brands = _brandService.GetBrands();
                return View(seriesViewModel);
            }
        }
    }
}