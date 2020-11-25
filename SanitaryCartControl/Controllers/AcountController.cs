using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.AspNetCore.Identity;
using SanitaryCartControl.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Authorization;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.Enums;
using System.Linq;
namespace SanitaryCartControl.Controllers
{

    public class AccountController : Controller
    {
        readonly SignInManager<ApplicationUser> _signInManager;
        readonly UserManager<ApplicationUser> _userManager;
        public AccountController(SignInManager<ApplicationUser> signInManager, UserManager<ApplicationUser> userManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
        }

        [Authorize(Roles = ApplicationRoles.Both)]
        [HttpPost]
        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(AccountController.LogIn), "Account");
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult LogIn(LogInViewModel logIn, string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                var result = _signInManager.PasswordSignInAsync(logIn.UserName, logIn.Password, false, false).Result;
                if (result.Succeeded)
                {
                    if (returnUrl != null)
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


        [HttpGet]
        [Authorize(Roles = ApplicationRoles.Administration)]
        public IActionResult Register()
        {
            return View(new RegisterViewModel());
        }
        [HttpPost]
        [Authorize(Roles = ApplicationRoles.Administration)]
        public async Task<IActionResult> Register(RegisterViewModel registerViewModel)
        {
            ModelState.Remove<RegisterViewModel>(e => e.Id);

            if (ModelState.IsValid)
            {
                ApplicationUser user = new ApplicationUser()
                {
                    FirstName = registerViewModel.FirstName,
                    LastName = registerViewModel.LastName,
                    UserName = registerViewModel.UserName,
                };
                var result = await _userManager.CreateAsync(user, registerViewModel.Password);
                if (result.Succeeded)
                {
                    var result1 = await _userManager.AddToRoleAsync(user, ApplicationRoles.Manager);
                    if (result1.Succeeded)
                    {
                        return View("Success", new MessageViewModel()
                        {
                            IsSuccess = true,
                            Link = @Url.Action("ViewAll"),
                        });
                    }
                }
                else
                    return View("Success", new MessageViewModel()
                    {
                        IsSuccess = false,
                        Link = @Url.Action("Add"),
                    });
            }

            return  View(registerViewModel);
        }
        [HttpGet]
        [Authorize(Roles=ApplicationRoles.Administration)]
        public async Task<IActionResult> ViewAll()
        {
           var result = (await _userManager
           .GetUsersInRoleAsync(ApplicationRoles.Manager));

            return View(result);
        }
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}