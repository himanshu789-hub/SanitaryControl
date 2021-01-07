using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Contracts.Services;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.Controllers
{
    public class ItemController : Controller
    {
        readonly ICategoryService _categoryService;
        readonly IProductService _productService;

        public ItemController(ICategoryService categoryService, IProductService productService)
        {
            _categoryService = categoryService;
            _productService = productService;
        }
        public ActionResult Get(ItemDTO Item)
        {
            if (ModelState.IsValid)
            {
                if (Item.IsSubCategory)
                {
                    ItemViewModel ItemViewModel = new ItemViewModel();
                    ItemViewModel.IsSubCategory = true;
                    ItemViewModel.CategoryInfos = _categoryService.GetChildren(Item.Id, Item.Page, 10);
                    return View(ItemViewModel);
                }
                else
                {
                    ItemViewModel ItemViewModel = new ItemViewModel();
                    ItemViewModel.IsSubCategory = false;

                    IEnumerable<ProductInfoBLL> productInfos = _productService.GetProductsByCategoryId(Item.Id, Item.Page, 10);
                    ItemViewModel.ProductInfos = productInfos;
                    if (Item.Page == 0)
                        return View(ItemViewModel);
                    else
                        return new JsonResult(productInfos);
                }
            }
            return BadRequest();
        }
    }
}