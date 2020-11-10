using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Entities.DALModels;
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
       public static ProductBLL ToProductBLL(Product product,AncestorCategoryBLL ancestors)
       {
           if(product==null||ancestors==null)
            throw new System.ArgumentNullException();
           if(product.BrandIdFkNavigation==null||product.TypeProductQuantity==null)
           throw new System.NullReferenceException();

           ProductBLL productBLL = new ProductBLL();
           productBLL.Id = product.Id;
           productBLL.Type = product.Type;
           productBLL.Brand = HelpherMethods.ToBrandBLL(product.BrandIdFkNavigation);
           productBLL.Description = product.Description;
           productBLL.DateUpdated = product.DateUpdated;
           productBLL.DateAdded = product.DateAdded;
           productBLL.Name = product.Name;
           productBLL.Code = product.Code;
           productBLL.RootPath = ancestors;
           return productBLL;
       }
       public static BrandBLL ToBrandBLL(Brand brand)
       { 
           return new BrandBLL(){Id=brand.Id,ImagePath=brand.ImagePath,Name=brand.Name};
       }
   }
}