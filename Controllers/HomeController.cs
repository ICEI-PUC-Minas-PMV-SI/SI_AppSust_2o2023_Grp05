using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetFriends.Data;
using PetFriends.Models;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;

namespace PetFriends.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public IActionResult Email(Email email)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            MailMessage mailMessage = new MailMessage();
            smtpClient.Credentials = new NetworkCredential
            {
                //Credenciais do email
                //UserName = "ongpetfriends@gmail.com",
                //Password = "Ogn2023pet2023friends!@#$"

                //turn on 2-factor authentication first
                //create app pass: https://myaccount.google.com/u/0/apppasswords?pli=1&rapt=AEjHL4NuuWD9E7vyqwfN8hCnd1eNF8qX4l7p_lugZgr8hiICebARA5VqSXgkT2b38gnX72MVEj1d98dkTPC93reaaXIy5Bh9lqSDRfWrrADSJzV95NwucE0
                //nao usar credentials do email direto aqui - nao funcional - seguir os passos acima
                UserName = "ongpetfriends@gmail.com",
                Password = "ucwn etap ghsg oqjg"
               
            };

            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            mailMessage.From = new MailAddress(email.Remetente);
            mailMessage.To.Add("ongpetfriends@gmail.com");
            mailMessage.Subject = "Novo questionário pet - " + email.NomeRemetente;
            mailMessage.Body = "Email: " + email.Remetente + "\n" + 
                               "Nome Completo: " + email.NomeRemetente + "\n" + 
                               "RG: " + email.RgRemetente + "\n" + 
                               "CPF: " + email.CpfRemetente + "\n" + 
                               "Telefone: " + email.TelefoneRemetente + "\n" +
                               "Concorda em avisar em caso de alteração de dados do contato?: " + email.AvisarRemetente + "\n" +
                               "Endereço: " + email.EnderecoCompletoRemetente + "\n" +
                               "CEP: " + email.CepRemetente + "\n" +
                               "Profissão: " + email.ProfissaoRemetente + "\n" +
                               "Religião: " + email.ReligiaoRemetente + "\n" +
                               "Link rede social: " + email.RedeSocialRemetente + "\n" +
                               "Como ficou sabendo sobre a ONG: " + email.ComoFicouSabendoRemetente + "\n" ;

            if (smtpClient != null)
                smtpClient.Send(mailMessage);

            return RedirectToAction("Index");
        }
    }
}