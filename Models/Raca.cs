using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class Raca
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Gênero")]
        [ForeignKey("Tipo")]
        public int IdTipo { get; set; }

        public virtual Genero Genero { get; set; }

        [Display(Name = "Raça")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Raça animal obrigatório")]
        [MaxLength(50)]
        public String RacaDesc { get; set; }
    }
}
