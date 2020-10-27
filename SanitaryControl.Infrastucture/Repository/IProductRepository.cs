using SanitaryCartControl.InputModels;
namespace SanitaryControl.Contract.Repository
{
    public interface IProductRepository
    {
      public int Create(Product product);
    }
}
