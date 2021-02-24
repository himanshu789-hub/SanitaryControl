using System.Collections.Generic;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Entities.BLLModels;
using SanitaryCartControl.Core.Context;
using System;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Reflection;
using Enums = SanitaryCartControl.Core.Entities.Enums;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.Options;
using SanitaryCartControl.Core.Helpher;
using System.Data.SqlClient;
namespace SanitaryCartControl.Core.Services
{
    public class ProductService : IProductService
    {
        readonly ICategoryService _categoryService;
        readonly string _con;
        public ProductService(ICategoryService categoryService, IOptions<ConnectionStringOptions> connection)
        {
            _categoryService = categoryService;
            _con = connection.Value.SQLConnection;
        }
        public IEnumerable<KeyValuePair<int, string>> GetAttrinuteValues(SanitaryCartControl.Core.Entities.Enums.ProductType type, int categoryId)
        {
            int rootId = _categoryService.GetImmediateNodeId(categoryId);
            using (var context = new SanitaryCartContext(_con))
            {
                ICollection<KeyValuePair<int, string>> Values = new List<KeyValuePair<int, string>>();
                switch (type)
                {
                    case Entities.Enums.ProductType.ColorVariable:
                        {
                            var result = context.Colors.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;
                    case Entities.Enums.ProductType.SizeVariable:
                        {
                            var result = context.Sizes.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Size1)));
                        }
                        break;

                    case Entities.Enums.ProductType.TypeVaribale:
                        {
                            var result = context.Kinds.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Kind1)));
                        }
                        break;
                    case Entities.Enums.ProductType.NoneVariable:
                        break;
                    case Entities.Enums.ProductType.GradeVariable:
                        {
                            var result = context.Grades.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Grade1)));
                        }

                        break;
                    case Entities.Enums.ProductType.MaterialVariable:
                        {
                            var result = context.Materials.Where(e => e.CategoryIdFk == rootId).AsNoTracking().ToList();
                            result.ForEach(e => Values.Add(new KeyValuePair<int, string>(e.Id, e.Title)));
                        }
                        break;
                    default:
                        throw new System.Exception("A Non Recognised Product Type Encountered");
                }
                return Values;
            }
        }
        public ProductBLL GetById(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                var Product = context.Products.AsNoTracking().Include(e => e.Images).Include(e => e.BrandIdFkNavigation).Include(e => e.TypeProductQuantities).First(e => e.Id == Id);
                var Ancestors = _categoryService.GetAllAncestors(Product.CategoryId);
                return Helpher.HelpherMethods.ToProductBLL(Product, Ancestors);
            }
        }
        public bool Update(ProductBLL product)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Product OldProduct = context.Products
                .Include(e => e.TypeProductQuantities)
                .Include(e => e.Images)
                .FirstOrDefault(e => e.Id == product.Id);
                OldProduct.Name = product.Name;
                OldProduct.DateUpdated = product.DateUpdated;

                OldProduct.Description = product.Description;

                if (OldProduct == null)
                    return false;
                if (product.Images != null)
                {
                    context.Images.RemoveRange(OldProduct.Images);
                    foreach (var item in product.Images)
                    {
                        OldProduct.Images.Add(new Image()
                        {
                            Path = item,
                            Type = OldProduct.Type
                        });
                    }
                }
                int[] AttributeId = product.AttributeBLLs.Where(e => e.Id != 0).Select(e => e.Id).ToArray();
                foreach (var item in AttributeId)
                {
                    TypeProductQuantity typeProductQuantity = OldProduct.TypeProductQuantities.FirstOrDefault(e => e.Id == item);
                    AttributeBLL attributeBLL = product.AttributeBLLs.FirstOrDefault(e => e.Id == item);
                    typeProductQuantity.IsActive = attributeBLL.IsActive;
                    typeProductQuantity.Price = attributeBLL.Price;
                    typeProductQuantity.PiecesPerSet = attributeBLL.PeicesPerSet;
                    typeProductQuantity.IsPriceVisible = attributeBLL.IsPriceVisible;
                }
                IEnumerable<AttributeBLL> attributeBLLs = product.AttributeBLLs.Where(e => e.Id == 0);
                foreach (var item in attributeBLLs)
                {
                    OldProduct.TypeProductQuantities.Add(new TypeProductQuantity()
                    {
                        Value = item.Value,
                        PiecesPerSet = item.PeicesPerSet,
                        IsActive = true,
                        IsPriceVisible=true,
                        Price = item.Price,
                        AtributeType = item.AttributeId
                    });
                }
                context.SaveChanges();
                return true;
            }
        }
        public int Add(ProductBLL product)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Product NewProduct = new Product
                {
                    Description = product.Description,
                    Name = product.Name,
                    Code = product.Code,
                    BrandIdFk = product.Brand.Id,
                    IsActive = true,
                    CategoryId = product.RootPath.Id,
                    Type = product.Type,
                    DateAdded = product.DateAdded,
                    DateUpdated = product.DateAdded
                };
                foreach (var item in product.AttributeBLLs)
                    NewProduct.TypeProductQuantities.Add(new TypeProductQuantity
                    {
                        AtributeType = item.AttributeId,
                        Price = item.Price,
                        PiecesPerSet = item.PeicesPerSet,
                        Value = item.AttributeId == ((byte)Enums.ProductType.NoneVariable) ? null : item.Value,
                        IsActive = true
                    });

                foreach (var item in product.Images)
                    NewProduct.Images.Add(new Image { Path = item, Type = product.Type });
                context.Products.Add(NewProduct);
                context.SaveChanges();

                return NewProduct.Id;
            }
        }
        public PagedProduct Search(string searchValue, int page, int count)
        {
            PagedProduct pagedProducts = new PagedProduct();
            using (var connection = new SqlConnection(_con))
            {
                using (var command = new SqlCommand())
                {
                    command.CommandText = "EXEC SearchProductWithPartition @PageCount=@PageCount,@Search=@Search,@Page=@Page";
                    SqlParameter pageCount = new SqlParameter()
                    {
                        Value = count,
                        ParameterName = "@PageCount",
                        SqlDbType = System.Data.SqlDbType.Int
                    };
                    SqlParameter search = new SqlParameter()
                    {
                        Value = searchValue,
                        ParameterName = "@Search",
                        SqlDbType = System.Data.SqlDbType.NVarChar,
                        Size = 50
                    };
                    SqlParameter pageNumber = new SqlParameter()
                    {
                        Value = page,
                        ParameterName = "@Page",
                        SqlDbType = System.Data.SqlDbType.Int
                    };
                    command.Parameters.AddRange(new[] { pageCount, search, pageNumber });
                    command.Connection = connection;

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        ICollection<ProductBLL> products = new List<ProductBLL>();
                        while (reader.Read())
                        {

                            int Id = (int)reader["Id"];
                            bool ExistsAlready = products.FirstOrDefault(e => e.Id == Id) != null;
                            if (ExistsAlready)
                            {
                                ProductBLL existsProduct = products.First(e => e.Id == Id);
                                List<AttributeBLL> attributeBLLs = new List<AttributeBLL>();
                                attributeBLLs.AddRange(existsProduct.AttributeBLLs);
                                attributeBLLs.Add(new Mapper().MapType<AttributeBLL>(reader));
                                existsProduct.AttributeBLLs = attributeBLLs;
                            }
                            else
                            {
                                ProductBLL newProduct = new Mapper().MapType<ProductBLL>(reader);
                                ICollection<AttributeBLL> attributeBLLs = new List<AttributeBLL>();
                                attributeBLLs.Add(new Mapper().MapType<AttributeBLL>(reader));
                                newProduct.AttributeBLLs = attributeBLLs;
                                products.Add(newProduct);
                            }
                        }

                        pagedProducts.Products = products;
                    }
                    pagedProducts.GeneralPageSize = count;
                    pagedProducts.PageNumber = page;
                    if (reader.NextResult())
                    {
                        while (reader.Read())
                        {
                            pagedProducts.TotalCount = reader.GetInt32(0);
                        }
                    }
                    return pagedProducts;
                }
                // using (var context = new SanitaryCartContext(_con))
                // {

                //     var query = context.Products.AsNoTracking().Where(e => (e.Code == value || e.Name.Contains(value)) && e.IsActive)
                //       .Include(e => e.TypeProductQuantities)
                //       .Include(e => e.BrandIdFkNavigation).Include(e => e.Category).ThenInclude(e => e.Parent);
                //     var products = query.ToList();
                //     return HelpherMethods.ToProductBLLs(products.AsQueryable());
                // }
            }
        }
        public bool Delete(int Id)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                Product product = context.Products.FirstOrDefault(e => e.Id == Id);
                if (product != null)
                {
                    product.IsActive = false;
                    context.SaveChanges();
                    return true;
                }
                return false;
            }
        }

        public IEnumerable<ProductInfoBLL> GetProductsByCategoryId(int CategoryId, int Page, int Count)
        {
            using (var context = new SanitaryCartContext(_con))
            {
                IEnumerable<ProductInfoBLL> products = context.Products.AsNoTracking().Where(e => e.CategoryId == CategoryId)
                .Include(e => e.Images).Take(Count).Skip(Page * Count).Select(e => new ProductInfoBLL
                {
                    Id = e.Id,
                    Name = e.Name,
                    ImagePath = e.Images.Count > 0 ? e.Images.First().Path : null
                }).ToList();
                return products;
            }
        }
    }
}