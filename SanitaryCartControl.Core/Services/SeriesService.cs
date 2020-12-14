using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.Extensions.Options;
using SanitaryCartControl.Core.Helpher;
namespace SanitaryCartControl.Core.Services
{
    public class SeriesService : ISeriesService
    {
        readonly string _con;
        public SeriesService(IOptions<ConnectionStringOptions> connection)
        {
            _con = connection.Value.SQLConnection;
        }
        public int AddSeries(SeriesBLL series)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Category category = new Category()
                {
                    Titlle = series.Title,
                    ParentId = series.Parent.Key,
                    ImagePath = series.ImagPath
                };
                SeriesBrand seriesBrand = new SeriesBrand()
                {
                    BrandIdFk = series.BrandId,
                    CategoryIdFkNavigation = category
                };
                context.SeriesBrands.Add(seriesBrand);
                context.SaveChanges();
                return seriesBrand.Id;
            }
        }

        public IEnumerable<SeriesBLL> GetByBrandAndParentId(byte BrandId, int CategoryId)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var result = context.SeriesBrands.Include(e => e.CategoryIdFkNavigation).Where(e => e.CategoryIdFkNavigation.ParentId == CategoryId && e.IsActive == true && e.BrandIdFk == BrandId).ToList();
                IEnumerable<SeriesBLL> seriesBLLs = Helpher.HelpherMethods.ToSeriesBLL(result.AsQueryable());
                return seriesBLLs;
            }
        }

        public SeriesBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                SeriesBrand seriesBrand = context.SeriesBrands.Include(e => e.CategoryIdFkNavigation).ThenInclude(e => e.Parent).FirstOrDefault(e => e.Id == Id);
                if (seriesBrand == null)
                    return null;
                return Helpher.HelpherMethods.ToSeriesBLL(seriesBrand);
            }
        }

        public IEnumerable<KeyValuePair<int, string>> GetCategory()
        {
            using (var context = new SanitaryCartContext(_con))
            {
                int[] SeriesHolderId = context.SeriesHolderCategories.Distinct().Select(e => e.CategoryIdFk).ToArray();
                var categories = context.Categories.Where(e => SeriesHolderId.Contains(e.Id)).ToList();
                ICollection<KeyValuePair<int, string>> result = new List<KeyValuePair<int, string>>();
                categories.ForEach(e => result.Add(
                    new KeyValuePair<int, string>(e.Id, e.Titlle)
                ));
                return result;
            }
        }

        public bool IsNameExists(string name, int ParentId, int BrandId, int? Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                bool IsNameExists = false;
                if (Id == null)
                    IsNameExists = context.Categories.Include(e => e.SeriesBrand).FirstOrDefault(e => e.ParentId == ParentId && e.SeriesBrand.BrandIdFk == BrandId && e.Titlle.Equals(name)) != null;
                else
                    IsNameExists = context.Categories.Include(e => e.SeriesBrand)
                    .FirstOrDefault(e => e.SeriesBrand.Id != Id && e.ParentId == ParentId && e.SeriesBrand.BrandIdFk == BrandId && e.Titlle.Equals(name)) != null;
                return IsNameExists;
            }
        }

        public bool MakeInActive(int seriesId)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                context.SeriesBrands.Find(seriesId).IsActive = false;
                context.SaveChanges();
                return true;
            }
        }

        public bool UpdateSeries(SeriesBLL series)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                SeriesBrand SeriesBrand = context.SeriesBrands
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