using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class LarTemporario
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Nome do Lar Temporario")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Nome do lar é obrigatório")]
        [MaxLength(100)]
        public String NomeLarTemporario { get; set; }

        [Display(Name = "Responsável Lar Temporário")]
        [ForeignKey("ResponsavelLarTemporario")]
        public int IdResponsavelLarTemporario { get; set; }

        [Display(Name = "Contato - Status")]
        [ForeignKey("StatusContato")]
        public int IdStatusContato { get; set; }

        [Display(Name = "Prévia/Comentário")]
        [DataType(DataType.Text)]
        [MaxLength(4000)]
        public String? PreviaComentario { get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Date)]
        //[Required(ErrorMessage = "Data do Cadastro do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataCadastro { get; set; }

        [Display(Name = "Ativo?")]
        public bool Ativo { get; set; }

        public String? DataArquivamento { get; set; }

    }
}
