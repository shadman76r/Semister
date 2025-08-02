namespace DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitDb : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Bookings",
                c => new
                    {
                        BookingId = c.Int(nullable: false, identity: true),
                        RoomId = c.Int(nullable: false),
                        GuestId = c.Int(nullable: false),
                        CheckInDate = c.DateTime(nullable: false),
                        CheckOutDate = c.DateTime(nullable: false),
                        TotalPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.BookingId)
                .ForeignKey("dbo.Guests", t => t.GuestId, cascadeDelete: true)
                .ForeignKey("dbo.Rooms", t => t.RoomId, cascadeDelete: true)
                .Index(t => t.RoomId)
                .Index(t => t.GuestId);
            
            CreateTable(
                "dbo.Guests",
                c => new
                    {
                        GuestId = c.Int(nullable: false, identity: true),
                        FullName = c.String(nullable: false, maxLength: 100),
                        Email = c.String(nullable: false, maxLength: 100),
                        PhoneNumber = c.String(nullable: false, maxLength: 15),
                    })
                .PrimaryKey(t => t.GuestId);
            
            CreateTable(
                "dbo.Rooms",
                c => new
                    {
                        RoomId = c.Int(nullable: false, identity: true),
                        RoomType = c.String(nullable: false),
                        IsAvailable = c.Boolean(nullable: false),
                        Price = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.RoomId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bookings", "RoomId", "dbo.Rooms");
            DropForeignKey("dbo.Bookings", "GuestId", "dbo.Guests");
            DropIndex("dbo.Bookings", new[] { "GuestId" });
            DropIndex("dbo.Bookings", new[] { "RoomId" });
            DropTable("dbo.Rooms");
            DropTable("dbo.Guests");
            DropTable("dbo.Bookings");
        }
    }
}
