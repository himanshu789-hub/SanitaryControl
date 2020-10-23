using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Text;
using SanitaryCartControl.Constant;
namespace SanitaryCartControl.ViewModels
{
    public class ProductViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public GSTRate GSTRate { get; set; }
        public int Category_Id_FK { get; set; } 
        [BindNever]
        public DateTime DateAdded { get; set; }
        [BindNever]
        public DateTime DateUpdated { get; set; }
    }
}
