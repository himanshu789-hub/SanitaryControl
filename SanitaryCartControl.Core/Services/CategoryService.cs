using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using System.Collections.Generic;
using SanitaryCartControl.Core.Context;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using SanitaryCartControl.Core.Entities.DALModels;

namespace SanitaryCartControl.Core.Services
{
    public class CategoryService:ICategoryService
    {
        public int GetRootId(int categoryId)
        {
            using (var context = new SanitaryCartContext())
            {
                var Parent = context.Category.FromSqlRaw<Category>("GetRootNode @Id={0}", categoryId).AsEnumerable().FirstOrDefault();
                return Parent.Id;
            }
        
        }
        
        public IEnumerable<CategoryBLL> GetCategoryList(int brandId)
        {
            using (var context = new SanitaryCartContext())
            {
                IList<CategoryBLL> CategoryBLLs = new List<CategoryBLL>();
                var list = context.Category.AsNoTracking().Include(e => e.SeriesBrand).ToList();
                foreach (var item in list)
                {
                    CategoryBLLs.Add(new CategoryBLL() { Id = item.Id, ParentId = item.ParentId, Title = item.Titlle, Categories = null });
                }
                return GetTree(CategoryBLLs, null);
            }

        }
        ICollection<CategoryBLL> GetTree(ICollection<CategoryBLL> categories, int? parentId = null)
        {
            return categories.Where(e => e.ParentId == parentId).Select(e => new CategoryBLL()
            {
                Id = e.Id,
                Title = e.Title,
                ParentId = e.ParentId,
                Categories = GetTree(categories, parentId: e.Id).ToList()
            }).ToList();
        }

    }
}