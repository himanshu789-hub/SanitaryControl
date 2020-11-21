using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
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
