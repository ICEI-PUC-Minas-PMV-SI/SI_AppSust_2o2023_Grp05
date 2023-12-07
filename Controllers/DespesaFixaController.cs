using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class DespesaFixaController : Controller
    {
        private readonly ApplicationContext _context;
        public DespesaFixaController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.DespesaFixa.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            DespesaFixa DespesaFixa = new DespesaFixa();

            ViewBag.TipoDespesa = DespesaFixa.TipoDespesa;
            ViewBag.ValorDespesa = DespesaFixa.ValorDespesa;
            ViewBag.IdPorte = _context.Porte;
           
            return View(DespesaFixa);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DespesaFixa despesaFixa)
        {
            _context.Add(despesaFixa);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var despesaFixa = _context.DespesaFixa.Where(d => d.Id == id).FirstOrDefault();
            ViewBag.IdPorte = _context.Porte;           

            return View(despesaFixa);
        }

        [HttpPost]
        public ActionResult Edit(DespesaFixa Model)
        {
            var despesaFixa = _context.DespesaFixa.Where(d => d.Id == Model.Id).FirstOrDefault();

            if (despesaFixa != null)
            {
                despesaFixa.TipoDespesa = Model.TipoDespesa;
                despesaFixa.Onde = Model.Onde;
                despesaFixa.ValorDespesa = Model.ValorDespesa;
                despesaFixa.IdPorte = Model.IdPorte;

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
            var despesaFixa = _context.DespesaFixa.Where(d => d.Id == id).FirstOrDefault();
            _context.DespesaFixa.Remove(despesaFixa);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}