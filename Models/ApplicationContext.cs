using Microsoft.EntityFrameworkCore;
using PetFriends.Models;

namespace PetFriends.Data
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options):
            base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseSerialColumns();
        }
        public DbSet<ConexaoTest> ConexaoTest { get; set; }

        public DbSet<CadastroAnimal> CadastroAnimal { get; set; }
    }
}
