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
              options.Password.RequireLowercase = true;
              options.Password.RequireUppercase = true;
              options.Password.RequireNonAlphanumeric = true;
          }).AddEntityFrameworkStores<SanitaryCartIdentityContext>();

            services.ConfigureApplicationCookie(options =>
               {
                   options.LoginPath = "/Account/LogIn";
                   options.LogoutPath = "/Account/Logut";
                   options.AccessDeniedPath = "/Account/AccessDenied";
                   options.ReturnUrlParameter="returnUrl";
                   
                  
                   options.Cookie = new Microsoft.AspNetCore.Http.CookieBuilder
                   {
                       MaxAge=new System.TimeSpan(8,0,0),
                       Path= "/",
                       SameSite = Microsoft.AspNetCore.Http.SameSiteMode.Strict,
                       SecurePolicy = Microsoft.AspNetCore.Http.CookieSecurePolicy.SameAsRequest,
                       HttpOnly=true,                       
                   };
               });

        }
        public static void AddServicesExtensionsWithIConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions();
            var connection = configuration.GetSection(ConnectionStringOptions.OptionName);
            services.Configure<ConnectionStringOptions>(options => connection.Bind(options));
        }
    }
}