using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class Genero
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Gênero")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Gênero animal obrigatório")]
        [MaxLength(100)]
        public String GeneroDesc { get; set; }
    }
}
