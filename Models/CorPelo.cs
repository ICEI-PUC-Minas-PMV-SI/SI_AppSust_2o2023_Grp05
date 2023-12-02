using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class CorPelo
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Cor do pelo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Cor do pelo do animal obrigatório")]
        [MaxLength(100)]
        public String? CorPeloDesc { get; set; }
    }
}