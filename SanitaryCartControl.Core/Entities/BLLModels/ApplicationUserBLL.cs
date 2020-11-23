using System;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class ApplicationUserBLL
    {
        public Guid Id{get;set;}
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ImagePath { get; set; }
    }
}