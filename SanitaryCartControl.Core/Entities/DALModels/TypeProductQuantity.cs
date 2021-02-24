using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class TypeProductQuantity
    {
        public int ProductIdFk { get; set; }
        public byte PiecesPerSet { get; set; }
        public decimal Price { get; set; }
        public byte AtributeType { get; set; }
        public string Value { get; set; }
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public bool IsPriceVisible{get;set;}

        public virtual AttributeType AtributeTypeNavigation { get; set; }
        public virtual Product ProductIdFkNavigation { get; set; }
    }
}
