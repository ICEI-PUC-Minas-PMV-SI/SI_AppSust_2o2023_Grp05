using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{

    public class Adocao
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Pet")]
        [Required(ErrorMessage = "* Pet é obrigatório")]
        [ForeignKey("Animal")]
        public int IdAnimal { get; set; }
        //public virtual Animal Animal { get; set; }

        [Display(Name = "Data da Adocao")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data da Adocao do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String DataAdocao { get; set; }

        [Display(Name = "Adotante")]
        [Required(ErrorMessage = "* Adotante é obrigatório")]
        [ForeignKey("Usuario")]
        public int IdAdotante { get; set; }
        //public virtual Usuario Usuario { get; set; }

        [Display(Name = "Motivo da Adocao")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Motivo da Adocao do pet é obrigatório")]
        [MaxLength(255)]
        [StringLength(255)]
        public string MotivoAdocao { get; set; }

        [Display(Name = "Termo da Adocao")]
        [DataType(DataType.Text)]
        [MaxLength(255)]
        [StringLength(255)]
        public string Termo { get; set; }

        [Display(Name = "Divulgado no grupo?")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        public bool DilvulgacaoGrupoApoiadores { get; set; }

        [Display(Name = "Tipo/Meio da Adocao")]
        [DataType(DataType.Text)]
        [MaxLength(255)]
        [StringLength(255)]
        [Required(ErrorMessage = "* Meio de adoção é obrigatório")]
        public string? TipoMeioAdocao { get; set; }

        [Display(Name = "Adocao Concluida?")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        public bool AdocaoConcluida { get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Cadastro é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String DataCadastro { get; set; }        
    }
}