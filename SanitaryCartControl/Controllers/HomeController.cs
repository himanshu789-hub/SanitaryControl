using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.ViewModels;
using System.Linq;
using System.Collections.Generic;
using SanitaryCartControl.Miscellaneous.Constnants;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.Extensions.Configuration;
namespace SanitaryCartControl.Controllers
{
    public class HomeController : Controller
    {
        readonly IBrandService _brandService;
        readonly ICategoryService _categoryService;
        readonly IConfiguration _config;
        public HomeController(IBrandService brandService, IConfiguration configuration, ICategoryService categoryService)
        {
            _brandService = brandService;
            _config = configuration;
            _categoryService = categoryService;
        }
        public IActionResult Error()
        {
            return View();
        }
        public IActionResult Index()
        {
            HomeViewModel homeViewModel = new HomeViewModel();

            homeViewModel.Brands = _brandService.GetBrands().Select(e => new KeyValuePair<string, string>(e.Name, e.ImagePath)).ToList();
            string[] Images = _config.GetSection("SliderImages").Get<string[]>();
            if (Images == null)
            {
                throw new System.Exception("HomeSliderImage AppSetting Value Cannot Be Null");
            }
            homeViewModel.BaseCategories = _categoryService.GetBaseCategories();
            return View(homeViewModel);
        }
        public IActionResult AboutUs()
        {
            return View();
        }

    }
}