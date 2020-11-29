using Microsoft.Extensions.DependencyInjection;
using SanitaryCartControl.Core.Contracts.Services;
using SanitaryCartControl.Core.Services;
using SanitaryCartControl.Core.Context;
using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using SanitaryCartControl.Core.Helpher;
namespace SanitaryCartControl.Core.Extensions
{
    public static class ApplicationCoreEntensions
    {
        public static void AddCoreExtensions(this IServiceCollection services)
        {
            services.AddSingleton<IProductService, ProductService>();

            services.AddSingleton(typeof(IBrandService), typeof(BrandService));
            services.AddSingleton<ICategoryService, CategoryService>();
            services.AddSingleton<ISeriesService, SeriesService>();

            services.AddIdentity<ApplicationUser, IdentityRole>(options =>{
              options.Password.RequireDigit = true;
              options.Password.RequiredUniqueChars = 0;
              options.Password.RequireLowercase = false;
              options.Password.RequireUppercase = false;
              options.Password.RequireNonAlphanumeric = false;

          }).AddEntityFrameworkStores<SanitaryCartIdentityContext>()
           .AddDefaultTokenProviders();
            services.ConfigureApplicationCookie(options =>
               {
                   options.LoginPath = "/Account/LogIn";
                   options.LogoutPath = "/Account/Logut";
                   options.AccessDeniedPath = "/Account/AccessDenied";
                   options.SlidingExpiration = true;
                   options.ReturnUrlParameter="/Home/Index";
                   options.Cookie = new Microsoft.AspNetCore.Http.CookieBuilder
                   {
                       Path = "/",
                       SameSite = Microsoft.AspNetCore.Http.SameSiteMode.Lax,
                       SecurePolicy = Microsoft.AspNetCore.Http.CookieSecurePolicy.SameAsRequest
                   };
               });

        }
         public static void AddServicesExtensionsWithIConfiguration(this IServiceCollection services,IConfiguration configuration)
         {
             services.AddOptions();
             var connection = configuration.GetSection(ConnectionStringOptions.OptionName);
             services.Configure<ConnectionStringOptions>(options => connection.Bind(options));
         }
    }
}