using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class Usuario
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Nome Completo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Nome completo é obrigatório")]
        [MaxLength(200)]
        public String NomeCompleto { get; set; }

        [Display(Name = "Registro Geral")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* RG é obrigatório")]
        [MaxLength(20)]
        public String RegistroGeral { get; set; }

        [Display(Name = "CPF")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* CPF é obrigatório")]
        [MaxLength(20)]
        public String Cpf { get; set; }

        [Display(Name = "Telefone")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Telefone é obrigatório")]
        [MaxLength(50)]
        public String Telefone { get; set; }

        [Display(Name = "Endereco")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Endereco é obrigatório")]
        [MaxLength(200)]
        public String Endereco { get; set; }

        [Display(Name = "Número Casa/Apartamento")]
        [Required(ErrorMessage = "* Número Casa/Apartamento é obrigatório")]
        public int NumeroCasaApartamento { get; set; }

        [Display(Name = "Complemento")]
        [DataType(DataType.Text)]
        [MaxLength(20)]
        public String Complemento { get; set; }

        [Display(Name = "CEP")]
        [Required(ErrorMessage = "* CEP é obrigatório")]
        public int Cep { get; set; }

        [Display(Name = "Bairro")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Bairro é obrigatório")]
        [MaxLength(100)]
        public String Bairro { get; set; }

        [Display(Name = "Cidade")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Cidade é obrigatório")]
        [MaxLength(100)]
        public String Cidade { get; set; }

        [Display(Name = "Estado")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Estado é obrigatório")]
        [MaxLength(50)]
        public String Estado { get; set; }
       
        [Display(Name = "Tipo de usuário")]
        [Required(ErrorMessage = "* Tipo é obrigatório")]
        [ForeignKey("TipoUsuario")]
        public int IdTipoUsuario { get; set; }
        public virtual TipoUsuario TipoUsuario { get; set; }

        [Display(Name = "Ativo?")]
        [Required(ErrorMessage = "* Status é obrigatório")]
        public bool Ativo { get; set; }

        [Display(Name = "Link Rede Social")]
        [DataType(DataType.Text)]
        [MaxLength(255)]
        public String LinkRedeSocial { get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Cadastro é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataCadastro { get; set; }

        [Display(Name = "Usuario")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Usuario é obrigatório")]
        [MinLength(10)]
        [MaxLength(100)]
        public String NomeUsuario { get; set; }

        [Display(Name = "Senha")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Senha é obrigatório")]
        [MinLength(10)]
        [MaxLength(100)]
        public String Senha { get; set; }

        [Display(Name = "Email")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Email é obrigatório")]
        [MinLength(10)]
        [MaxLength(100)]
        public String Email { get; set; }
    }
}