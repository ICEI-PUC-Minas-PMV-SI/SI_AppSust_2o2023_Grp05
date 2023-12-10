using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class Login
    {
        [Display(Name = "Email")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Email é obrigatório", AllowEmptyStrings = false)]
        [MinLength(10)]
        [MaxLength(100)]
        public String Email { get; set; }

        [Display(Name = "Senha")]
        [Required(ErrorMessage = "* Senha é obrigatória", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        [MinLength(10)]
        [MaxLength(100)]
        public String Senha { get; set; }
                
    }
}


