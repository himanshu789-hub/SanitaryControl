using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Contracts.Services
{
  public interface IBrandService
  {
    bool Create(BrandBLL brand);
    bool Update(BrandBLL brand);
    IEnumerable<BrandBLL> GetBrands();

    bool IsNameExists(string name);

    BrandBLL GetById(int Id);
  }
}