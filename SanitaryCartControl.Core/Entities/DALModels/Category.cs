using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class Category
    {
        public Category()
        {
            Color = new HashSet<Color>();
            InverseParent = new HashSet<Category>();
            Product = new HashSet<Product>();
            SeriesBrand = new HashSet<SeriesBrand>();
        }

        public int Id { get; set; }
        public string Titlle { get; set; }
        public int? ParentId { get; set; }
        public string ImagePath { get; set; }

        public virtual Category Parent { get; set; }
        public virtual ICollection<Color> Color { get; set; }
        public virtual ICollection<Category> InverseParent { get; set; }
        public virtual ICollection<Product> Product { get; set; }
        public virtual ICollection<SeriesBrand> SeriesBrand { get; set; }
    }
}
