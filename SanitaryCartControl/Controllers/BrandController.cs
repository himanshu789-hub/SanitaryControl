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
using SanitaryCartControl.Extensions;
using Microsoft.AspNetCore.Authorization;
using SanitaryCartControl.Core.Entities.Enums;
using System.Threading;
namespace SanitaryCartControl.Controllers
{
    [Authorize(Roles=ApplicationRoles.Both)]
    public class BrandController : Controller
    {
        IBrandService _brandService;
        IHostEnvironment _host;
        ILogger _logger;
        public BrandController(IBrandService brandService, ILogger<BrandController> logger, IHostEnvironment host)
        {
            _brandService = brandService;
            _logger = logger;
            _host = host;
        }
        [HttpGet]
        public IActionResult Edit(int Id)
        {
            BrandBLL brandBLL = _brandService.GetById(Id);
            if (brandBLL != null)
                return View(new BrandViewModel()
                {
                    Brand = new BrandDTO() { Name = brandBLL.Name, Id = brandBLL.Id, ImagePath = brandBLL.ImagePath },
                    Logo = null
                });
            else
                return Redirect("/Brand/GetAll");
        }

        const string brandPath = @"/images/brand";
        [NonAction]
        public void RemoveFile(string filePath)
        {
            string absoluetPath = Path.Join(_host.ContentRootPath, "wwwroot", filePath);
            if (System.IO.File.Exists(absoluetPath))
            {
                System.IO.File.Delete(absoluetPath);
            }
        }
        [HttpPost]
        public IActionResult Edit(BrandViewModel brandView)
        {
            if (ModelState.ContainsKey("logo"))
                ModelState.Remove("logo");
            if(brandView.Brand?.Name!=null)
            {
               string name = brandView.Brand.Name;
               BrandBLL brandBLL = _brandService.GetById(brandView.Brand.Id);
               if(_brandService.IsNameExists(name,brandBLL.Id))
               {
                   ModelState.AddModelError("Duplicate Entry","Name Already Exists");
               } 
            }
            if (ModelState.IsValid)
            {
                if (brandView.Logo != null)
                {
                    new Thread(()=>this.RemoveFile(brandView.Brand.ImagePath)).Start();
                    this.RemoveFile(brandView.Brand.ImagePath);
                    string path = this.UploadFile(brandView.Logo);
                    brandView.Brand.ImagePath = path;
                }
                _brandService.Update(new BrandBLL() { Id = brandView.Brand.Id, ImagePath = brandView.Brand.ImagePath, Name = brandView.Brand.Name });
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
                Result.Add(new BrandDTO() { Id = item.Id, ImagePath = item.ImagePath, Name = item.Name });
            }
            return View(Result);
        }
        [HttpPost]
        public JsonResult CheckName(string name)
        {
            var result = _brandService.IsNameExists(name);
            return Json(!result);
        }

        [NonAction]
        string UploadFile(IFormFile logo)
        {

            var getRelativePath = Path.Combine(brandPath, System.Guid.NewGuid().ToString() + Path.GetExtension(logo.FileName));
            var FilePath = Path.Join(_host.ContentRootPath, "wwwroot", getRelativePath);
            try
            {
                using (var stream = new FileStream(FilePath, FileMode.Create))
                {
                    logo.CopyTo(stream);
                }
            }
            catch (System.Exception e)
            {
                throw new System.Exception("There was error while uploading file", e);
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
            ModelState.RemoveIfPresent("Brand.Id");
            ModelState.RemoveIfPresent("Brand.ImagePath");
            if (brandView.Logo == null)
                ModelState.AddModelError("Logo", "Logo Required");
            if(brandView.Brand?.Name!=null && _brandService.IsNameExists(brandView.Brand.Name))
            ModelState.AddModelError("Duplicate Entry","Name Already Exists");
            if (ModelState.IsValid)
            {
                
                string path = this.UploadFile(brandView.Logo);
                _brandService.Create(new BrandBLL() { ImagePath = path, Name = brandView.Brand.Name });
                return Redirect(@"\Brand\GetAll");
            }
            return View(brandView);
        }



    }
}