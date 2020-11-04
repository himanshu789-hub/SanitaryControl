using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Http;

using SanitaryCartControl.DTOModels;
namespace SanitaryCartControl.ViewModels
{
    public class BrandViewModel
    {
           public BrandDTO brand{get;set;}
           public IFormFile logo{get;set;}
    }
}