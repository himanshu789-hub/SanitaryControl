using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class AttributeDTO
    {
        [BindRequired]
        public int Id{get;set;}
        [BindRequired]
        public int AttributeId{get;set;}
        [Required]
        public string Value{get;set;}
        [BindRequired]
        public int Quantity{get;set;}
        [BindRequired]   
        public decimal Price{get;set;}

    }
}