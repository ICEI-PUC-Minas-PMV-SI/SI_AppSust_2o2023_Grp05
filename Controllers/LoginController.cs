using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;

namespace PetFriends.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationContext _context;
        public LoginController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Login login)
        {
            //if (ModelState.IsValid)
            //{
                var l = _context.Usuario.Where(l => l.Email.Equals(login.Email) && l.Senha.Equals(login.Senha) && l.IdTipoUsuario.Equals(1)).FirstOrDefault();
                    if (l != null)
                    {
                        //Session["log"] = l.Email.ToString();
                        //return RedirectToAction("~/Home");
                        return Redirect(Url.Action("Index", "HomeAfterLogin"));
                    }

            //}

            return Redirect(Url.Action("Index", "Home"));
            //return View("~/Home");
        }
    }
}




