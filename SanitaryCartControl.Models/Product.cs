using Microsoft.VisualBasic.CompilerServices;
using SanitaryCartControl.Constant;
using System;

namespace SanitaryCartControl.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public GSTRate GSTRate { get; set; }
        public DateTime DateAdded { get; set; }
        public DateTime DateUpdated { get; set; }
     }
}
