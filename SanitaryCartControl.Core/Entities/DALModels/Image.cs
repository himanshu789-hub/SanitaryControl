using System;
using System.Collections.Generic;

#nullable disable

namespace SanitaryCartControl.Core
{
    public partial class Image
    {
        public int Id { get; set; }
        public string Path { get; set; }
        public int ProductIdFk { get; set; }
        public byte Type { get; set; }

        public virtual Product ProductIdFkNavigation { get; set; }
        public virtual AttributeType TypeNavigation { get; set; }
    }
}
