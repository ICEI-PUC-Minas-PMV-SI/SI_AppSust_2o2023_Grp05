using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class Porte
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Porte")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Porte animal obrigatório")]
        [MaxLength(50)]
        public String PorteDesc { get; set; }
    }
}
