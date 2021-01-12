using SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Miscelleneous.Utlities
{
  public sealed class Utilities
    {
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
    }
}