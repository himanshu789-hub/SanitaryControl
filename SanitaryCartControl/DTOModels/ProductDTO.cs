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
        public string Name { get; set; }
        [Required]
        [RegularExpression("^[A-Z][-A-Z0-9]+[A-Z0-9]$",ErrorMessage="Please Enter Valid Code")]
        public string Code { get; set; }
        [Required]
        public string Description { get; set; }
        
        [Required(ErrorMessage="Please Select A Category")]
        public int Category_Id_FK { get; set; }
        [Required(ErrorMessage = "Please Select A Brand")]
        public int Brand_Id_FK { get; set; }
        
    }
}