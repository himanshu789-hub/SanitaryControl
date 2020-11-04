using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Entities.DALModels;
using SanitaryCartControl.Core.Context;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using SanitaryCartControl.Core.Helpher;

namespace SanitaryCartControl.Core.Services
{
    public class BrandService : IBrandService
    {
        ILogger _logger;
        BrandBLL ConvertToBLL(Brand item)
        {
            if (item != null)
                return new BrandBLL() { Id = item.Id, Name = item.Name, ImagePath = item.ImagePath };

            return null;
        }
        IEnumerable<BrandBLL> ConvertToBLL(IEnumerable<Brand> items)
        {
            if (items != null)
            {
                IList<BrandBLL> BrandBLLs = new List<BrandBLL>();

                foreach (var item in items)
                {
                    BrandBLLs.Add(new BrandBLL() { Id = item.Id, Name = item.Name, ImagePath = item.ImagePath });
                }
                return BrandBLLs;
            }
            return null;
        }

        public BrandService(ILogger<BrandService> logger) => _logger = logger;

        public bool Create(BrandBLL brand)
        {
            using (var context = new SanitaryCartContext())
            {
                Brand NewBrand = new Brand()
                {
                    Name = brand.Name,
                    ImagePath = brand.ImagePath
                };
                context.Brand.Add(NewBrand);
                context.SaveChanges();
                return true;
            }
        }


        public IEnumerable<BrandBLL> GetBrands()
        {
            using (var context = new SanitaryCartContext())
            {
                var Brands = context.Brand.AsNoTracking<Brand>().ToList();
                var Result = new List<BrandBLL>();
                foreach (var item in Brands)
                {
                    Result.Add(this.ConvertToBLL(item));
                }
                return Result;
            }
        }

        public BrandBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext())
            {
                Brand brand = context.Brand.AsNoTracking().FirstOrDefault(e => e.Id == Id);
                return this.ConvertToBLL(brand);
            }
        }

        public bool IsNameExists(string name)
        {
            using (var context = new SanitaryCartContext())
            {
                try
                {

                    var brands = context.Brand.AsNoTracking().FirstOrDefault(e => e.Name.Equals(name));
                    if (brands != null)
                    {
                        return true;
                    }
                }
                catch (System.Exception e)
                {
                    e.Data.Add("Description", "SQL Error on brand name checking");
                    throw e;
                }
                return false;
            }
        }

        public bool Update(BrandBLL brand)
        {
            using (var context = new SanitaryCartContext())
            {
                try
                {
                    var OldBrand = context.Brand.FirstOrDefault(e => e.Id ==brand.Id);

                    if (OldBrand != null)
                    {
                        OldBrand.Name =brand.Name;
                        OldBrand.ImagePath = brand.ImagePath;
                        context.SaveChanges();
                        return true;
                    }
                }
                 catch (System.Exception e)
                {
                    e.Data.Add("Description","SQL Error While Checking If Brand Name Already Exists");
                    throw e;
                }
            }
            return false;
        }
    }
}