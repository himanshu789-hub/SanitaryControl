using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
namespace SanitaryCartControl.Core.Contracts.Services
{
    public interface ISeriesService
    {
      int AddSeries(SeriesBLL series);   
      bool UpdateSeries(SeriesBLL series);
      KeyValuePair<int,string> GetDistinctCategory();
      bool MakeInActive(int seriesId); 
    }
    
}