using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class LarTemporarioController : Controller
    {
        private readonly ApplicationContext _context;
        public LarTemporarioController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.LarTemporario.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            LarTemporario LarTemporario = new LarTemporario();

            ViewBag.NomeLarTemporario = LarTemporario.NomeLarTemporario;
            ViewBag.IdResponsavelLarTemporario = LarTemporario.IdResponsavelLarTemporario;
            ViewBag.IdStatusContato = LarTemporario.IdStatusContato;
            ViewBag.PreviaComentario = LarTemporario.PreviaComentario;
            ViewBag.DataCadastro = LarTemporario.DataCadastro;
            ViewBag.Ativo = LarTemporario.Ativo;
            ViewBag.DataArquivamento = LarTemporario.DataArquivamento;

            return View(LarTemporario);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(LarTemporario larTemporario)
        {
            _context.Add(larTemporario);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            var larTemporario = _context.LarTemporario.Where(l => l.Id == id).FirstOrDefault();
            return View(larTemporario);
        }

        [HttpPost]
        public ActionResult Edit(LarTemporario Model)
        {
            var larTemporario = _context.LarTemporario.Where(l => l.Id == Model.Id).FirstOrDefault();

            if (larTemporario != null)
            {
                larTemporario.NomeLarTemporario = Model.NomeLarTemporario;
                larTemporario.IdResponsavelLarTemporario = Model.IdResponsavelLarTemporario;
                larTemporario.IdStatusContato = Model.IdStatusContato;
                larTemporario.PreviaComentario = Model.PreviaComentario;
                larTemporario.DataCadastro = Model.DataCadastro;
                larTemporario.Ativo = Model.Ativo;
                larTemporario.DataArquivamento = Model.DataArquivamento;

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
            var larTemporario = _context.LarTemporario.Where(l => l.Id == id).FirstOrDefault();
            _context.LarTemporario.Remove(larTemporario);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
