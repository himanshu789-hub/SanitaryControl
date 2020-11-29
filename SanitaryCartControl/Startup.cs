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

            services.AddDbContext<SanitaryCartIdentityContext>(oo =>
              oo.UseSqlServer(Configuration.GetConnectionString("IdentitySQLConnection")));

            services.AddCoreExtensions();
            services.AddServicesExtensionsWithIConfiguration(Configuration);
            services.AddControllersWithViews();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env,IServiceProvider serviceProvider, ILogger<Startup> logger)
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
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseAuthentication();
            app.UseRouting();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id:int?}");
            });
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id:guid?}");
            });
       }
    }
}
