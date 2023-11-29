using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class LarTemporario
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Cor do pelo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Cor do pelo do animal obrigatório")]
        [MaxLength(100)]
        public String NomeLarTemporario { get; set; }

        [Display(Name = "Responsável Lar Temporário")]
        [ForeignKey("ResponsavelLarTemporario")]
        public int IdResponsavelLarTemporario { get; set; }

        [Display(Name = "Contato - Status")]
        [ForeignKey("StatusContato")]
        public int IdStatusContato { get; set; }
        
        public String PreviaComentario { get; set; }

        public DateOnly DataCadastro { get; set; }

        [Display(Name = "Ativo?")]
        public bool Ativo { get; set; }

        public DateOnly? DataArquivamento { get; set; }

        //Pra quem estiver fazendo o lat temporário, aqui está somente os campos sem validaçao ou relacionamento. Aplicar... Coloquei o esqueleto aqui porque eu preciso do lar na tela de animais -- Sara
    }
}
