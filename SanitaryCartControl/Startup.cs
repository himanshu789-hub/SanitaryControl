using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SanitaryCartControl.Extensions;
using SanitaryCartControl.Core.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Internal;
using Microsoft.AspNetCore.Mvc;
using SanitaryCartControl.Core.Context;

namespace SanitaryCartControl
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<SanitaryCartContext>(options =>
             options.UseSqlServer(Configuration.GetConnectionString("SQLConnection")));

            services.AddDbContext<SanitaryCartIdentityContext>(oo =>
              oo.UseSqlServer(Configuration.GetConnectionString("IdentitySQLConnection")));
            services.AddCoreExtensions();
            services.AddServicesExtensionsWithIConfiguration(Configuration);
            services.AddAntiforgery(options =>
            {
                  options.FormFieldName = "_AntiForgeryVerification";
                  options.HeaderName = "X-CSRF-TOKEN-HEADERNAME";
                  options.SuppressXFrameOptionsHeader =true;
                  options.Cookie.HttpOnly=true;
                  options.Cookie.Expiration=new TimeSpan(0,30,0);
                  options.Cookie.Name="_AntiForgeryVerification";
                  options.Cookie.SameSite=Microsoft.AspNetCore.Http.SameSiteMode.Strict;
                  options.Cookie.SecurePolicy=Microsoft.AspNetCore.Http.CookieSecurePolicy.SameAsRequest;
                  
            });
            services.AddControllersWithViews(options => options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()));

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IServiceProvider serviceProvider, ILogger<Startup> logger)
        {
            logger.LogInformation("Environment Name : " + env.EnvironmentName);

            if (env.IsDevelopment())
            {
                //ApplicationExtensionsMethods.SeedRolesAndAdmin(serviceProvider,Configuration);
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseCustomExceptionHandler();
             //   app.UseHsts();
            }
    
            app.UseStaticFiles(new StaticFileOptions{
                OnPrepareResponse = ctx => {
                    string filePath = ctx.File.PhysicalPath;
                    if(System.Text.RegularExpressions.Regex.Match(filePath,@"lib.*\.(js|css)").Success)
                    ctx.Context.Response.Headers.Add(Microsoft.Net.Http.Headers.HeaderNames.CacheControl,"public, max-age=604800, immutable");
                }
            });
          //app.UseHttpsRedirection()
            app.UseAuthentication();
            app.UseRouting();
            app.UseAuthorization();


            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "WithAreas",
                    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id:int?}");
            });
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "WithAreas",
                    pattern: "{area:exists}/{controller=Home}/{action=Index}/{id:guid?}");
            });
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id:int?}");
            });

        }
    }
}
