﻿using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PetFriends.Models
{

    public class Animal
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Meu Nome")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "* Nome do pet é obrigatório")]
        [MaxLength(100)]
        [StringLength(100)]
        public string Nome { get; set; }

        [Display(Name = "Nome Final")]
        [DataType(DataType.Text)]
        [MaxLength(100)]
        [StringLength(100)]
        public String? NomeFinal { get; set; }

        [Display(Name = "Tipo")]
        [Required(ErrorMessage = "* Tipo do pet é obrigatório")]
        [ForeignKey("TipoAnimal")]
        public int IdTipoAnimal { get; set; }
        public virtual TipoAnimal TipoAnimal { get; set; }
        //public virtual Raca Raca { get; set; }

        [Display(Name = "Gênero")]
        [Required(ErrorMessage = "* Gênero do pet é obrigatório")]
        [ForeignKey("Genero")]
        public int IdGenero { get; set; }
        public virtual Genero Genero { get; set; }

        [Display(Name = "Cor do pelo")]
        [Required(ErrorMessage = "* Cor do pelo do pet é obrigatório")]
        [ForeignKey("CorPelo")]
        public int IdCorPelo { get; set; }
        public virtual CorPelo CorPelo { get; set; }

        [Display(Name = "Data do Resgate")]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Data do Resgate do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataResgate { get; set; }

        [Display(Name = "Idade Anos")]
        [Range(0, int.MaxValue, ErrorMessage = "Anos somente acima de 0.")]
        public int? IdadeAnos { get; set; }

        [Display(Name = "Idade Meses")]
        [Range(0, int.MaxValue, ErrorMessage = "Meses somente acima de 0.")]
        public int? IdadeMeses { get; set; }

        [Display(Name = "Peso (kg)")]
        [Required(ErrorMessage = "Peso do pet é obrigatório")]
        [Range(0, int.MaxValue, ErrorMessage = "Peso somente acima de 0.")]
        public double Peso { get; set; }

        [Display(Name = "Porte")]
        [Required(ErrorMessage = "* Porte do pet é obrigatório")]
        [ForeignKey("Porte")]
        public int IdPorte { get; set; }
        public virtual Porte Porte { get; set; }

        [Display(Name = "Adestrar?")]
        public bool Adestravel { get; set; }

        [Display(Name = "Foto")]
        [DataType(DataType.Text)]
        [MaxLength(255)]
        public String? Foto { get; set; }

        [Display(Name = "História")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "* História do animal obrigatório")]
        [MaxLength(4000)]
        [StringLength(4000)]
        public String Historia { get; set; }
        public int IdProcedimentoPadrao { get; set; }

        [Display(Name = "Data do Cadastro")]
        [DataType(DataType.Date)]
        //[Required(ErrorMessage = "Data do Cadastro do pet é obrigatório")]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true,DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataCadastro { get; set; }

        [Display(Name = "Data da Divulgacao")]
        [DataType(DataType.Date)]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataDivulgacao { get; set; }

        [Display(Name = "Lar Temporário")]
        [Required(ErrorMessage = "* Lar temporário do pet é obrigatório")]
        [ForeignKey("LarTemporario")]
        public int IdLarTemporario { get; set; }
        public virtual LarTemporario LarTemporario { get; set; }
        public double? DespesaMensal { get; set; }
        public bool Falecido { get; set; }

        [Display(Name = "Data do Falecimento")]
        [DataType(DataType.Date)]
        [MaxLength(10)]
        [StringLength(10)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public String? DataFalecimento { get; set; }

        [Display(Name = "Causa Falecimento")]
        [DataType(DataType.Text)]
        [ForeignKey("CausaFalecimento")]
        public int? IdCausaFalecimento { get; set; }
        public virtual CausaFalecimento CausaFalecimento { get; set; }
    }
}