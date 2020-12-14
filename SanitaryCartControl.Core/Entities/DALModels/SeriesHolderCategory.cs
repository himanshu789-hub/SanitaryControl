using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class SeriesHolderCategory
    {
        public int Id { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
