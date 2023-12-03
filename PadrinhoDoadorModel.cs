using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class PadrinhoDoador
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Nome Completo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Campo obrigatório")]
        [MaxLength(100)]
        public string? NomeCompleto { get; set; }

        [Display(Name = "RG")]
        [DataType(DataType.Text)]
        [MaxLength(20)]
        public string? RegistroGeral { get; set; }

        [Display(Name = "CPF")]
        [DataType(DataType.Text)]
        [MaxLength(14)]
        public string? Cpf { get; set; }

        [Display(Name = "Telefone/Celular")]
        [DataType(DataType.Text)]
        [MaxLength(25)]
        public string? TelefoneCelular { get; set; }

        [Display(Name = "Endereço")]
        [DataType(DataType.Text)]
        [MaxLength(200)]
        public string? Endereco { get; set; }

        
        [Display(Name = "Casa/Apto")]
        [DataType(DataType.Text)]
        [MaxLength(11)]
        public string? CasaApto { get; set; }
            
        [Display(Name = "Complemento")]
        [DataType(DataType.Text)]
        [MaxLength(50)]
        public string? Complemento { get; set; }

        [Display(Name = "CEP")]
        [DataType(DataType.Text)]
        [MaxLength(10)]
        public string? Cep { get; set; }

        [Display(Name = "Bairro")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        public string? Bairro { get; set; }

        [Display(Name = "Cidade")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        public string? Cidade { get; set; }

        [Display(Name = "Estado")]
        [DataType(DataType.Text)]
        [MaxLength(20)]
        public string? Estado { get; set; }

        [Display(Name = "Ativo?")]
        public bool? Ativo { get; set; }

        [Display(Name = "Rede Social")]
        [DataType(DataType.Text)]
        [MaxLength(200)]
        public string? RedeSocial { get; set; }

        [Display(Name = "Padrinho/Doador")]
        [DataType(DataType.Text)]
        [MaxLength(20)]
        public string? PadrinhoOuDoador { get ; set ; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public DateTime DataCadastro { get; set ;}

    }

    public class CasaApt
    {
        public string? CasaApto {get;set;}
    }
}
