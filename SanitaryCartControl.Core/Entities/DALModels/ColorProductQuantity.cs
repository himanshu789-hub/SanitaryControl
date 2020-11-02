using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class ColorProductQuantity
    {
        public int ProductIdFk { get; set; }
        public byte Quantity { get; set; }
        public byte Type { get; set; }
        public string Color { get; set; }

        public virtual Product Product { get; set; }
    }
}
