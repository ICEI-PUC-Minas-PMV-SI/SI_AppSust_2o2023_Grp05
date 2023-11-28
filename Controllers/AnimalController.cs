using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web.WebPages.Html;

namespace PetFriends.Controllers
{
    public class AnimalController : Controller
    {
        private readonly ApplicationContext _context;
        public AnimalController(ApplicationContext context)
        {
            _context = context;
        }
        /*public IActionResult Index()
        {
            ViewBag.users = _context.Animal.ToList();
            return View();
        }*/


        public ActionResult Index()
        {
            //fetch students from the DB using Entity Framework here
            //ViewBag.AnimalList = _context.Animal.ToList();
            return View(_context.Animal.ToList());
           // return View(_context.Animal.OrderBy(a => a.id).ToList());
        }


        public ActionResult Edit(int id)
        {
            /*var GenerosList = new List<SelectListItem>();

            var DirQuery = from d in _context.Genero select d;
            foreach (var d in DirQuery)
            {
                GenerosList.Add(new SelectListItem { Value = d.Id.ToString(), Text = d.GeneroDesc });
            }
            ViewBag.Directors = GenerosList;

            */
            var animal = _context.Animal.Where(a => a.Id == id).FirstOrDefault();

            return View(animal);
        }

        [HttpPost]
        public ActionResult Edit(Animal Model)
        {

            var animal = _context.Animal.Where(a => a.Id == Model.Id).FirstOrDefault();
            



            // Checking if any such record exist 
            if (animal != null)
            {
                animal.Nome = Model.Nome;
                animal.NomeFinal = Model.NomeFinal;
                /*animal.IdGenero = Model.IdGenero;
                /*
                 * animal.IdTipoAnimal = Model.IdTipoAnimal;
                animal.id_cor_pelo = Model.id_cor_pelo;
                animal.data_resgate = Model.data_resgate;
                animal.idade_anos = Model.idade_anos;
                animal.idade_meses = Model.idade_meses;
                animal.peso = Model.peso;
                animal.id_porte_animal = Model.id_porte_animal;
                animal.adestravel = Model.adestravel;
                animal.foto = Model.foto;
                animal.historia = Model.historia;
                animal.id_procedimento_padrao = Model.id_procedimento_padrao;
                animal.data_cadastro = Model.data_cadastro;
                animal.data_cadastro = Model.data_cadastro;
                animal.id_lar_temporario = Model.id_lar_temporario;
                animal.despesa_mensal = Model.despesa_mensal;
                animal.falecido = Model.falecido;
                animal.data_falecimento = Model.data_falecimento;
                animal.id_causa_falecimento = Model.id_causa_falecimento;*/

                _context.SaveChanges();       


                // It will redirect to 
                // the Read method
                return RedirectToAction("Index");
            }
            else
                return View();

           //return RedirectToAction("Index");
        }



        //public IActionResult AdicionarEditarAnimal()
        //{
        //    ViewBag.users = _context.Animal.ToList();
        //    return View();         
        //}


    }
}