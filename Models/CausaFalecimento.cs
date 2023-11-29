using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class CausaFalecimento
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "CausaFalecimento")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        public String? CausaDesc { get; set; }
    }
}
