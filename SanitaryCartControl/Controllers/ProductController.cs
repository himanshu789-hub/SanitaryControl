using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SanitaryCartControl.Core.Entities.Enums;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.Core.Contracts.Services;
using Microsoft.AspNetCore.Mvc.ModelBinding;

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
          return new OkObjectResult(_productService.GetProductType(CategoryId));
        }
        public IActionResult GetValues([BindRequired]ProductType type,[BindRequired]int categoryId)
        {
         _productService.GetAttrinuteValues(type,categoryId) 
        }
        public IActionResult Add()
        {
            var brands = _brandService.GetBrands();
            ViewBag.Brands = new SelectList(brands.Select(e => new { Id = e.Id, Name = e.Name }), "Id", "Name");
            return View(new ProductViewModel() { Images = null, Product = new ProductDTO() });
        }
    }
}