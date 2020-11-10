using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class ProductDTO
    {

        public int Id { get; set; }
        [Required]
        [RegularExpression("^[A-Z][a-z]+$",ErrorMessage="Name is not valid")]
        public string Name { get; set; }
        [Required]
        public string Code { get; set; }
        [Required]
        public string Description { get; set; }
        
        [Required(ErrorMessage="Please Select A Category")]
        public int Category_Id_FK { get; set; }
        [Required(ErrorMessage = "Please Select A Brand")]
        public int Brand_Id_FK { get; set; }
        
    }
}