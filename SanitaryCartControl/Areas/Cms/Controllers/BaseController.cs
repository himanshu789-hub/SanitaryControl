using Microsoft.AspNetCore.Mvc;
using System.IO;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Http;
using SanitaryCartControl.ViewModels;
using System.Threading.Tasks;
namespace SanitaryCartControl.Areas.Controllers
{

    public abstract class BaseController : Controller
    {
        readonly IHostEnvironment _env;

        public BaseController(IHostEnvironment env) => _env = env;


        [NonAction]
        public void DeleteImage(string path)
        {
            try
            {
                string filePath = Path.Join(_env.ContentRootPath, "wwwroot", path);
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }
            }
            catch (System.Exception)
            {

            }
        }
        public void DeleteImages(string[] images)
        {
            foreach (var item in images)
            {
                this.DeleteImage(item);
            }
        }
        [NonAction]
        protected string AddImage(IFormFile file, string path)
        {
            var getRelativePath = Path.Combine(path,
            System.Guid.NewGuid().ToString() + Path.GetExtension(file.FileName));
            var FilePath = Path.Join(_env.ContentRootPath, "wwwroot", getRelativePath);

            using (var stream = new FileStream(FilePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }
            return getRelativePath.Replace(@"\","/");
        }
        [NonAction]
        protected string[] AddImages(IFormFileCollection files, string path)
        {
            string[] images = new string[files.Count];
            int i = 0;
            foreach (var file in files)
            {
                string imagePath = this.AddImage(file, path);
                images[i++] = imagePath;
            }
            return images;
        }
    }
}