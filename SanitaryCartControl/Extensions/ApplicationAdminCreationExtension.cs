using System.IO;
using System;
using SanitaryCartControl.Core.Context;
using Microsoft.AspNetCore.Identity;
using System.Linq;
using SanitaryCartControl.Core.Entities.Enums;
using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace SanitaryCartControl.Extensions
{
    public class ApplicationAdminCeationExtensions
    {
        public async static void SeedRolesAndAdmin(IServiceProvider serviceProvider, IConfiguration configuration)
        {
            IList<UserInfo> adminUsers = new List<UserInfo>();

            adminUsers.Add(new UserInfo
            {
                FirstName = "Naresh",
                LastName = "Lalwani",
                Password = "AF84d#55'z99",
                UserName = "admin_NS42A63B@gokul"
            });
            adminUsers.Add(new UserInfo(){
                FirstName = "Aashana",
                LastName = "Shadija",
                Password = "1AHe(8)#27*3j1",
                UserName = "admin_AS11E586@gokul"
            });
            adminUsers.Add(new UserInfo()
            {
                FirstName = "Dinesh",
                LastName = "Sahu",
                Password = "D86C#7fp^F7j",
                UserName = "admin_E61C9906@gokul"
            });


            var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
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

            foreach (var user in userManager.Users.ToList())
            {
                await userManager.DeleteAsync(user);
            }
            foreach (var admin in adminUsers)
            {

                if (userManager.Users.FirstOrDefault(e => e.FirstName.Equals(firstname) && e.LastName.Equals(lastname)) == null)
                {
                    ApplicationUser user = new ApplicationUser()
                    {
                        LastName = admin.LastName,
                        FirstName = firstname,
                        UserName = userName,
                        ImagePath = Path.Combine(@"/images/site", "administration.svg")
                    };
                    var createResult = await userManager.CreateAsync(user, "NL@1crt8");
                    if (createResult.Succeeded)
                    {
                        var roleUser = await userManager.AddToRoleAsync(user, ApplicationRoles.Administration);
                        if (roleUser.Succeeded)
                            System.Console.WriteLine("Admin Created and Assigned");
                    }

                }   
            }
        }

    }
}