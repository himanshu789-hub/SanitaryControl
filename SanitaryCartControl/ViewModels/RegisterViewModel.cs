using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
namespace SanitaryCartControl.ViewModels
{
    public class RegisterViewModel
    {
        [BindRequired]
        public Guid Id{get;set;}
        
        [Required(ErrorMessage="Please Specify First Name")]
        [RegularExpression("[A-Z][A-Za-z]+",ErrorMessage="Please Enter Valid Name")]
        public string FirstName{get;set;}

        [Required(ErrorMessage = "Please Specify Last Name")]
        [RegularExpression("[A-Z][A-Za-z]+",ErrorMessage = "Please Enter Valid Name")]
        public string LastName{get;set;}

        [Required(ErrorMessage = "Please Specify A User Name")]
        [RegularExpression(@"^(?=.{6,21}$)(?![_.@])(?!.*[_.@]{2})[a-zA-Z0-9@._]+(?<![@_.])$", ErrorMessage = @"@_. must be in between and 0-9a-z are valid characters")]
        [MinLength(6,ErrorMessage="Please Enter Minimum Six Character Username")]
        [MaxLength(21,ErrorMessage="Please Enter Maximum Twenty One Character Username")]
        public string UserName{get;set;}
        
        [MinLength(6,ErrorMessage="Password Must Be Atleast 6 Character Long")]
        [Required(ErrorMessage="Please Enter Password")]
        public string Password{get;set;}
        [Compare("Password",ErrorMessage="Pasword and Confimation Do Not Match")]
        public string ConfirmPassword{get;set;} 
    }
}