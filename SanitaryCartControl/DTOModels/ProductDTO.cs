using System;
using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl
{
    public class ProductDTO
    {

        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Code { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public int Quantity { get; set; }
        [Required(ErrorMessage="Please Select A Category")]
        public int Category_Id_FK { get; set; }

        [Required(ErrorMessage = "Please Select A Brand")]
        public int Brand_Id_FK { get; set; }

        public Tuple<int,string,int,decimal> Attributes{get;set;}
    }
}