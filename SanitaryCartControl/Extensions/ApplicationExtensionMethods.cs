using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Diagnostics;
namespace SanitaryCartControl.Extensions
{
    class UserInfo
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        
        public string UserName{get;set;}
    }
    public static class ApplicationExtensionsMethods
    {
        public static void UseCustomExceptionHandler(this IApplicationBuilder app)
        {
            app.UseExceptionHandler(new ExceptionHandlerOptions
            {
                ExceptionHandler = (context) =>
                {
                    bool IsRequestFormCms = context.Request.Path.ToUriComponent().StartsWith("/Cms",System.StringComparison.OrdinalIgnoreCase);
                    context.Response.StatusCode =Microsoft.AspNetCore.Http.StatusCodes.Status500InternalServerError;
                    var logger = context.Features.Get<ILogger>();
                    var exception = context.Features.Get<IExceptionHandlerFeature>();
                    logger.LogError(exception.Error,"Exception Handled By Golbal Handler");
                    if (IsRequestFormCms)
                    {
                        context.Response.Redirect("/Cms/Home/Error");
                    }
                    else
                        context.Response.Redirect("/Home/Error");
                    return System.Threading.Tasks.Task.CompletedTask;
                }
            });

            //             app.UseExceptionHandler(errorApp =>
            //             {
            //                 errorApp.Run(async context =>
            // {
            //     bool IsRequestFormCms = context.Request.Path.ToUriComponent().StartsWith("/Cms");

            //     if (IsRequestFormCms)
            //     {
            //         context.Response.Redirect("/Cms/Home/Error");
            //     }
            //     else
            //         context.Response.Redirect("/Home/Error");
            // });
            // });

        }
        public static void RemoveIfPresent(this Microsoft.AspNetCore.Mvc.ModelBinding.ModelStateDictionary modelSate, string key)
        {
            if (modelSate.ContainsKey(key))
                modelSate.Remove(key);
        }



    }
}