namespace PetFriends.Models
{
    public class CustoPorResgate
    {
        public int Id { get; set; }
        public string? Acao { get; set; }
        public double? CustoMacho { get; set; }
        public double? CustoFemea{ get; set; }
        public bool Ativo { get; set; }
        public DateTime DataCadastro { get; set; }
    }
}
