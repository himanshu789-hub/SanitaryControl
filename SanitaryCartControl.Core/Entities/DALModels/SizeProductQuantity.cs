using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class SizeProductQuantity
    {
        public string Size { get; set; }
        public int ProductIdFk { get; set; }
        public byte Type { get; set; }
        public byte Quantity { get; set; }

        public virtual Product Product { get; set; }
    }
}
