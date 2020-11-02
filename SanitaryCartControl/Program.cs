using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Hosting;
namespace SanitaryCartControl
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();    
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
                    else{
                        loggerBuilder.AddConsole();
                    }
        });
    }
}
