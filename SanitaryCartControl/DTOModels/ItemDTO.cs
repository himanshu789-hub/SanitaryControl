using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
namespace SanitaryCartControl.DTOModels
{
    public class ItemDTO
    {
        [Required]
        public bool IsSubCategory{get;set;}
        [BindRequired]
        public int Id{get;set;}
        public int Page{get;set;}
    }
}