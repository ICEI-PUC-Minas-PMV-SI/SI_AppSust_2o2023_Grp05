using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace PetFriends.Models
{
    public class Adocao
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Animal")]
        [Required(ErrorMessage = "* Animal é obrigatório")]
        [ForeignKey("CadastroAnimal")]
        public int IdCadastroAnimal { get; set; }
        public virtual Animal CadastroAnimal { get; set; }

        /*[Display(Name = "Adotante")]
        [Required(ErrorMessage = "* Animal é obrigatório")]
        [ForeignKey("CadastroAdotante")]
        public int IdCadastroAdotante { get; set; }
        public virtual Adotante CadastroAdotante { get; set; }*/

        [Display(Name = "Data da Adoção")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data da Adocão do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataAdocao { get; set; }

        [Display(Name = "Adoção Concluída?")]
        public bool AdocaoConcluida { get; set; }

        [Display(Name = "Termo")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "Termo animal obrigatório")]
        [MaxLength(100)]
        public String Termo { get; set; }

        [Display(Name = "Motivo da Adoção")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "* Motivo da adoção obrigatório")]
        [MaxLength(4000)]
        [StringLength(4000)]
        public String MotivoAdocao { get; set; }

        [DataType(DataType.Text)]
        [MaxLength(255)]
        public String? Foto { get; set; }

        [Display(Name = "Divulgado no grupo dos apoiadores")]
        public bool DivulgadoGrupoApoiadores { get; set; }

        [DataType(DataType.Date)]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataCadastro { get; set; }

    }
}