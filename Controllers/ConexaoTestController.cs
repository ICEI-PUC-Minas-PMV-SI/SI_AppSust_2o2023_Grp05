using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class ConexaoTestController : Controller
    {
        private readonly ApplicationContext _context;
        public ConexaoTestController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult conexaotestlist()
        {
            ViewBag.users = _context.ConexaoTest.ToList();
            return View();
        }
    }
}
