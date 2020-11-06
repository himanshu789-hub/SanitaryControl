using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class TypeProductQuantity
    {
        public int ProductIdFk { get; set; }
        public byte Quantity { get; set; }
        public byte Type { get; set; }
        public string Color { get; set; }
        public decimal Price { get; set; }
        public string Size { get; set; }
        public string Kind { get; set; }

        public virtual Product Product { get; set; }
    }
}
