using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class KindProductQuantity
    {
        public int ProductIdFk { get; set; }
        public byte Type { get; set; }
        public string Kind { get; set; }
        public byte Quantity { get; set; }

        public virtual Product Product { get; set; }
    }
}
