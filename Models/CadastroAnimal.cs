namespace PetFriends.Models
{
    public class CadastroAnimal
    {
        public int id { get; set; }
        public string? nome { get; set; }
        public string? nome_final { get; set; }
        public int? id_tipo_animal { get; set; }
        public string? genero { get; set; }
        public int? id_cor_pelo { get; set; }
        public DateOnly? data_resgate { get; set; }
        public int? idade_anos { get; set; }
        public int? idade_meses { get; set; }
        public double? peso { get; set; }
        public int? id_porte_animal { get; set; }
        public bool? adestravel { get; set; }
        public string? foto { get; set; }
        public string? historia { get; set; }
        public int? id_procedimento_padrao { get; set; }
        public DateOnly? data_cadastro { get; set; }
        public DateOnly? data_divulgacao { get; set; }
        public bool? lar_temporario { get; set; }
        public int? despesa_mensal { get; set; }
        public bool? falecido { get; set; }
        public DateOnly? data_falecimento { get; set; }
        public int? id_causa_falecimento { get; set; }
    }
}
