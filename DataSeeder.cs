/*using PetFriends.Data;

namespace PetFriends
{
    public static class DataSeeder
    {
        public static void Seed(this IHost host)
        {
            using var scope = host.Services.CreateScope();
            using var context = scope.ServiceProvider.GetRequiredService<ApplicationContext>();
            context.Database.EnsureCreated();
            AddFuncionarioOng(context);
        }

        private static void AddFuncionarioOng(ApplicationContext context)
        {
            var funcionario = context.funcionariosOng.FirstOrDefault();
            if (funcionario == null) return;

            context.funcionariosOng.Add(new FuncionarioOng
            {
                
                login = "Test - data injection from code into database",
                email = "test@test.com.br",
                senha = "123aaaTest",
                id_usuario = 2
            });

            context.SaveChanges();
        }
    }
}
*/