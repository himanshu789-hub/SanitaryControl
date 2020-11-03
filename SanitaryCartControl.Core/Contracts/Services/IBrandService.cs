using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Contracts.Services
{
  public interface IBrandService
  {
    bool Create(BrandBLL brand);
    bool Rename(int Id,string Name);
    IList<BrandBLL> GetBrands();

    bool IsNameExists(string name);
  }
}