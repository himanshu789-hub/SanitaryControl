using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.ViewModels;

namespace SanitaryCartControl
{
    public class MessageController:Controller
    {
        [NonAction]
        protected IActionResult Success(string link)
        {
            return View("Success", new MessageViewModel()
            {
                IsSuccess = true,
                Link = Url.Action(link)
            });
        }

        [NonAction]
        protected IActionResult Failed(string link)
        {
            return View("Success", new MessageViewModel()
            {
                IsSuccess = false,
                Link = Url.Action("ViewAll")
            });
        }
    }
}