using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class TypeProductQuantity
    {
        public int ProductIdFk { get; set; }
        public byte Quantity { get; set; }
        public decimal Price { get; set; }
        public byte AtributeType { get; set; }
        public string Value { get; set; }
        public int Id { get; set; }
        public bool? IsActive { get; set; }

        public virtual AttributeType AtributeTypeNavigation { get; set; }
        public virtual Product ProductIdFkNavigation { get; set; }
    }
}
