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
        [RegularExpression(@"[^ ][A-Z ]+",ErrorMessage=@"Name must contain only space seperated capatilize words")]
        [MaxLength(50,ErrorMessage="Maximum Length Exceed")]
        public string Name{get;set;}
        [Required]
        public string ImagePath{get;set;}
    }
}