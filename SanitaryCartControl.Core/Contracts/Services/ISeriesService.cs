using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ISeriesService
    {

      int AddSeries(SeriesBLL series);   
      bool UpdateSeries(SeriesBLL series);
        IEnumerable<KeyValuePair<int,string>> GetCategory();
        SeriesBLL GetById(int Id);
      bool MakeInActive(int seriesId); 
      IEnumerable<SeriesBLL> GetByBrandAndParentId(byte BrandId,int CategoryId);
    }
    
}