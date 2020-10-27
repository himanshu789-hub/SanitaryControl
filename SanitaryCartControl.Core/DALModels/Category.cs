using System;
using System.Collections.Generic;
using System.Text;

namespace SanitaryCartControl.Core.DALModels
{
    public class Category
    {
         public int Id { get; set; }
         public string Title { get; set; }
         public int ParentId { get; set; }
    }
}
