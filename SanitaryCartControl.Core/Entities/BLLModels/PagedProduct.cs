using System.Collections.Generic;
using System.Linq;
namespace SanitaryCartControl.Core.Entities.BLLModels
{
    public class PagedProduct
    {
        public IEnumerable<ProductBLL> Products { get; set; }
        public int TotalCount { get; set; }
        public int GeneralPageSize{get;set;}
        public int PageNumber { get; set; }
        public int CurrentPageSize { get { return this.Products!=null?this.Products.Count():0; } }
    }
}