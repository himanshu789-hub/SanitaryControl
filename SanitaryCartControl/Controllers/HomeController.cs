using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.ViewModels;
using System.Linq;
using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
namespace SanitaryCartControl.Controllers
{
    public class HomeController : Controller
    {
        readonly IBrandService _brandService;
        public HomeController(IBrandService brandService)
        {
            _brandService = brandService;
        }
        public IActionResult Index()
        {
            HomeViewModel homeViewModel =  new HomeViewModel();
            homeViewModel.Brands = _brandService.GetBrands().Select(e=>new KeyValuePair<string,string>(e.Name,e.ImagePath)).ToList();
            return View(homeViewModel);
        }

    }
}