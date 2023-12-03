using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;


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
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {

            Adocao Adocao = new Adocao();

            ViewBag.IdCadastroAnimal = Adocao.CadastroAnimal;
            ViewBag.DataAdocao = Adocao.DataAdocao;
            /*ViewBag.IdCadastroAdotante = Adocao.CadastroAdotante;*/
            ViewBag.MotivoAdocao = Adocao.MotivoAdocao;
            ViewBag.Termo = Adocao.Termo;
            ViewBag.FotoAdocao = Adocao.Foto;
            ViewBag.DivulgacaoGrupoApoiadores = Adocao.DivulgadoGrupoApoiadores;
            ViewBag.AdocaoConcluida = Adocao.AdocaoConcluida;
            ViewBag.DataCadastro = Adocao.DataCadastro;


            return View(Adocao);
           
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Adocao adocao)
        {
            _context.Add(adocao);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Edit(int id)
        {
            var adocao = _context.Adocao.Where(a => a.Id == id).FirstOrDefault();
            return View(adocao);
        }

        public ActionResult Delete(int id)
        {
            var adocao = _context.Adocao.Where(a => a.Id == id).FirstOrDefault();
            _context.Adocao.Remove(adocao);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
