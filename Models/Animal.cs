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
        [Required(ErrorMessage = "Nome animal obrigatório")]
        [MaxLength(100)]
        public String Nome { get; set; }

        [Display(Name = "Nome Final")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        public String? NomeFinal { get; set; }

        [Display(Name = "Tipo")]
        [ForeignKey("TipoAnimal")]
        public int IdTipoAnimal{ get; set; }

        public virtual TipoAnimal TipoAnimal { get; set; }

        [Display(Name = "Gênero")]
        [ForeignKey("Genero")]
        public int IdGenero { get; set; }
        public virtual Genero Genero { get; set; }

        [Display(Name = "Cor do pelo")]
        [ForeignKey("CorPelo")]
        public int IdCorPelo { get; set; }
        public virtual CorPelo CorPelo { get; set; }

        [DataType(DataType.Text)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public String? DataResgate { get; set; }

        [Range(int.MinValue, 0)]
        public int? IdadeAnos { get; set; }

        [Range(int.MinValue, 0)]
        public int? IdadeMeses { get; set; }

        [Required(ErrorMessage = "Peso obrigatório")]
        public double Peso { get; set; }

        [Display(Name = "Porte")]
        [ForeignKey("Porte")]
        public int IdPorte { get; set; }
        public virtual Porte Porte { get; set; }

        [Display(Name = "Adestrar?")]
        public bool Adestravel { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(255)]
        public String? Foto { get; set; }

        [Required(ErrorMessage = "História do animal obrigatório")]
        [DataType(DataType.Text)]
        [MaxLength(4000)]
        public String Historia { get; set; }

        [Required(ErrorMessage = "Porte do animal obrigatório")]
        public int IdProcedimentoPadrao { get; set; }

        [DataType(DataType.Text)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public String? DataCadastro { get; set; }

        [DataType(DataType.Text)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [MaxLength(10)]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public String? DataDivulgacao { get; set; }

        
        [Display(Name = "Lar Temporario")]
        [ForeignKey("LarTemporario")]
        public int IdLarTemporario { get; set; }
        public virtual LarTemporario LarTemporario { get; set; }
        public double? DespesaMensal { get; set; }

        public bool Falecido { get; set; }

        [DataType(DataType.Text)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [MaxLength(10)]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public String? DataFalecimento { get; set; }

        public int? IdCausaFalecimento { get; set; }
    }
}