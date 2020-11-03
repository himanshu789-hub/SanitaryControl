using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.ViewModels
{
    public class BrandViewModel
    {

        public byte Id { get; set; }
        public string Name { get; set; }
        
        public string ImagePath { get; set; }
    }
}