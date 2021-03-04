using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.ViewModels;

namespace SanitaryCartControl
{
    public abstract class MessageController : Controller
    {
        [NonAction]
        protected IActionResult Success(string link)
        {
            return View("Success", new MessageViewModel()
            {
                IsSuccess = true,
                Link = link,
                Message = "User Deleted Successfully"
            });
        }

        [NonAction]
        protected IActionResult Failed(string link)
        {
            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Message = "User Deleted After You Recieve Posted Value or It May Not Exists",
                Link = link
            });
        }
    }
}