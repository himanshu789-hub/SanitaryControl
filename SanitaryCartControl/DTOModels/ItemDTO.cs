using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
namespace SanitaryCartControl.DTOModels
{
    public class ItemDTO
    {
        [Required]
        public bool? IsEndCategory{get;set;}
        [Required]
        public int? CategoryId{get;set;}
        public int? Page{get;set;}
    }
}