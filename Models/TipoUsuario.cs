using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class TipoUsuario
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "TipoAnimal")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Tipo usuario é obrigatório")]
        [MaxLength(100)]
        public String TipoUsuarioDesc { get; set; }
    }
}