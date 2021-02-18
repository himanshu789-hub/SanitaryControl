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
    PagedProduct Search(string value,int page,int count);
    bool Delete(int Id);
    IEnumerable<ProductInfoBLL> GetProductsByCategoryId(int CategoryId,int Page,int Count);
    }
}