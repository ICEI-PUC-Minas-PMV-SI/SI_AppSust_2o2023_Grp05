using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class CustoPorResgateController : Controller
    {
        private readonly ApplicationContext _context;
        public CustoPorResgateController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult CustoPorResgate()
        {
            ViewBag.users = _context.CustoPorResgate.ToList();
            return View();
        }
    }
}