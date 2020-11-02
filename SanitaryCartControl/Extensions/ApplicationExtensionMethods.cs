using Microsoft.AspNetCore.Builder;
using SanitaryCartControl.ViewModels;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Diagnostics;
using System.Runtime.Serialization.Formatters.Binary;
namespace SanitaryCartControl.Extensions
{
    public static class ApplicationExtensionsMethods
    {
        public static void UseCustomExceptionHandler(this IApplicationBuilder app)
        {
            app.UseExceptionHandler("/Home/Error");

         }

    }
}