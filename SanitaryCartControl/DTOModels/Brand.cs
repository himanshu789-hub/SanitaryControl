using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
namespace SanitaryCartControl.DTOModels
{
    public class BrandDTO
    {
        [Required]
        [Remote("CheckName","Brand",ErrorMessage="Name already in Use")]
        [RegularExpression(@"^[A-Z^0-9][a-z]+$",ErrorMessage="Name not valid")]
        public string Name{get;set;}
        [Required]
        public IFormFile Logo{get;set;}
    }
}