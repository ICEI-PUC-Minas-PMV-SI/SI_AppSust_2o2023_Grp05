using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{

    public class Animal
    {

        public int Id { get; set; }

        [Display(Name = "Meu Nome")]
        [DataType(DataType.Text)]
        [Required]
        [MaxLength(100)]
        public string Nome { get; set; }

        [Display(Name = "Nome Final")]
        [DataType(DataType.Text)]
        public string? NomeFinal { get; set; }

        [Display(Name = "O que eu sou")]
        [Required(ErrorMessage = "Tipo animal obrigatório")]
        public int IdTipoAnimal { get; set; }

        [Display(Name = "Id Gênero")]
        [Required]
        [Key]
        public int IdGenero { get; set; }

        //public Genero Genero { get; set; }

        [Display(Name = "Cor do pelo")]
        [Required(ErrorMessage = "Cor do pelo obrigatório")]
        public int IdCorPelo { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public string? DataResgate { get; set; }

        public int? IdadeAnos { get; set; }
        public int? IdadeMeses { get; set; }

        [Required(ErrorMessage = "Peso obrigatório")]
        public double Peso { get; set; }

        [Display(Name = "Porte")]

        [Required(ErrorMessage = "Porte do animal obrigatório")]
        public int IdPorteAnimal { get; set; }

        public bool Adestravel { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(255)]
        public string? Foto { get; set; }

        [Required(ErrorMessage = "História do animal obrigatório")]
        [DataType(DataType.Text)]
        [MaxLength(4000)]
        public string Historia { get; set; }

        [Required(ErrorMessage = "Porte do animal obrigatório")]
        public int IdProcedimentoPadrao { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public string? DataCadastro { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [MaxLength(10)]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public string? DataDivulgacao { get; set; }

        [Required(ErrorMessage = "Lar temporário obrigatório")]
        public int IdLarTemporario { get; set; }

        public double? DespesaMensal { get; set; }

        public bool Falecido { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [MaxLength(10)]
        [RegularExpression(@"/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/")]
        public string? DataFalecimento { get; set; }

        public int? IdCausaFalecimento { get; set; }
    }

    /*public class Genero
    {
        public int Id { get; set; }
        public string GeneroDesc { get; set; }
    }*/

}