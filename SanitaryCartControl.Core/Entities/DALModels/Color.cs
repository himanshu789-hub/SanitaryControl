using System;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Entities.DALModels
{
    public partial class Color
    {
        public byte Id { get; set; }
        public string Title { get; set; }
        public int CategoryIdFk { get; set; }

        public virtual Category CategoryIdFkNavigation { get; set; }
    }
}
