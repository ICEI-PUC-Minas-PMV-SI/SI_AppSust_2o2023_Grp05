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
                //UserName = "ongpetfriends@gmail.com",
                //Password = "Ogn2023pet2023friends!@#$"

                UserName = "ongpetfriends@gmail.com",
                Password = "ucwn etap ghsg oqjg"
                //turn on 2-factor authentication first
                //create app pass: https://myaccount.google.com/u/0/apppasswords?pli=1&rapt=AEjHL4NuuWD9E7vyqwfN8hCnd1eNF8qX4l7p_lugZgr8hiICebARA5VqSXgkT2b38gnX72MVEj1d98dkTPC93reaaXIy5Bh9lqSDRfWrrADSJzV95NwucE0
            };

            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            mailMessage.From = new MailAddress(email.Remetente);
            mailMessage.To.Add("ongpetfriends@gmail.com");
            mailMessage.Subject = "Novo Formulário de Doaçao " + email.NomeRemetente;
            mailMessage.Body = string.Format("{0} {1} {2}", email.NomeRemetente, email.EnderecoRemetente, email.Mensagem);

            if (smtpClient != null)
                smtpClient.Send(mailMessage);

            return RedirectToAction("Index");
        }
    }
}