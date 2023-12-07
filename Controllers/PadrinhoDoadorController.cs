//using Microsoft.AspNetCore.Mvc;
//using PetFriends.Data;
//using PetFriends.Models;
//using System.Collections.Generic;
//using Microsoft.EntityFrameworkCore;
//using System.Web.WebPages.Html;

//namespace PetFriends.Controllers
//{
//    public class PadrinhoDoadorController : Controller
//    {
//        private readonly ApplicationContext _context;
//        public PadrinhoDoadorController(ApplicationContext context)
//        {
//            _context = context;
//        }
//        public ActionResult ListaPadrinhosDoadores()
//        {
//            return View(_context.PadrinhoDoador.ToList());
//        }

//        [HttpGet]
//        public ActionResult Create()
//        {
     
//            PadrinhoDoador PadrinhoDoador = new();
            
//            ViewBag.NomeCompleto = PadrinhoDoador.NomeCompleto;
//            ViewBag.RegistroGeral = PadrinhoDoador.RegistroGeral;
//            ViewBag.Cpf = PadrinhoDoador.Cpf;
//            ViewBag.TelefoneCelular = PadrinhoDoador.TelefoneCelular;
//            ViewBag.Endereco = PadrinhoDoador.Endereco;
//            ViewBag.CasaApto = PadrinhoDoador.CasaApto;
//            ViewBag.Complemento = PadrinhoDoador.Complemento;
//            ViewBag.Cep = PadrinhoDoador.Cep;
//            ViewBag.Bairro = PadrinhoDoador.Bairro;
//            ViewBag.Cidade = PadrinhoDoador.Cidade;
//            ViewBag.Estado = PadrinhoDoador.Estado;
//            ViewBag.Ativo = PadrinhoDoador.Ativo;
//            ViewBag.RedeSocial = PadrinhoDoador.RedeSocial;
//            ViewBag.PadrinhoOuDoador = PadrinhoDoador.PadrinhoOuDoador;
//            ViewBag.DataCadastro = PadrinhoDoador.DataCadastro;

//            return View(PadrinhoDoador);
//        }

//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Create(PadrinhoDoador padrinhoDoador)
//        {
//            _context.Add(padrinhoDoador);
//            _context.SaveChanges();
//            return RedirectToAction("ListaPadrinhosDoadores");
//        }

//        public ActionResult Edit(int id)
//        {
//            var padrinhoDoador = _context.PadrinhoDoador.Where(PadrinhoDoador => PadrinhoDoador.Id == id).FirstOrDefault();

//            return View(padrinhoDoador);
//        }

//        [HttpPost]
//        public ActionResult Edit(PadrinhoDoador Model)
//        {
//            var padrinhoDoador = _context.PadrinhoDoador.Where(PadrinhoDoador => PadrinhoDoador.Id == Model.Id).FirstOrDefault();

//            if (padrinhoDoador != null)
//            {
//                padrinhoDoador.NomeCompleto = Model.NomeCompleto;
//                padrinhoDoador.RegistroGeral = Model.RegistroGeral;
//                padrinhoDoador.Cpf = Model.Cpf;
//                padrinhoDoador.TelefoneCelular = Model.TelefoneCelular;
//                padrinhoDoador.Endereco = Model.Endereco;
//                padrinhoDoador.CasaApto = Model.CasaApto;
//                padrinhoDoador.Complemento = Model.Complemento;
//                padrinhoDoador.Cep = Model.Cep;
//                padrinhoDoador.Bairro = Model.Bairro;
//                padrinhoDoador.Cidade = Model.Cidade;
//                padrinhoDoador.Estado = Model.Estado;
//                padrinhoDoador.PadrinhoOuDoador = Model.PadrinhoOuDoador;
//                padrinhoDoador.Ativo = Model.Ativo;
//                padrinhoDoador.RedeSocial = Model.RedeSocial;
//                padrinhoDoador.DataCadastro = Model.DataCadastro;

//                return RedirectToAction ("ListaPadrinhosDoadores");
//            }
//            else
//                return View();
//        }

//        public ActionResult Delete(int id)
//        {
//            var padrinhoDoador = _context.PadrinhoDoador.Where(PadrinhoDoador => PadrinhoDoador.Id == id).FirstOrDefault();
//            _context.PadrinhoDoador.Remove(padrinhoDoador);
//            _context.SaveChanges();
//            return RedirectToAction("ListaPadrinhosDoadores");
//        }
//    }
//}