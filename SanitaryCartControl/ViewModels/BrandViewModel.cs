using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Http;

using SanitaryCartControl.DTOModels;
namespace SanitaryCartControl.ViewModels
{
    public class BrandViewModel
    {
           public BrandDTO Brand{get;set;}
           public IFormFile Logo{get;set;}
    }
}