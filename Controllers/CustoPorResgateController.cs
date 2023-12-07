using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class CustoPorResgateController : Controller
    {
        private readonly ApplicationContext _context;
        public CustoPorResgateController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.CustoPorResgate.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            CustoPorResgate CustoPorResgate = new CustoPorResgate();

            ViewBag.Acao = CustoPorResgate.Acao;
            ViewBag.CustoMacho = CustoPorResgate.CustoMacho;
            ViewBag.CustoFemea = CustoPorResgate.CustoFemea;
            ViewBag.Ativo = CustoPorResgate.Ativo;
            ViewBag.DataCadastro = CustoPorResgate.DataCadastro;

            return View(CustoPorResgate);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CustoPorResgate custoPorResgate)
        {
            _context.Add(custoPorResgate);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var custoPorResgate = _context.CustoPorResgate.Where(d => d.Id == id).FirstOrDefault();

            return View(custoPorResgate);
        }

        [HttpPost]
        public ActionResult Edit(CustoPorResgate Model)
        {
            var custoPorResgate = _context.CustoPorResgate.Where(d => d.Id == Model.Id).FirstOrDefault();

            if (custoPorResgate != null)
            {
                custoPorResgate.Acao = Model.Acao;
                custoPorResgate.CustoMacho = Model.CustoMacho;
                custoPorResgate.CustoFemea = Model.CustoFemea;
                custoPorResgate.Ativo = Model.Ativo;
                custoPorResgate.DataCadastro = Model.DataCadastro;

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
            var custoPorResgate = _context.CustoPorResgate.Where(d => d.Id == id).FirstOrDefault();
            _context.CustoPorResgate.Remove(custoPorResgate);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}