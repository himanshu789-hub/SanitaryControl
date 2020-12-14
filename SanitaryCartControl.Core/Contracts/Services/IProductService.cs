using System.Collections.Generic;
using SanitaryCartControl.Core.Entities.BLLModels;
using Enums = SanitaryCartControl.Core.Entities.Enums;
namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface IProductService
    {
    IEnumerable<KeyValuePair<int,string>> GetAttrinuteValues(Enums.ProductType type,int categoryId);
    ProductBLL GetById(int Id);
    bool Update(ProductBLL product);
    int Add(ProductBLL product);
    IEnumerable<ProductBLL> Search(string value);
    bool Delete(int Id);

    }
}