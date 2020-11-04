namespace SanitaryCartControl.Core.Helpher
{
   public class HelpherMethods{
       public static bool IsEfCoreExceptions(System.Exception e)
       {
            if (e is Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException)
            {
                return true;
            }
            else if (e is Microsoft.EntityFrameworkCore.DbUpdateException)
            {
                return true;
            }
            else
                return false;


       }
   }
}