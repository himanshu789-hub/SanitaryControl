using System.ComponentModel.DataAnnotations;
namespace SanitaryCartControl.ViewModels
{
    public class LogInViewModel
    {
        [Required]
        [RegularExpression(@"^(?=.{6,21}$)(?![_.@])(?!.*[_.@]{2})[a-zA-Z0-9@._]+(?<![@_.])$")]
        public string UserName{get;set;}
        [Required]
        [MinLength(6)]
        
        public string Password{get;set;}
    }
}