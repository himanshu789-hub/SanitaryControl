using Microsoft.AspNetCore.Builder;

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