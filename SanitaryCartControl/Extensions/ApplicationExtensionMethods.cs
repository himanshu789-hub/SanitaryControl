using Microsoft.AspNetCore.Builder;
using System.IO;
using System;
using SanitaryCartControl.Core.Context;
using Microsoft.AspNetCore.Identity;
using System.Linq;
using SanitaryCartControl.Core.Entities.Enums;
using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
namespace SanitaryCartControl.Extensions
{
    public static class ApplicationExtensionsMethods
    {
        public async static void SeedRolesAndAdmin(IServiceProvider serviceProvider,IConfiguration configuration)
        {
            var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
            const string firstname = "Naresh";
            const string lastname = "Lalwani";
            const string userName = "nl12@gecart.com";
            var userManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();

            string con = configuration.GetConnectionString("IdentitySQLConnection");
            if (roleManager.Roles.Where(e => e.Name.Equals(ApplicationRoles.Administration)).FirstOrDefault() == null)
            {
                using (var context = new SanitaryCartIdentityContext(con))
                {
                    context.Roles.Add(new IdentityRole() { Name = ApplicationRoles.Administration });
                    context.SaveChanges();
                }
            }
            if (roleManager.Roles.Where(e => e.Name.Equals(ApplicationRoles.Manager)).FirstOrDefault() == null)
            {
                using (var context = new SanitaryCartIdentityContext(con))
                {
                    context.Roles.Add(new IdentityRole() { Name = ApplicationRoles.Manager });
                    context.SaveChanges();
                }
            }

            if (userManager.Users.FirstOrDefault(e => e.FirstName.Equals(firstname) && e.LastName.Equals(lastname)) == null)
            {
                    ApplicationUser user = new ApplicationUser()
                    {
                        LastName = lastname,
                        FirstName = firstname,
                        UserName=userName,
                        ImagePath = Path.Combine(@"/images/site", "administration.svg")
                    };
               var createResult =   await  userManager.CreateAsync(user, "NL@1crt8");
               if(createResult.Succeeded)
               {
                   var roleUser =  await userManager.AddToRoleAsync(user, ApplicationRoles.Administration);
                   if(roleUser.Succeeded)
                    System.Console.WriteLine("Admin Created and Assigned");
                }
                
            }
        }
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