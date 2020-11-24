using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.AspNetCore.Identity;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Controllers
{
    public class AccountController : Controller
    {
        readonly SignInManager<ApplicationUser> _signInManager;
        public AccountController(SignInManager<ApplicationUser> signInManager)
        {
            _signInManager = signInManager;
        }
        [Authorize(Roles=ApplicationRoles.Both)]
        [HttpPost]
        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(AccountController.LogIn), "Account");
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult LogIn(LogInViewModel logIn,string returnUrl=null)
        {
            if (ModelState.IsValid)
            {
                var result = _signInManager.PasswordSignInAsync(logIn.UserName, logIn.Password, false, false).Result;
                if (result.Succeeded)
                {
                    if(returnUrl!=null)
                    return LocalRedirect(returnUrl);
                    return LocalRedirect(@"/Home/Index");
                }
            }

            ModelState.Clear();
            ModelState.AddModelError("InValidCredentials", "Username or Password is Invalid");
            return View(logIn);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult LogIn(string returnUrl = null)
        {
            if (returnUrl != null)
                return LocalRedirect(returnUrl);
            return View();
        }
    }
}