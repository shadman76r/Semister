using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class EmpContext : DbContext
    {
        public EmpContext() : base("name=EmpContext")
        {
        }
        public DbSet<Models.Employee> Employees { get; set; } ///migration: add Employees table
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Configure the Employee entity here if needed
            modelBuilder.Entity<Models.Employee>().ToTable("Employees");
            base.OnModelCreating(modelBuilder);
        }

    }
}
