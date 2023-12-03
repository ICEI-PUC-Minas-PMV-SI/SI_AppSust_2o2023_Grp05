using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;


namespace PetFriends.Controllers
{
    public class AdocaoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

    }
}
