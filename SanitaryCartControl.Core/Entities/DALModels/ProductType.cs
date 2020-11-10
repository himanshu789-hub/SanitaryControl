using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class ProductType
    {
        public byte AttributeIdFk { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual AttributeType AttributeIdFkNavigation { get; set; }
        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
