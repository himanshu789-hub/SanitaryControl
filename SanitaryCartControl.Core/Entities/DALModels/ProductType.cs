using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class ProductType
    {
        public byte AttributeIdFk { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual AttributeType AttributeIdFkNavigation { get; set; }
        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
