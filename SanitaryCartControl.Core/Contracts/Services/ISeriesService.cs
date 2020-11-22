using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ISeriesService
    {

      int AddSeries(SeriesBLL series);   
      bool UpdateSeries(SeriesBLL series);
        IEnumerable<KeyValuePair<int,string>> GetCategory();
      bool MakeInActive(int seriesId); 
      IEnumerable<SeriesBLL> GetByParentId(int Id);
    }
    
}