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
        public DbSet<ConexaoTest> ConexaoTest { get; set; }

        public DbSet<Animal> Animal { get; set; }

        public DbSet<Genero> Genero { get; set; }

        public DbSet<TipoAnimal> TipoAnimal { get; set; }

        public DbSet<Raca> Raca { get; set; }

        public DbSet<CorPelo> CorPelo { get; set; }
    }
}
