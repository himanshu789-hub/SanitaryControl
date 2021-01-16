using System.Collections.Generic;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class CategoryBLL
    {
        public int Id { get; set; }
        public bool IsEndPoint{get;set;}
        public string Title { get; set; }
        public int? ParentId{get;set;}
        public string ImagePath{get;set;}
        public ICollection<CategoryBLL> Categories { get; set; }
    }
}