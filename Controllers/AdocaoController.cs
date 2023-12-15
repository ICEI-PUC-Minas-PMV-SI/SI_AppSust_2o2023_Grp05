using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class AdocaoController : Controller
    {
        private readonly ApplicationContext _context;
        public AdocaoController(ApplicationContext context)
        {
            _context = context;
        }
        
        public ActionResult Index()
        {   
            return View(_context.Adocao.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            Adocao Adocao = new Adocao();

            ViewBag.IdAnimal = Adocao.IdAnimal;
            ViewBag.IdAdotante = Adocao.IdAdotante;
            ViewBag.MotivoAdocao = Adocao.MotivoAdocao;
            ViewBag.Termo = Adocao.Termo;
            ViewBag.DilvulgacaoGrupoApoiadores = Adocao.DilvulgacaoGrupoApoiadores;
            ViewBag.DataAdocao = Adocao.DataAdocao;
            ViewBag.DataCadastro = Adocao.DataCadastro;
            ViewBag.AdocaoConcluida = Adocao.AdocaoConcluida;           

            return View(Adocao);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Adocao adocao)
        {
            _context.Add(adocao);
            _context.SaveChanges();


            _context.SaveChanges();

            return RedirectToAction("Index");
        }


        public ActionResult Edit(int id)
        {
            var adocao = _context.Adocao.Where(a => a.Id == id).FirstOrDefault();

            //ViewBag.IdAnimal = _context.Animal;
            //ViewBag.IdAdotante = _context.Usuario;
            
            return View(adocao);
        }

        [HttpPost]
        public ActionResult Edit(Adocao Model)
        {
            var adocao = _context.Adocao.Where(a => a.Id == Model.Id).FirstOrDefault();
            
            if (adocao != null)
            {

                adocao.IdAnimal = Model.IdAnimal;
                adocao.IdAdotante = Model.IdAdotante;
                adocao.MotivoAdocao = Model.MotivoAdocao;
                adocao.Termo = Model.Termo;
                adocao.DilvulgacaoGrupoApoiadores = Model.DilvulgacaoGrupoApoiadores;
                adocao.DataAdocao = Model.DataAdocao;
                adocao.DataCadastro = Model.DataCadastro;
                adocao.AdocaoConcluida = Model.AdocaoConcluida;

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
            var adocao = _context.Adocao.Where(a => a.Id == id).FirstOrDefault();
            _context.Adocao.Remove(adocao);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}