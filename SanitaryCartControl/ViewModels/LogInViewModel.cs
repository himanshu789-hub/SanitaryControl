using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.ViewModels
{
    public class LogInViewModel
    {
        [Required]
        [RegularExpression(@"^[^ ][A-Za-z_@0-9\.]*$")]
        public string UserName{get;set;}
        [Required]
        [MinLength(6)]
        
        public string Password{get;set;}
    }
}