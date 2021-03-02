using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.ViewModels;
using SanitaryCartControl.DTOModels;
using SanitaryCartControl.Core.Contracts.Services;
using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Miscellaneous.Models;
using SanitaryCartControl.Miscellaneous.Converters;
using SanitaryCartControl.Miscellaneous.Utilities;
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
                ItemViewModel.ParentId = Item.CategoryId.Value;
           
                if (Item.Page.HasValue && Item.Page.Value == 0)
                {
                    BreadcrumbInfo[] categoryBreadcrumbWithLink = Converters.GetBreadcrumbsFromAncestorsBLL(_categoryService.GetAllAncestors(Item.CategoryId.Value));
                    ItemViewModel.Breadcrumps = categoryBreadcrumbWithLink;
                }
                ItemViewModel.IsEndCategory = Item.IsEndCategory.Value;

                if (Item.IsEndCategory.Value)
                {
                    if (Item.Page.HasValue)
                    {
                        const int NUMBER_OF_PRODUCT_AT_A_TIME = 10;
                        ItemViewModel.ParentId = Item.CategoryId.Value;

                        IEnumerable<ProductInfoBLL> productInfos = _productService.GetProductsByCategoryId(Item.CategoryId.Value, Item.Page.Value, NUMBER_OF_PRODUCT_AT_A_TIME);
                        ItemViewModel.ProductInfos = productInfos;
                        if (Item.Page == 0)
                            return View(ItemViewModel);
                        else
                            return new JsonResult(productInfos);
                    }
                }
                else
                {
                    ItemViewModel.CategoryInfos = _categoryService.GetChildren(ItemViewModel.ParentId);
                    return View(ItemViewModel);
                }
            }
            return BadRequest();
        }
        public ActionResult GetProduct(int Id)
        {
            if (ModelState.IsValid)
            {
                ProductBLL product = _productService.GetById(Id);

                return View(product);
            }
            return BadRequest();
        }

    }
}