using System.Collections.Generic;
using System.Linq;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class PagedProduct
    {
        public IEnumerable<ProductBLL> Products { get; set; }
        public int TotalCount { get; set; }
        public int PageSize{get;set;}
        public int PageIndex { get; set; }
        public int CurrentTotal { get { return this.Products.Count(); } }
    }
}