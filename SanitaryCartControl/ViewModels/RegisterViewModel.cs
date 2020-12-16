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
        [RegularExpression(@"[A-Za-z@0-9\.]*", ErrorMessage = @"A Username cannot contain any special character except @")]
        [MinLength(6,ErrorMessage="Please Enter Minimum Six Character Username")]
        public string UserName{get;set;}
        [MinLength(6,ErrorMessage="Password Must Be Atleast 6 Character Long")]
          [Required(ErrorMessage="Please Enter Password")]
        public string Password{get;set;}
        [Compare("Password",ErrorMessage="Pasword and Confimation Do Not Match")]
        public string ConfirmPassword{get;set;} 
    }
}