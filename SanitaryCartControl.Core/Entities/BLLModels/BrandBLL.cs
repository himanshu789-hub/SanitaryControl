using System.ComponentModel.DataAnnotations.Schema;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class BrandBLL
    {
      [Column("BrandId")]
      public byte Id{get;set;}
      [Column("BrandName")]
      public string Name{get;set;}
      [Column("BrandImagePath")]
      public string ImagePath{get;set;}
    }
}