namespace PetFriends.Models
{
    public class CadastroAnimal
    {
        public int id { get; set; }
        public string? nome { get; set; }
        public string? genero { get; set; }
        public int? idade_anos { get; set; }
        public int? idade_meses { get; set; }
        public string? foto { get; set; }
        public string? historia { get; set; }
    }
}
