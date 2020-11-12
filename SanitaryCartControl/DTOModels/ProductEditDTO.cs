using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class ProductEditDTO
    {
        [BindRequired]
        public int Id{get;set;}
        public string Desription{get;set;}
        public IEnumerable<AttributeDTO> Attributes{get;set;}
        public IFormCollection Images{get;set;}
    }
}