using Microsoft.EntityFrameworkCore;
using PetFriends.Models;

namespace PetFriends.Data
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options):base(options)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseSerialColumns();
        }
        public DbSet<Animal> Animal { get; set; }

        public DbSet<Genero> Genero { get; set; }

        public DbSet<TipoAnimal> TipoAnimal { get; set; }

        public DbSet<Raca> Raca { get; set; }

        public DbSet<Porte> Porte { get; set; }

        public DbSet<CorPelo> CorPelo { get; set; }

        public DbSet<LarTemporario> LarTemporario { get; set; }

        public DbSet<CausaFalecimento> CausaFalecimento { get; set; }

        public DbSet<CustoPorResgate> CustoPorResgate { get; set; }
        
        public DbSet<DespesaFixa> DespesaFixa { get; set; }

        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<TipoUsuario> TipoUsuario { get; set; }

        //public DbSet<Adocao> Adocao { get; set; }
        //public DbSet<PadrinhoDoador> PadrinhoDoador { get; set; }
    }
}






