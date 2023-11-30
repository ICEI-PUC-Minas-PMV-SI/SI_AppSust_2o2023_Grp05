using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
            ViewBag.IdLarTemporario = _context.LarTemporario;
            ViewBag.IdCausaFalecimento = _context.CausaFalecimento;


            return View(Animal);
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
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Animal animal)
        {
            if (ModelState.IsValid)
            {
                _context.Add(animal);
                _context.SaveChanges();

                return RedirectToAction("Index");
                
            }
            else
            {
                return View(animal);
            }



        }


        public ActionResult Edit(int id)
        {
            var animal = _context.Animal.Where(a => a.Id == id).FirstOrDefault();
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
                ViewBag.IdGenero = _context.Genero;
                ViewBag.IdTipo = _context.TipoAnimal;
                /*animal.IdTipoAnimal = Model.IdTipoAnimal;
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
    }
}