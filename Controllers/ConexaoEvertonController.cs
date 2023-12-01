using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class ConexaoEvertonController : Controller
    {
        private readonly ApplicationContext _context;
        public ConexaoEvertonController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult ConexaoEverton()
        {
            ViewBag.users = _context.ConexaoEverton.ToList();
            return View();
        }
    }
}