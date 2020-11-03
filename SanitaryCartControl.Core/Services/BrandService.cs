using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Entities.DALModels;
using SanitaryCartControl.Core.Context;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Collections.Generic;

namespace SanitaryCartControl.Core.Services
{
    public class BrandService : IBrandService
    {
        ILogger _logger;
        public BrandService(ILogger<BrandService> logger)=>_logger = logger;
        public bool Create(BrandBLL brand)
        {
                 
            using(var context = new SanitaryCartContext())
            {
                try
                {
                    Brand NewBrand = new Brand()
                    {
                        Name = brand.Name,
                        ImagePath = brand.ImagePath,
                        IsActive = true
                    };
                    context.Brand.Add(NewBrand);
                    context.SaveChanges();
                    return true;
                }
                catch (System.Data.Common.DbException e)
                {
                      _logger.LogError(new EventId().Id,e,"SQL Error Occur On Brand Adding");       
                }
                    return false;
                }
           }

        public IList<BrandBLL> GetBrands()
        {
                using(var context = new SanitaryCartContext())
                {
                    try
                    {
                         var Brands = context.Brand.ToList();
                         var Result = new List<BrandBLL>();
                         foreach (var item in Brands)
                         {
                              Result.Add(new BrandBLL(){Id = item.Id,Name=item.Name,ImagePath=item.ImagePath});
                         }
                         return Result;     
                    }
                    catch (System.Data.Common.DbException e)
                    {
                     _logger.LogError(new EventId().Id, e, "SQL Error Occur On Brand Adding");
                    }
                    return null;
                }
        }

        public bool IsNameExists(string name)
        {
            using(var context = new SanitaryCartContext())
            {
                try
                {

                   var brands =  context.Brand.FirstOrDefault(e => e.Name.Equals(name));
                    if(brands!=null)
                    {
                        return true;
                    }
                }
                catch (System.Data.Common.DbException e)
                {
                    _logger.LogError(new EventId().Id,e,"SQL Error on brand name checking");
                }
                return false;
            }
        }

        public bool Rename(int Id, string Name)
        {
            using(var context = new SanitaryCartContext())
            {
                try
                {
                    var OldBrand = context.Brand.FirstOrDefault(e => e.Id == Id);
                    if (OldBrand != null)
                    {
                        OldBrand.Name = Name;
                        context.SaveChanges();
                        return true;
                    }

                }
                catch (System.Data.Common.DbException e)
                {
                  _logger.LogError(new EventId().Id,e,"SQL error occur during Brand Rename");
                }
                return false;
             }
        }
    }
}