using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class ProductType
    {
        public ProductType()
        {
            Product = new HashSet<Product>();
        }

        public byte Id { get; set; }
        public string Title { get; set; }

        public virtual ICollection<Product> Product { get; set; }
    }
}
