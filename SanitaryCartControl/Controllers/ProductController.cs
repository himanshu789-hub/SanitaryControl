using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SanitaryCartControl.Controllers
{
    public class ProductController : Controller
    {
        public JsonResult GetCategory(int CategoryId,int level)
        {

        }
        public IActionResult Add()
        {
            return View();
        }
    }
}