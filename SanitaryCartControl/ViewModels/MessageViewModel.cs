using System.Collections.Generic;
namespace SanitaryCartControl.ViewModels
{
    public class MessageViewModel
    {
        public string Link{get;set;}
        public bool IsSuccess{get;set;}
        public IDictionary<string,object> Params{get;set;}
    }
}