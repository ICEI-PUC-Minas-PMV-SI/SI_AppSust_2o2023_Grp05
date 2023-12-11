using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class Raca
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Tipo")]
        [Required(ErrorMessage = "* Tipo do pet é obrigatório")]
        [ForeignKey("TipoAnimal")]
        public int IdTipoAnimal { get; set; }
        public virtual TipoAnimal TipoAnimal { get; set; }

        [Display(Name = "Raça")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Raça animal obrigatório")]
        [MaxLength(50)]
        public String RacaDesc { get; set; }
    }
}
