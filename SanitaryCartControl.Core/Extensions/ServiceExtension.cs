using Microsoft.Extensions.DependencyInjection;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Services;
namespace SanitaryCartControl.Core.Extensions
{
    public static class ApplicationCoreEntensions
     {
             public static void AddCoreExtensions(this IServiceCollection services)
             {
                    services.AddSingleton<IProductService,ProductService>();
                    services.AddScoped(typeof(SanitaryCartControl.Core.Context.SanitaryCartContext));
                    services.AddSingleton(typeof(IBrandService),typeof(BrandService));
                    services.AddSingleton<ICategoryService,CategoryService>();
             }
             
    }
}