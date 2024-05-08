﻿

namespace MNODotNetCore.RestApiWithNLayer.Databases
{
    internal class AppDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //if you use MySQL or Oracle or other change name behind Use.
            optionsBuilder.UseSqlServer(ConnectionString.sqlConnectionStringBuilder.ConnectionString);
        }
        public DbSet<BlogModel> Blog { get; set; }
    }
}
