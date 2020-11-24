using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class SeriesBLL
    {
        public int Id{get;set;}
        public string Title{get;set;}
        public byte BrandId{get;set;}
        public KeyValuePair<int,string>? Category{get;set;}
        public KeyValuePair<int, string> Parent { get; set; }
        public string ImagPath{get;set;}
        
    }
}