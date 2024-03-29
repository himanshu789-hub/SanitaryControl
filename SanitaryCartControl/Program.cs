using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Hosting;
using NLog.Web;
namespace SanitaryCartControl
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var logger = NLog.Web.NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();
            try
            {
                logger.Debug("init main");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception exception)
            {
                //NLog: catch setup errors
                logger.Error(exception, "Stopped program because of exception");
                throw;
            }
            finally
            {
                // Ensure to flush and stop internal timers/threads before application-exit (Avoid segmentation fault on Linux)
                NLog.LogManager.Shutdown();
            }
         }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
         Host.CreateDefaultBuilder(args)
         .ConfigureWebHostDefaults(webBuilder=>{
                webBuilder.UseStartup<Startup>();
         })
        .ConfigureLogging((httpHosting,loggerBuilder)=>
        {
                    loggerBuilder.ClearProviders();
                    loggerBuilder.AddEventLog();
                    
                    if(httpHosting.HostingEnvironment.EnvironmentName==Microsoft.Extensions.Hosting.EnvironmentName.Production)
                    {
                    }
                    else
                    {
                        loggerBuilder.AddConsole();
                        loggerBuilder.AddDebug();
                    }
        }).UseNLog();
    }
}
