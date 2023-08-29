using Microsoft.AspNetCore.Mvc;

namespace YourWebAppProject.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
