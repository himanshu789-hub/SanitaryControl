using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Http;
namespace SanitaryCartControl.Controllers
{

    public abstract class BaseController:Controller
    {
       readonly IHostEnvironment _env;
        public BaseController(IHostEnvironment env)=>_env = env;
      [NonAction]
      protected string AddImage(IFormFile file,string path)
      {
                var getRelativePath = Path.Combine(path,
                System.Guid.NewGuid().ToString() + Path.GetExtension(file.FileName));
                var FilePath = Path.Join(_env.ContentRootPath, "wwwroot", getRelativePath);

                using (var stream = new FileStream(FilePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                
            return getRelativePath;
        }
        [NonAction]
       protected string[] AddImages(IFormFileCollection files,string path)
        {
            string[] images = new string[files.Count];
            int i = 0;
            foreach (var file in files)
            {
                var getRelativePath = Path.Combine(path,
                System.Guid.NewGuid().ToString() + Path.GetExtension(file.FileName));
                var FilePath = Path.Join(_env.ContentRootPath, "wwwroot", getRelativePath);

                using (var stream = new FileStream(FilePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                images[i++] = getRelativePath;
            }
            return images;
        }
    }
}