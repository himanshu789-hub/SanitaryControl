using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SanitaryCartControl.Core.Entities.Enums;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.Helphers.Converters;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using SanitaryCartControl.Extensions;
namespace SanitaryCartControl.Controllers
{
    public class ProductController : Controller
    {
        readonly IProductService _productService;
        readonly IBrandService _brandService;
        public ProductController(IProductService productService, IBrandService brandService)
        {

            _brandService = brandService;
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
        public IActionResult Edit(ProductViewModel productViewModel)
        {

            return View();
        }
        [HttpGet]
        public IActionResult Edit(int Id)
        {
            ProductEditViewModel productViewModel = new ProductEditViewModel();
            ProductBLL productBLL = _productService.GetById(Id);
            productViewModel.Product = Converters.ToProductDTO(productBLL);
            productViewModel.Attributes = productBLL.AttributeBLLs;
            foreach (var item in productBLL.RootPath.Ancestors)
            {
              productViewModel.BreadCrumps+=item.Title+" > ";
            }
            productViewModel.BreadCrumps+=productBLL.RootPath.Title;
            productViewModel.Images = productBLL.Images;
            return View(productViewModel);
        }
        public IActionResult GetValues([BindRequired] ProductType type, [BindRequired] int categoryId)
        {
            return Json(_productService.GetAttrinuteValues(type, categoryId));
        }

        [HttpPost]
        public IActionResult Add(ProductViewModel productViewModel)
        {
            ModelState.RemoveIfPresent("Product.Id");
            for (int i = 0; i < productViewModel.Attributes.Count(); i++)
                ModelState.RemoveIfPresent($"Attributes[{i}].Id");
            if (ModelState.IsValid)
            {
                return Json("Success");
            }
            throw new Exception("Error While Adding Product");
        }
        public IActionResult Add()
        {
            var brands = _brandService.GetBrands();
            ViewBag.Brands = new SelectList(brands.Select(e => new { Id = e.Id, Name = e.Name }), "Id", "Name");
            return View(new ProductViewModel() { Images = null, Product = new ProductDTO() });
        }
    }
}