using DAL.EF.Tables;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DAL.EF
{
    public class JATContext: DbContext
    {
        public DbSet<Room> Rooms{ get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<Guest> Guests { get; set; }

        public JATContext() : base("name=JATContext")
        {
            // Database.SetInitializer(new DropCreateDatabaseIfModelChanges<JATContext>());
            // Database.SetInitializer(new CreateDatabaseIfNotExists<JATContext>());
            // Database.SetInitializer(new MigrateDatabaseToLatestVersion<JATContext, Configuration>());
        }
    }
}
