using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class TipoAnimalController : Controller
    {
        private readonly ApplicationContext _context;
        public TipoAnimalController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.TipoAnimal.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            TipoAnimal TipoAnimal = new TipoAnimal();

            ViewBag.TipoDesc = TipoAnimal.TipoDesc;
            return View(TipoAnimal);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TipoAnimal tipoAnimal)
        {
            _context.Add(tipoAnimal);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var tipoAnimal = _context.TipoAnimal.Where(t => t.Id == id).FirstOrDefault();
            return View(tipoAnimal);
        }

        [HttpPost]
        public ActionResult Edit(TipoAnimal Model)
        {
            var tipoAnimal = _context.TipoAnimal.Where(t => t.Id == Model.Id).FirstOrDefault();

            if (tipoAnimal != null)
            {
                tipoAnimal.TipoDesc = Model.TipoDesc;

                _context.SaveChanges();

                // It will redirect to the Read method
                return RedirectToAction("Index");
            }
            else
                return View();
        }

        // POST: /Animal/Delete/id/
        public ActionResult Delete(int id)
        {
            var tipoAnimal = _context.TipoAnimal.Where(t => t.Id == id).FirstOrDefault();
            _context.TipoAnimal.Remove(tipoAnimal);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}