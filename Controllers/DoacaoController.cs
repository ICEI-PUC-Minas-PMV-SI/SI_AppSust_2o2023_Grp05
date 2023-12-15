using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class DoacaoController : Controller
    {
        private readonly ApplicationContext _context;
        public DoacaoController(ApplicationContext context)
        {
            _context = context;
        }
        
        public ActionResult Index()
        {   
            return View(_context.Doacao.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            Doacao Doacao = new Doacao();

            ViewBag.IdPadrinhoDoador = _context.Usuario;
            ViewBag.ValorRealEntrada = Doacao.ValorRealEntrada;
            ViewBag.Recebido = Doacao.Recebido;
            ViewBag.Cobranca = Doacao.Cobranca;
            ViewBag.IdCategoria = Doacao.IdCategoria;
            ViewBag.IdListaBanco = Doacao.IdListaBanco;
            ViewBag.IdListaStatusDoacao = Doacao.IdListaStatusDoacao;
            //depois arrumar isso
            //ViewBag.IdCategoria = _context.DoacaoCategoria;
            //ViewBag.IdListaBanco = _context.ListaBanco;
            //ViewBag.IdListaStatusDoacao = _context.ListaStatusDoacao;
            ViewBag.Observacao = Doacao.Observacao;
            ViewBag.DataEntrada = Doacao.DataEntrada;

            return View(Doacao);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Doacao doacao)
        {
            //if (ModelState.IsValid)
            //{

            _context.Add(doacao);
            _context.SaveChanges();

            return RedirectToAction("Index");
                
            //}
            //else
            //{
            //    return View(animal);
            //}

        }


        public ActionResult Edit(int id)
        {
            var doacao = _context.Doacao.Where(a => a.Id == id).FirstOrDefault();


            ViewBag.IdPadrinhoDoador = _context.Usuario;
            //ViewBag.IdCategoria = _context.DoacaoCategoria;
            //ViewBag.IdListaBanco = _context.ListaBanco;
            //ViewBag.IdListaStatusDoacao = _context.ListaStatusDoacao;

            return View(doacao);
        }

        [HttpPost]
        public ActionResult Edit(Doacao Model)
        {
            var doacao = _context.Doacao.Where(a => a.Id == Model.Id).FirstOrDefault();
            
            if (doacao != null)
            {
                doacao.IdPadrinhoDoador = Model.IdPadrinhoDoador;
                doacao.ValorRealEntrada = Model.ValorRealEntrada;
                doacao.Recebido = Model.Recebido;
                doacao.Cobranca = Model.Cobranca;
                doacao.IdCategoria = Model.IdCategoria;
                doacao.IdListaBanco = Model.IdListaBanco;
                doacao.IdListaStatusDoacao = Model.IdListaStatusDoacao;
                doacao.Observacao = Model.Observacao;
                doacao.DataEntrada = Model.DataEntrada;

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
            var doacao = _context.Doacao.Where(a => a.Id == id).FirstOrDefault();
            _context.Doacao.Remove(doacao);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}