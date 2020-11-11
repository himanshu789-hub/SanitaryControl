using System;

namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class ProductBLL 
    {
        public int Id{get;set;}
        public int Type{get;set;}
        public string Description{get;set;}
        public string Code{get;set;}
        public string Name{get;set;}
        public BrandBLL Brand{get;set;}
        public DateTime DateAdded{get;set;}
        public DateTime DateUpdated{get;set;}
        public

        public AncestorCategoryBLL RootPath{get;set;}

    }
}