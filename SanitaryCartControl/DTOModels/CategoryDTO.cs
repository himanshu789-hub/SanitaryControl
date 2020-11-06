using System;
using System.Collections.Generic;
namespace SanitaryCartControl.DTOModels
{
    public class CategoryDTO
    {
    public int Id{get;set;}
    public string Title{get;set;}
    public IEnumerable<CategoryDTO> Categories{get;set;} 
    }
    
}