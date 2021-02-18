using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class ProductBLL 
    {
        [Key]
        public int Id{get;set;}
        public byte Type{get;set;}
        public string Description{get;set;}
        public string Code{get;set;}
        public string Name{get;set;}
        public BrandBLL Brand{get;set;}
        public DateTime DateAdded{get;set;}
        public DateTime DateUpdated{get;set;}
        public string[] Images{get;set;}
        public IEnumerable<AttributeBLL> AttributeBLLs{get;set;} 
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public AncestorCategoryBLL RootPath{get;set;}
        public bool IsActive{get;set;}
    }
}