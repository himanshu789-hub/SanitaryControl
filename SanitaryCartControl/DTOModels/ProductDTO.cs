using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.DTOModels
{
    public class ProductDTO
    {

        public int Id { get; set; }
        [Required]
        [MaxLength(80, ErrorMessage = "Must Be Atmost 80 Character")]
        public string Name { get; set; }
        [Required]
        [RegularExpression("^[A-Z][- A-Z0-9]+[A-Z0-9]$",ErrorMessage="Please Enter Valid Code")]
        [MaxLength(20,ErrorMessage="Must Be Atmost 20 Character")]
        public string Code { get; set; }
        [Required]
        [MaxLength(800,ErrorMessage="Maximum Length Exceed")]
        public string Description { get; set; }
        [Required(ErrorMessage="Please Select A Category")]
        [Range(1,Int32.MaxValue,ErrorMessage="Please, Select A Category")]
        public int Category_Id_FK { get; set; }
        [Required(ErrorMessage = "Please Select A Brand")]
        public byte Brand_Id_FK { get; set; }
        [BindRequired]
        public DateTime DateAdded{get;set;}
        [BindRequired]
        public DateTime DateUpdated{get;set;}
        [BindRequired]
        public byte Type{get;set;}
        
    }
}