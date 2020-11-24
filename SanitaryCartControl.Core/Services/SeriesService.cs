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
            using (var context = new SanitaryCartContext())
            {
                Category category = new Category() { Titlle = series.Title, ParentId = series.Parent.Key, ImagePath = series.ImagPath };
                SeriesBrand seriesBrand = new SeriesBrand()
                {
                    BrandIdFk = series.BrandId,
                    CategoryIdFkNavigation = category
                };
                context.SeriesBrand.Add(seriesBrand);
                context.SaveChanges();
                return seriesBrand.Id;
            }
        }

        public IEnumerable<SeriesBLL> GetByBrandAndParentId(byte BrandId, int CategoryId)
        {
            using (var context = new SanitaryCartContext())
            {
                var result = context.SeriesBrand.Include(e => e.CategoryIdFkNavigation).Where(e => e.CategoryIdFkNavigation.ParentId == CategoryId && e.IsActive == true && e.BrandIdFk == BrandId).ToList();
                IEnumerable<SeriesBLL> seriesBLLs = Helpher.HelpherMethods.ToSeriesBLL(result.AsQueryable());
                return seriesBLLs;
            }
        }

        public SeriesBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext())
            {
                SeriesBrand seriesBrand = context.SeriesBrand.Include(e => e.CategoryIdFkNavigation).ThenInclude(e => e.Parent).FirstOrDefault(e => e.Id == Id);
                if (seriesBrand == null)
                    return null;
                return Helpher.HelpherMethods.ToSeriesBLL(seriesBrand);
            }
        }

        public IEnumerable<KeyValuePair<int, string>> GetCategory()
        {
            using (var context = new SanitaryCartContext())
            {
                int[] SeriesHolderId = context.SeriesHolderCategory.Distinct().Select(e => e.CategoryIdFk).ToArray();
                var categories = context.Category.Where(e => SeriesHolderId.Contains(e.Id)).ToList();
                ICollection<KeyValuePair<int, string>> result = new List<KeyValuePair<int, string>>();
                categories.ForEach(e => result.Add(
                    new KeyValuePair<int, string>(e.Id, e.Titlle)
                ));
                return result;
            }
        }

        public KeyValuePair<int, string> GetDistinctCategory()
        {
            throw new System.NotImplementedException();
        }

        public bool MakeInActive(int seriesId)
        {
            using (var context = new SanitaryCartContext())
            {
                context.SeriesBrand.Find(seriesId).IsActive = false;
                context.SaveChanges();
                return true;
            }
        }

        public bool UpdateSeries(SeriesBLL series)
        {
            using (var context = new SanitaryCartContext())
            {
                SeriesBrand SeriesBrand = context.SeriesBrand
                .Include(e => e.CategoryIdFkNavigation)
                .FirstOrDefault(e => e.Id == series.Id);
                if (series == null)
                    return false;

                SeriesBrand.CategoryIdFkNavigation.Titlle = series.Title;
                SeriesBrand.CategoryIdFkNavigation.ImagePath = series.ImagPath;
                context.SaveChanges();
                return true;
            }
        }
    }
}