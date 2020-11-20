using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class AttributeType
    {
        public AttributeType()
        {
            Image = new HashSet<Image>();
            Product = new HashSet<Product>();
            ProductType = new HashSet<ProductType>();
            TypeProductQuantity = new HashSet<TypeProductQuantity>();
        }

        public byte Id { get; set; }
        public string Type { get; set; }

        public virtual ICollection<Image> Image { get; set; }
        public virtual ICollection<Product> Product { get; set; }
        public virtual ICollection<ProductType> ProductType { get; set; }
        public virtual ICollection<TypeProductQuantity> TypeProductQuantity { get; set; }
    }
}
