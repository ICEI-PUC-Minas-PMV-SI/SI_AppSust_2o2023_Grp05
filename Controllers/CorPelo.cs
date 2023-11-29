using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class CorpeloController : Controller
    {
        private readonly ApplicationContext _context;
        public CorpeloController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult CorPelo()
        {
            ViewBag.users = _context.CorPelo.ToList();
            return View();
        }


    }
}