using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class Color
    {
        public byte Id { get; set; }
        public string Title { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
