using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class AttributeDTO
    {
        [BindRequired]
        public int Id{get;set;}
        [BindRequired]
        public byte Type{get;set;}
        [Required]
        public string Value{get;set;}
        [Required]
        public byte PiecesPerSet{get;set;}
        
        [BindRequired]   
        [Range(type:typeof(decimal),"0","99999.99999", ErrorMessage = "Value for {0} must be between {1} and {2}")]
        public decimal Price{get;set;}
        [Required]
        public bool IsActive{get;set;}
        [Required]
        public bool IsPriceVisible{get;set;}
    }
}