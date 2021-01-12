using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class ProductBLL 
    {
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
        public AncestorCategoryBLL RootPath{get;set;}

        public IEnumerable<string> GetBreadCrumps()
        {
            ICollection<string> breadcrumps = new List<string>();
            foreach (var ancestor in RootPath.Ancestors)
            {
                  breadcrumps.Add(ancestor.Title);     
            }
            return breadcrumps;
        }
    }
}