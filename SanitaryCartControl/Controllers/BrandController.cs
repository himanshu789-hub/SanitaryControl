using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Services;
using System.Collections.Generic;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.Extensions.Logging;
namespace SanitaryCartControl.Controllers
{
  public class BrandController:Controller
  {
      BrandService _brandService;
      ILogger _logger;
      public BrandController(BrandService brandService,ILogger<BrandService> logger)
      {
        _brandService = brandService;
        _logger = logger;
      }
      [HttpGet]
      public IActionResult GetAll()
      {      
        var Brands = _brandService.GetBrands();
        var Result = new List<BrandViewModel>();
        foreach (var item in Brands)
        {
             Result.Add(new BrandViewModel(){Id = item.Id,ImagePath=item.ImagePath,Name=item.Name});
        }
        return View("Brand",Result);
      }
      [HttpPost]
      public JsonResult CheckName(string name)
      {
       var result =  _brandService.IsNameExists(name);
       return Json(!result);
      }
      [NonAction]
      string  UploadFile(IFormFile logo)
      {
          var FilePath =  Path.Combine(Directory.GetCurrentDirectory(),@"wwwroot/images","logo");
            using (var stream = new FileStream(FilePath, FileMode.Create))
            {
              try
              {
                    logo.CopyTo(stream);
              }
              catch (System.IO.IOException e)
              {
               _logger.LogError(new EventId().Id,e,"Error during brand file writing");                 
              }
            }
         return FilePath;
      }
      [HttpPost]
      public IActionResult Add(BrandDTO brand)
      {
        if(ModelState.IsValid)
        {
           string path =   this.UploadFile(brand.Logo);
           _brandService.Create(new BrandBLL(){ImagePath=path,Name=brand.Name});
           return Redirect(@"\Brand\GetAll");
        }
        return View();
      }
      

      
  }
}