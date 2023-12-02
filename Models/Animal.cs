using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{

    public class Animal
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Meu Nome")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Nome do pet é obrigatório")]
        [MaxLength(100)]
        [StringLength(100)]
        public string Nome { get; set; }

        [Display(Name = "Nome Final")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        [StringLength(100)]
        public String? NomeFinal { get; set; }

        [Display(Name = "Tipo")]
        [Required(ErrorMessage = "Tipo do pet é obrigatório")]
        [ForeignKey("TipoAnimal")]
        public int IdTipoAnimal { get; set; }
        public virtual TipoAnimal TipoAnimal { get; set; }

        [Display(Name = "Gênero")]
        [Required(ErrorMessage = "Gênero do pet é obrigatório")]
        [ForeignKey("Genero")]
        public int IdGenero { get; set; }
        public virtual Genero Genero { get; set; }

        [Display(Name = "Cor do pelo")]
        [Required(ErrorMessage = "Cor do pelo do pet é obrigatório")]
        [ForeignKey("CorPelo")]
        public int IdCorPelo { get; set; }
        public virtual CorPelo CorPelo { get; set; }
        
        [Display(Name = "Data do Resgate")]
        [BindProperty, DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Resgate do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public DateTime DataResgate { get; set; }

        [Range(0, int.MaxValue)]
        public int? IdadeAnos { get; set; }

        [Range(0, int.MaxValue)]
        public int? IdadeMeses { get; set; }

        [Display(Name = "Peso (kg)")]
        [Required(ErrorMessage = "Peso do pet é obrigatório")]
        public double Peso { get; set; }

        [Display(Name = "Porte")]
        [Required(ErrorMessage = "Porte do pet é obrigatório")]
        [ForeignKey("Porte")]
        public int IdPorte { get; set; }
        public virtual Porte Porte { get; set; }

        [Display(Name = "Adestrar?")]
        public bool Adestravel { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(255)]
        public String? Foto { get; set; }

        [Display(Name = "História")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "História do animal obrigatório")]
        [MaxLength(4000)]
        [StringLength(4000)]
        public String Historia { get; set; }
        public int IdProcedimentoPadrao { get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Cadastro do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public DateTime DataCadastro { get; set; }

        [Display(Name = "Data da Divulgacao")]
        [BindProperty, DataType(DataType.Date)]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public DateTime? DataDivulgacao { get; set; }

        [Display(Name = "Lar Temporário")]
        [Required(ErrorMessage = "Lar temporário do pet é obrigatório")]
        [ForeignKey("LarTemporario")]
        public int IdLarTemporario { get; set; }
        public virtual LarTemporario LarTemporario { get; set; }
        public double? DespesaMensal { get; set; }
        public bool Falecido { get; set; }

        [Display(Name = "Data do Falecimento")]
        [BindProperty, DataType(DataType.Date)]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public DateTime? DataFalecimento { get; set; }

        [Display(Name = "Causa Falecimento")]
        [DataType(DataType.Text)]
        [ForeignKey("CausaFalecimento")]
        public int? IdCausaFalecimento { get; set; }
        public virtual CausaFalecimento CausaFalecimento { get; set; }
    }
}