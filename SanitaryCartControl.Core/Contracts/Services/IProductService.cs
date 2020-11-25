using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Threading.Tasks;
using SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface IProductService
    {
       int GetProductType(int CategoryId);
    IEnumerable<KeyValuePair<int,string>> GetAttrinuteValues(ProductType type,int categoryId);
  
    ProductBLL GetById(int Id);
    bool Update(ProductBLL product);
    int Add(ProductBLL product);
    IEnumerable<ProductBLL> Search(string value);

    }
}