using Microsoft.AspNetCore.Mvc;

namespace SanitaryCartControl.Controllers
{
  public class HomeController:Controller
  {
      public IActionResult Index()
      {
          return View();
      }
  }
}