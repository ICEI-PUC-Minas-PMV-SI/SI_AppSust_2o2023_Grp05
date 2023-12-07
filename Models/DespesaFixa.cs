using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{
    public class DespesaFixa
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Porte")]
        [Required(ErrorMessage = "* Porte do pet é obrigatório")]
        [ForeignKey("Porte")]
        public int IdPorte { get; set; }
        public virtual Porte Porte { get; set; }

        [Display(Name = "Tipo da Despesa")]
        [Required(ErrorMessage = "* Tipo da despesa é obrigatório")]
        public string TipoDespesa { get; set; }

        [Display(Name = "Local da Despesa")]
        public string? Onde { get; set; }

        [Display(Name = "Valor da Despesa")]
        [Required(ErrorMessage = "* Valor da despesa é obrigatório")]
        [Range(0, int.MaxValue, ErrorMessage = "Valor Despesa somente acima de 0.")]
        public double ValorDespesa { get; set; }
    }
}
