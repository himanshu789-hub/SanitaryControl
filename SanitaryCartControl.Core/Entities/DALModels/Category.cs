using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class Category
    {
        public Category()
        {
            Colors = new HashSet<Color>();
            Grades = new HashSet<Grade>();
            InverseParent = new HashSet<Category>();
            Kinds = new HashSet<Kind>();
            Materials = new HashSet<Material>();
            Products = new HashSet<Product>();
            Sizes = new HashSet<Size>();
        }

        public int Id { get; set; }
        public string Titlle { get; set; }
        public int? ParentId { get; set; }
        public string ImagePath { get; set; }

        public virtual Category Parent { get; set; }
        public virtual ProductType ProductType { get; set; }
        public virtual SeriesBrand SeriesBrand { get; set; }
        public virtual ICollection<Color> Colors { get; set; }
        public virtual ICollection<Grade> Grades { get; set; }
        public virtual ICollection<Category> InverseParent { get; set; }
        public virtual ICollection<Kind> Kinds { get; set; }
        public virtual ICollection<Material> Materials { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual SeriesHolderCategory SeriesHolderCategory { get; set; }
        public virtual ICollection<Size> Sizes { get; set; }
    }
}
