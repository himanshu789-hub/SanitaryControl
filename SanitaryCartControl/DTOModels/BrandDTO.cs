using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;

namespace SanitaryCartControl.DTOModels
{
    public class BrandDTO
    {
        [BindRequired]
        public byte Id {get;set;}
        [Required]
        [Remote("CheckName","Brand",ErrorMessage="Name already in Use")]
        [RegularExpression(@"^[A-Z^0-9][a-z]+$",ErrorMessage=@"Name must be single word with first letter capital")]
        [MaxLength(50,ErrorMessage="Maximum Length Exceed")]
        public string Name{get;set;}
        [Required]
        public string ImagePath{get;set;}
    }
}