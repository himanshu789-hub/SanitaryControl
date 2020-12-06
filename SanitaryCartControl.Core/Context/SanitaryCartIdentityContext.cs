using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using SanitaryCartControl.Core.Entities.DALModels;

using Microsoft.EntityFrameworkCore;
namespace  SanitaryCartControl.Core.Context
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
                builder.UseMySql(_connection).EnableDetailedErrors();
            }
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}