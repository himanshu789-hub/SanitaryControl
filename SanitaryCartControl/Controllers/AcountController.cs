using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.AspNetCore.Identity;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Mvc;
namespace SanitaryCartControl.Controllers
{
    public class AccountController : Controller
    {
        readonly SignInManager<ApplicationUser> _signInManager;
        public AccountController(SignInManager<ApplicationUser> signInManager)
        {
            _signInManager = signInManager;
        }
        [HttpPost]
        public IActionResult LogIn(LogInViewModel logIn)
        {
            if(ModelState.IsValid)
            {
               var result = _signInManager.PasswordSignInAsync(logIn.UserName,logIn.Password,false,false).Result;
               if(result.Succeeded)
               {
                  return LocalRedirect(@"/Home/Index");
               }
               else
               ModelState.AddModelError("InValidCredentials","Username or Password is Invalid");
            }
            return View(logIn);
        }
        [HttpGet]
        public IActionResult LogIn()
        {
            return View();
        }
    }
}