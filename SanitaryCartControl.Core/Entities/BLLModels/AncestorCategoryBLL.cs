using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class AncestorCategoryBLL
    {
      public int Id{get;set;}
      public string Title{get;set;}
      public bool IsEndCategory{get;set;}
      [NotMapped]
      public ICollection<AncestorCategoryBLL> Ancestors{get;set;}
    }
}