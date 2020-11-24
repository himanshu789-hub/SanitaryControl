using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.ViewModels
{
    public class LogInViewModel
    {
        [Required]
        public string UserName{get;set;}
        [Required]
        public string Password{get;set;}
    }
}