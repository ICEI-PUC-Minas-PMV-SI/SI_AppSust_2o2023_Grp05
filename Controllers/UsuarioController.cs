using Microsoft.AspNetCore.Mvc;
using PetFriends.Data;
using PetFriends.Models;
using System.Web;

namespace PetFriends.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly ApplicationContext _context;
        public UsuarioController(ApplicationContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            return View(_context.Usuario.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            Usuario Usuario = new Usuario();

            ViewBag.NomeCompleto = Usuario.NomeCompleto;
            ViewBag.RegistroGeral = Usuario.RegistroGeral;
            ViewBag.Cpf = Usuario.Cpf;
            ViewBag.Telefone = Usuario.Telefone;
            ViewBag.Endereco = Usuario.Endereco;
            ViewBag.NumeroCasaApartamento = Usuario.NumeroCasaApartamento;
            ViewBag.Complemento = Usuario.Complemento;
            ViewBag.Cep = Usuario.Cep;
            ViewBag.Bairro = Usuario.Bairro;
            ViewBag.Cidade = Usuario.Cidade;
            ViewBag.Estado = Usuario.Estado;
            ViewBag.IdTipoUsuario = _context.TipoUsuario;
            ViewBag.Ativo = Usuario.Ativo;
            ViewBag.LinkRedeSocial = Usuario.LinkRedeSocial;
            ViewBag.DataCadastro = Usuario.DataCadastro;
            ViewBag.NomeUsuario = Usuario.NomeUsuario;
            ViewBag.Senha = Usuario.Senha;
            ViewBag.Email = Usuario.Email;

            return View(Usuario);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Usuario usuario)
        {       
            _context.Add(usuario);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Edit(int id)
        {
            var usuario = _context.Usuario.Where(a => a.Id == id).FirstOrDefault();
            ViewBag.IdTipoUsuario = _context.TipoUsuario;

            return View(usuario);
        }

        [HttpPost]
        public ActionResult Edit(Usuario Model)
        {
            var usuario = _context.Usuario.Where(a => a.Id == Model.Id).FirstOrDefault();

            if (usuario != null)
            {
                usuario.NomeCompleto = Model.NomeCompleto;
                usuario.RegistroGeral = Model.RegistroGeral;
                usuario.Cpf = Model.Cpf;
                usuario.Telefone = Model.Telefone;
                usuario.Endereco = Model.Endereco;
                usuario.NumeroCasaApartamento = Model.NumeroCasaApartamento;
                usuario.Complemento = Model.Complemento;
                usuario.Cep = Model.Cep;
                usuario.Bairro = Model.Bairro;
                usuario.Cidade = Model.Cidade;
                usuario.Estado = Model.Estado;
                usuario.Telefone = Model.Telefone;
                usuario.IdTipoUsuario = Model.IdTipoUsuario;
                usuario.Ativo = Model.Ativo;
                usuario.LinkRedeSocial = Model.LinkRedeSocial;
                usuario.DataCadastro = Model.DataCadastro;
                usuario.NomeUsuario = Model.NomeUsuario;
                usuario.Senha = Model.Senha;
                usuario.Email = Model.Email;

                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                return View();
        }

        public ActionResult Delete(int id)
        {
            var usuario = _context.Usuario.Where(a => a.Id == id).FirstOrDefault();
            _context.Usuario.Remove(usuario);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}