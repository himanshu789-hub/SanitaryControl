using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class SeriesBrand
    {
        public short Id { get; set; }
        public byte? BrandIdFk { get; set; }
        public int? CategoryIdFk { get; set; }
        public bool? IsActive { get; set; }

        public virtual Brand BrandIdFkNavigation { get; set; }
        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
