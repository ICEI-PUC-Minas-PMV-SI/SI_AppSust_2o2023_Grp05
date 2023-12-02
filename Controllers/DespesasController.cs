using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class DespesasController : Controller
    {
        private readonly ApplicationContext _context;
        public DespesasController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult Despesas()
        {
            ViewBag.users = _context.Despesas.ToList();
            return View();
        }
    }
}