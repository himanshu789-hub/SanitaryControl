using Microsoft.AspNetCore.Builder;

namespace SanitaryCartControl.Extensions
{
    public static class ApplicationExtensionsMethods
    {
        public static void UseCustomExceptionHandler(this IApplicationBuilder app)
        {
            app.UseExceptionHandler("/Home/Error");

        }
        public static void RemoveIfPresent(this Microsoft.AspNetCore.Mvc.ModelBinding.ModelStateDictionary modelSate, string key)
        {
            if (modelSate.ContainsKey(key))
                modelSate.Remove(key);  
        }
    }
}