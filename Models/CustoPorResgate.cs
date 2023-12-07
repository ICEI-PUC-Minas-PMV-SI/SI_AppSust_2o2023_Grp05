using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class CustoPorResgate
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Ação")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Ação é obrigatório")]
        [MaxLength(100)]
        [StringLength(100)]
        public String Acao { get; set; }

        [Display(Name = "Custo Macho")]
        [Required(ErrorMessage = "Custo Macho é obrigatório")]
        [Range(0, int.MaxValue, ErrorMessage = "Custo somente acima de 0.")]
        public double CustoMacho { get; set; }

        [Display(Name = "Custo Fêmea")]
        [Required(ErrorMessage = "Custo Fêmea é obrigatório")]
        [Range(0, int.MaxValue, ErrorMessage = "Custo somente acima de 0.")]
        public double CustoFemea{ get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Data do Cadastro do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String DataCadastro { get; set; }

        [Display(Name = "Ativo: Sim-Não")]
        [Required(ErrorMessage = "Campo obrigatório")]
        public bool Ativo { get; set; }
        
    }
}
