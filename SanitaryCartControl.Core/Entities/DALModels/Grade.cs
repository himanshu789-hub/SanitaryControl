using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class Grade
    {
        public byte Id { get; set; }
        public string Grade1 { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
