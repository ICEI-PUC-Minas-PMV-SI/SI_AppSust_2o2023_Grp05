using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class Tipo
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Tipo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Tipo animal obrigatório")]
        [MaxLength(50)]
        public String TipoDesc { get; set; }
    }
}
