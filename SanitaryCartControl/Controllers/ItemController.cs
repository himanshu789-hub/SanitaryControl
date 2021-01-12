using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using SanitaryCartControl.Helphers.Converters;
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
                ItemViewModel ItemViewModel = new ItemViewModel();
                ItemViewModel.Breadcrumps = Converters.ToCategoryPathArray(_categoryService.GetAllAncestors(Item.Id));
                ItemViewModel.ParentId = Item.Id;

                if (Item.IsSubCategory)
                {
                    ItemViewModel.IsSubCategory = true;
                    ItemViewModel.CategoryInfos = _categoryService.GetChildren(Item.Id, Item.Page, 10);
                    return View(ItemViewModel);
                }
                else
                {
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
        public ActionResult GetProduct(int Id)
        {
            if (ModelState.IsValid)
            {
                return View(_productService.GetById(Id));
            }
            return BadRequest();
        }

    }
}