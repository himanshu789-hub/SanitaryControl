using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Entities.DALModels;
using SanitaryCartControl.Core.Context;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using SanitaryCartControl.Core.Helpher;
using Microsoft.Extensions.Options;
namespace SanitaryCartControl.Core.Services
{
    public class BrandService : IBrandService
    {
        readonly string _con;
        public BrandService(IOptions<ConnectionStringOptions> connection){
            _con = connection.Value.SQLConnection;
        } 
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
        public bool Create(BrandBLL brand)
        {
            using (var context = new SanitaryCartContext(_con))
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
            using (var context = new SanitaryCartContext(_con))
            {
                var Brands = context.Brand.AsNoTracking().ToList();
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
            using (var context = new SanitaryCartContext(_con))
            {
                Brand brand = context.Brand.AsNoTracking().FirstOrDefault(e => e.Id == Id);
                return this.ConvertToBLL(brand);
            }
        }

        public bool IsNameExists(string name,byte? Id=null)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                try
                {
                    bool IsNameExists = false;
                    if(Id!=null)
                    IsNameExists = context.Brand.AsNoTracking().FirstOrDefault(e=>e.Id!=Id && e.Name.Equals(name))!=null;
                    else
                    IsNameExists = context.Brand.AsNoTracking().FirstOrDefault(e => e.Name.Equals(name))!=null;
                    return IsNameExists;
                }
                catch (System.Exception e)
                {
                    e.Data.Add("Description", "SQL Error on brand name checking");
                    throw e;
                }
            }
        }

        public bool Update(BrandBLL brand)
        {
            using (var context = new SanitaryCartContext(_con))
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