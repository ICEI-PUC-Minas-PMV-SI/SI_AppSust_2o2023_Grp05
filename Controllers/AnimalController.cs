using Grpc.Core;
using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class AnimalController : Controller
    {
        private readonly ApplicationContext _context;
        public AnimalController(ApplicationContext context)
        {
            _context = context;
        }
        
        public ActionResult Index()
        {
            return View(_context.Animal.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {          
            Animal Animal = new Animal();
            
            ViewBag.Nome = Animal.Nome;
            ViewBag.NomeFinal = Animal.NomeFinal;
            ViewBag.IdGenero = _context.Genero;
            ViewBag.IdTipoAnimal = _context.TipoAnimal;
            ViewBag.IdPorte = _context.Porte;            
            ViewBag.IdadeAnos = Animal.IdadeAnos;
            ViewBag.IdadeMeses = Animal.IdadeMeses;
            ViewBag.IdCorPelo = _context.CorPelo;
            ViewBag.Peso = Animal.Peso;
            ViewBag.Adestravel = Animal.Adestravel;
            ViewBag.IdLarTemporario = _context.LarTemporario;
            ViewBag.Falecido = Animal.Falecido;
            ViewBag.IdCausaFalecimento = _context.CausaFalecimento;
            ViewBag.DataCadastro = Animal.DataCadastro;
            ViewBag.DataDivulgacao = Animal.DataDivulgacao;
            ViewBag.DataFalecimento = Animal.DataFalecimento;
            ViewBag.DataResgate = Animal.DataResgate;
            
            if(Animal.Foto == null)
            {
                Animal.Foto = "~/Images/logo.png";
                ViewBag.Foto = Animal.Foto;
            }
            else
            {
                ViewBag.Foto = "~/Images/" + Animal.Foto;                
            }
            return View(Animal);
            /*
           
            animal.id_procedimento_padrao = Model.id_procedimento_padrao;            
            animal.despesa_mensal = Model.despesa_mensal;
            */
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Animal animal)
        {
            //if (ModelState.IsValid)
            //{
            if (animal.Foto == null)
            {
                animal.Foto = "~/Images/logo.png";
            }
            else
            {
                animal.Foto = "~/Images/" + animal.Foto;
            }

            _context.Add(animal);
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
            var animal = _context.Animal.Where(a => a.Id == id).FirstOrDefault();
            ViewBag.IdTipoAnimal = _context.TipoAnimal;
            ViewBag.IdGenero = _context.Genero;
            ViewBag.IdPorte = _context.Porte;
            ViewBag.IdCorPelo = _context.CorPelo;
            ViewBag.IdLarTemporario = _context.LarTemporario;
            ViewBag.IdCausaFalecimento = _context.CausaFalecimento;

            return View(animal);
        }

        [HttpPost]
        public ActionResult Edit(Animal Model)
        {
            var animal = _context.Animal.Where(a => a.Id == Model.Id).FirstOrDefault();
            
            if (animal != null)
            {
                animal.Nome = Model.Nome;
                animal.NomeFinal = Model.NomeFinal;
                animal.IdTipoAnimal = Model.IdTipoAnimal;
                animal.IdGenero = Model.IdGenero;
                animal.IdPorte = Model.IdPorte;
                animal.IdadeAnos = Model.IdadeAnos;
                animal.IdadeMeses = Model.IdadeMeses;
                animal.IdCorPelo = Model.IdCorPelo;
                animal.Peso = Model.Peso;
                animal.Adestravel = Model.Adestravel;
                animal.IdLarTemporario = Model.IdLarTemporario;
                animal.Falecido = Model.Falecido;
                animal.IdCausaFalecimento = Model.IdCausaFalecimento;
                animal.DataCadastro = Model.DataCadastro;
                animal.DataDivulgacao = Model.DataDivulgacao;
                animal.DataFalecimento = Model.DataFalecimento;
                animal.DataResgate = Model.DataResgate;
                animal.Historia = Model.Historia;

                if (Model.Foto == null)
                {
                    animal.Foto = animal.Foto;
                }
                else
                {
                    animal.Foto = "~/Images/" + Model.Foto;
                }

                _context.SaveChanges();      

                // It will redirect to the Read method
                return RedirectToAction("Index");
            }
            else
                return View();
        }

        // POST: /Animal/Delete/id
        public ActionResult Delete(int id)
        {
            var animal = _context.Animal.Where(a => a.Id == id).FirstOrDefault();
            _context.Animal.Remove(animal);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}