using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Text;
namespace SanitaryCartControl.ViewModels
{
    class ProductViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        
        [BindNever]
        public DateTime DateAdded { get; set; }
        [BindNever]
        public DateTime DateUpdated { get; set; }
    }
}
