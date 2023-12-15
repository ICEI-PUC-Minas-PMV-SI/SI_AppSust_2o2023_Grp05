using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{

    public class Doacao
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Padrinho/Doador")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        [ForeignKey("Usuario")]
        public int IdPadrinhoDoador { get; set; }
        public virtual Usuario Usuario { get; set; }

        [Display(Name = "Data da Entrada")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Resgate do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String DataEntrada { get; set; }

        [Display(Name = "Valor Real da Entrada")]
        [Required(ErrorMessage = "* Valor da entrada é obrigatório")]
        [Range(0, int.MaxValue, ErrorMessage = "Valor entrada somente acima de 0.")]
        public double ValorRealEntrada { get; set; }

        [Display(Name = "Recebido?")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        public bool Recebido { get; set; }

        [Display(Name = "Cobrança")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        [MaxLength(100)]
        [StringLength(100)]
        public string Cobranca { get; set; }

        [Display(Name = "Categoria")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        [ForeignKey("Categoria")]
        public int IdCategoria { get; set; }

        [Display(Name = "Banco")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        [ForeignKey("ListaBanco")]
        public int IdListaBanco { get; set; }

        [Display(Name = "Status Doacao")]
        [Required(ErrorMessage = "* Campo é obrigatório")]
        [ForeignKey("ListaStatusDoacao")]
        public int IdListaStatusDoacao { get; set; }

        [Display(Name = "Observação")]
        [DataType(DataType.MultilineText)]
        [MaxLength(4000)]
        [StringLength(4000)]
        public String Observacao { get; set; }        
    }
}