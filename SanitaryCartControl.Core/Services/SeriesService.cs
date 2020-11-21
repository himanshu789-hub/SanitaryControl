using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;

namespace SanitaryCartControl.Core.Services
{
    public class SeriesService : ISeriesService
    {
        public int AddSeries(SeriesBLL series)
        {
            using(var context = new SanitaryCartContext())
            {
               Category category = new Category(){Titlle=series.Title};
               SeriesBrand seriesBrand = new SeriesBrand(){
                   BrandIdFk=series.BrandId,
                   CategoryIdFkNavigation=category
                };
                context.SeriesBrand.Add(seriesBrand);
                context.SaveChanges();
                return seriesBrand.Id;
            }
        }

        public KeyValuePair<int, string> GetDistinctCategory()
        {
            throw new System.NotImplementedException();
        }

        public bool MakeInActive(int seriesId)
        {
            using(var context = new SanitaryCartContext())
            {
                context.SeriesBrand.Find(seriesId).IsActive=false;
                context.SaveChanges();
                return true;
            }
        }
       
        public bool UpdateSeries(SeriesBLL series)
        {
             using(var context = new SanitaryCartContext())
             {
               SeriesBrand SeriesBrand =  context.SeriesBrand
               .Include(e=>e.CategoryIdFkNavigation)
               .FirstOrDefault(e=>e.Id==series.Id);

               SeriesBrand.CategoryIdFkNavigation.Titlle=series.Title;
               SeriesBrand.CategoryIdFkNavigation.ImagePath = series.ImagPath;
               context.SaveChanges();
               return true;
             }
        }
    }
}