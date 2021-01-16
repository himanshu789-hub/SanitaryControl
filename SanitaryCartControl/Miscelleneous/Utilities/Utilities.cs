using SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Miscellaneous.Utilities
{
  public sealed class Utilities
    {
        public static string GetActionLinkForCategoryOrProduct(int Id,bool IsEndCategory,bool IsProduct)
        {
            if(!IsProduct)
            {
                    return $"/Item/Get?IsEndcategory={IsEndCategory}&CategoryId={Id}&Page=0";
                
            }
            return $"/Item/GetProduct/{Id}?Page=0";
        }
       public static string GetAttributeNameByType(byte type)
        {
            string result = "";
            switch (type)
            {
                case ((byte)ProductType.ColorVariable):
                    result = "Color";
                    break;
                case ((byte)ProductType.SizeVariable):
                    result = "Size";
                    break;
                case ((byte)ProductType.TypeVaribale):
                    result = "Type";
                    break;
                default:
                    break;
            }
            return result;
        
        }
        public static string InsertImageIfNull(string imagePath)
        {
            return imagePath==null?"/images/site/image-not-found.png":imagePath;
        }
    }
}