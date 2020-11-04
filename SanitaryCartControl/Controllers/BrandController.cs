using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Contracts.Services;
using System.Collections.Generic;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using System;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.Controllers
{
  public class BrandController:Controller
  {
      IBrandService _brandService;
      IHostEnvironment _host;
      ILogger _logger;
      public BrandController(IBrandService brandService,ILogger<BrandController> logger,IHostEnvironment host)
      {
        _brandService = brandService;
        _logger = logger;
        _host = host;
      }
      [HttpGet]
      public IActionResult Edit(int Id)
      {
       BrandBLL brandBLL = _brandService.GetById(Id);     
       if(brandBLL!=null)
        return View(new BrandViewModel(){
          brand=new BrandDTO(){ Name=brandBLL.Name,Id=brandBLL.Id,ImagePath=brandBLL.ImagePath},
          logo=null
          });  
       else
        return Redirect("/Brand/GetAll");
      }
      
      const string brandPath = @"/images/brand";
      [NonAction]
      public bool RemoveFile(string filePath)
      {
        string absoluetPath = Path.Join(_host.ContentRootPath,"wwwroot",filePath);
           if(System.IO.File.Exists(absoluetPath))
           {
             System.IO.File.Delete(absoluetPath);
             return true;
           }
           return false;
      } 
      [HttpPost]
      public IActionResult Edit(BrandViewModel brandView)
      {
            if (ModelState.ContainsKey("logo"))
                ModelState.Remove("logo");
            if (ModelState.IsValid)
            {
                if (brandView.logo != null)
                {
                   this.RemoveFile(brandView.brand.ImagePath);
                   string path = this.UploadFile(brandView.logo);
                   brandView.brand.ImagePath = path;
                }
                _brandService.Update(new BrandBLL() { Id = brandView.brand.Id, ImagePath = brandView.brand.ImagePath, Name = brandView.brand.Name });
                return Redirect("/Brand/GetAll");
            }
          return View(brandView);
      }
      [HttpGet]
      public IActionResult GetAll()
      {      
        var Brands = _brandService.GetBrands();
        var Result = new List<BrandDTO>();
        foreach (var item in Brands)
        {
             Result.Add(new BrandDTO(){Id = item.Id,ImagePath=item.ImagePath,Name=item.Name});
        }
        return View(Result);
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
      
        var getRelativePath = Path.Combine(brandPath, System.Guid.NewGuid().ToString()+Path.GetExtension(logo.FileName));
        var FilePath = Path.Join(_host.ContentRootPath,"wwwroot",getRelativePath);
           try
           {
                using (var stream = new FileStream(FilePath, FileMode.Create))
                {
                    logo.CopyTo(stream);
                }
            }
           catch (System.Exception e)
           {
             throw new System.Exception("There was error while uploading file",e);
           }
          return getRelativePath;
      }
      [HttpGet]
      public IActionResult Add()
      {
           return View(new BrandViewModel());
      }
      [HttpPost]
      public IActionResult Add(BrandViewModel brandView)
      {
         if(ModelState.ContainsKey("Id"))
           ModelState.Remove("Id");
         if(ModelState.ContainsKey("ImagePath"))
           ModelState.Remove("ImagePath");
        
        if(ModelState.IsValid)
        {
           string path =   this.UploadFile(brandView.logo);
           _brandService.Create(new BrandBLL(){ImagePath=path,Name=brandView.brand.Name});
           return Redirect(@"\Brand\GetAll");
        }
        return View(brandView);
      }
      

      
  }
}