using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class Product
    {
        public Product()
        {
            Image = new HashSet<Image>();
            TypeProductQuantity = new HashSet<TypeProductQuantity>();
        }

        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime DateAdded { get; set; }
        public bool IsActive { get; set; }
        public DateTime DateUpdated { get; set; }
        public int CategoryId { get; set; }
        public byte Type { get; set; }
        public byte BrandIdFk { get; set; }

        public virtual Brand BrandIdFkNavigation { get; set; }
        public virtual Category Category { get; set; }
        public virtual AttributeType TypeNavigation { get; set; }
        public virtual ICollection<Image> Image { get; set; }
        public virtual ICollection<TypeProductQuantity> TypeProductQuantity { get; set; }
    }
}
