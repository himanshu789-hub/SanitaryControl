using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using SanitaryCartControl.Core.Entities.DALModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

using System.IO;

namespace SanitaryCartControl.Core.Context
{
    public partial class SanitaryCartIdentityContext : IdentityDbContext<ApplicationUser>
    {
      readonly string _connection;
      public SanitaryCartIdentityContext(string connection)
      {
          _connection = connection;
      }
        public SanitaryCartIdentityContext(DbContextOptions<SanitaryCartIdentityContext> options)
         : base(options)
        {  
        }
        protected override void OnConfiguring(DbContextOptionsBuilder builder)
        {
            if(!builder.IsConfigured)
            {
                builder.UseSqlServer(_connection);
            }
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}