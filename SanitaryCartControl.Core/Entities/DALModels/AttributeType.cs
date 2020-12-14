using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class AttributeType
    {
        public AttributeType()
        {
            Images = new HashSet<Image>();
            ProductTypes = new HashSet<ProductType>();
            Products = new HashSet<Product>();
            TypeProductQuantities = new HashSet<TypeProductQuantity>();
        }

        public byte Id { get; set; }
        public string Type { get; set; }

        public virtual ICollection<Image> Images { get; set; }
        public virtual ICollection<ProductType> ProductTypes { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<TypeProductQuantity> TypeProductQuantities { get; set; }
    }
}
