using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class CorPeloController : Controller
    {
        private readonly ApplicationContext _context;
        public CorPeloController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.CorPelo.ToList());
        }

        //debugar
        [HttpGet]
        public ActionResult Create()
        {
            CorPelo CorPelo = new CorPelo();

            ViewBag.CorPeloDesc = CorPelo.CorPeloDesc;
            return View(CorPelo);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CorPelo corPelo)
        {
            _context.Add(corPelo);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var corPelo = _context.CorPelo.Where(d => d.Id == id).FirstOrDefault();
            return View(corPelo);
        }

        [HttpPost]
        public ActionResult Edit(CorPelo Model)
        {
            var corPelo = _context.CorPelo.Where(d => d.Id == Model.Id).FirstOrDefault();

            if (corPelo != null)
            {
                corPelo.CorPeloDesc = Model.CorPeloDesc;

                _context.SaveChanges();

                // It will redirect to the Read method
                return RedirectToAction("Index");
            }
            else
                return View();
        }

        // POST: /Animal/Delete/id//sd
        public ActionResult Delete(int id)
        {
            var corPelo = _context.CorPelo.Where(d => d.Id == id).FirstOrDefault();
            _context.CorPelo.Remove(corPelo);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}