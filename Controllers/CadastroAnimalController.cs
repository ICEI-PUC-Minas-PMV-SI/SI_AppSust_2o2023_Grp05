using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;

namespace PetFriends.Controllers
{
    public class CadastroAnimalController : Controller
    {
        private readonly ApplicationContext _context;
        public CadastroAnimalController(ApplicationContext context)
        {
            _context = context;
        }
        public IActionResult listaanimais()
        {
            ViewBag.users = _context.CadastroAnimal.ToList();
            return View();
        }

        public IActionResult AdicionarEditarAnimal()
        {
            ViewBag.users = _context.CadastroAnimal.ToList();
            return View();
        }
    }
}
