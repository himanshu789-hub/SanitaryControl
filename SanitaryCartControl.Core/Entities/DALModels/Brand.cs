using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class Brand
    {
        public Brand()
        {
            Product = new HashSet<Product>();
            SeriesBrand = new HashSet<SeriesBrand>();
        }

        public byte Id { get; set; }
        public string Name { get; set; }
        public string ImagePath { get; set; }

        public virtual ICollection<Product> Product { get; set; }
        public virtual ICollection<SeriesBrand> SeriesBrand { get; set; }
    }
}
