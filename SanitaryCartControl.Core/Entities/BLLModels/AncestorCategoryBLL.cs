using System.Collections.Generic;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class AncestorCategoryBLL
    {
      public int Id{get;set;}
      public string Title{get;set;}
      public bool IsEndCategory{get;set;}
      public ICollection<AncestorCategoryBLL> Ancestors{get;set;}
    }
}