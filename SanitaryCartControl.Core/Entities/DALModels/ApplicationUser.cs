using Microsoft.AspNetCore.Identity;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public class ApplicationUser:IdentityUser
    {
        public string FirstName{get;set;}
        public string LastName{get;set;}
        public string ImagePath{get;set;}
    }
}