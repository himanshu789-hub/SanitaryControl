using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class Brand
    {
        public Brand()
        {
            Products = new HashSet<Product>();
            SeriesBrands = new HashSet<SeriesBrand>();
        }

        public byte Id { get; set; }
        public string Name { get; set; }
        public string ImagePath { get; set; }

        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<SeriesBrand> SeriesBrands { get; set; }
    }
}
