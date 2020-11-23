using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Authorization;
using SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Controllers
{
    [Authorize(Roles = ApplicationRoles.Administration)]
    public class HomeController : Controller
    {
        private readonly ILogger _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
       
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {

             ErrorViewModel errorViewModel = new ErrorViewModel();
             var ex = HttpContext.Features.Get<IExceptionHandlerPathFeature>();
             errorViewModel.Message = "A Unexpected Error Occured";
             errorViewModel.StatusCode = 500;
             if(ex!=null)
             {
                 errorViewModel.Message = ex.Error.Message;
             }
             return View(errorViewModel);
        }

    }
}
