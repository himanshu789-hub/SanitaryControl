using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using SanitaryCartControl.Core.Entities.Enums;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using SanitaryCartControl.Extensions;
using Microsoft.Extensions.Hosting;
using PagedList.Mvc;
using PagedList;
namespace SanitaryCartControl.Controllers
{
    public class ProductController : Controller
    {
        readonly IProductService _productService;
        readonly IBrandService _brandService;
        readonly IHostEnvironment _env;
        string imagesPath = @"/images/products";
        public ProductController(IProductService productService, IBrandService brandService, IHostEnvironment env)
        {
            _brandService = brandService;
            _env = env;
            _productService = productService;
        }

        [HttpGet]
        public IActionResult GetCategory([FromQuery][BindRequired] int brandId)
        {
            return Json(_productService.GetCategoryList(brandId));
        }
        public IActionResult GetProductType([FromQuery][BindRequired] int CategoryId)
        {
            return Json(_productService.GetProductType(CategoryId));
        }

        [HttpPost]
        public IActionResult Edit(ProductEditDTO productEditDTO)
        {
            return View();
        }
        [HttpGet]
        public IActionResult Edit(int Id)
        {
            ProductEditViewModel productViewModel = new ProductEditViewModel();
            ProductBLL productBLL = _productService.GetById(Id);
            productViewModel.Product = Converters.ToProductDTO(productBLL);
            productViewModel.Brand = productBLL.Brand;
            productViewModel.Attributes = Converters.ToAttributeDTOList(productBLL.AttributeBLLs).ToArray();
            foreach (var item in productBLL.RootPath.Ancestors)
            {
                productViewModel.BreadCrumps += item.Title + " > ";
            }
            productViewModel.BreadCrumps += productBLL.RootPath.Title;
            productViewModel.Images = productBLL.Images;
            return View(productViewModel);
        }
        public IActionResult GetValues([BindRequired] ProductType type, [BindRequired] int categoryId)
        {
            return Json(_productService.GetAttrinuteValues(type, categoryId));
        }

        [NonAction]
        string[] AddImages(IFormFileCollection files)
        {
            string[] images = new string[files.Count];
            int i = 0;
            foreach (var file in files)
            {

                var getRelativePath = Path.Combine(imagesPath,
                System.Guid.NewGuid().ToString() + Path.GetExtension(file.FileName));
                var FilePath = Path.Join(_env.ContentRootPath, "wwwroot", getRelativePath);

                using (var stream = new FileStream(FilePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                images[i++] = FilePath;
            }
            return images;
        }
        [HttpPost]
        public IActionResult Add(ProductViewModel productViewModel)
        {
            ModelState.RemoveIfPresent("Product.Id");
            for (int i = 0; i < productViewModel.Attributes.Count(); i++)
            {
                ModelState.RemoveIfPresent($"Attributes[{i}].Id");
                ModelState.RemoveIfPresent($"Attributes[{i}].IsActive");
            }
            if (ModelState.IsValid)
            {
                int productId = _productService
                .Add(Converters.ToProductBLL(productViewModel.Product,
                productViewModel.Attributes,
                this.AddImages(productViewModel.Images)));
                return Redirect(@"/Product/Edit/" + productId);
            }
            throw new Exception("Error While Adding Product");
        }
        [HttpGet]
        public IActionResult Add()
        {
            var brands = _brandService.GetBrands();
            ViewBag.Brands = new SelectList(brands.Select(e => new { Id = e.Id, Name = e.Name }), "Id", "Name");
            return View(new ProductViewModel() { Images = null, Product = new ProductDTO() });
        }
        [HttpGet]
        public IActionResult Search([FromQuery] string search, int? page)
        {
            if (search == null || search.Length == 0)
            {
                return View(null);
            }
            return View(_productService.Search(search).ToPagedList(page ?? 1, 40));
        }

    }

}