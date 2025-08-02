using DAL.EF.Tables;
using DAL.Interfaces;
using DAL.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DataAccessFactory
    {
        // Returns the RoomRepo (for CRUD operations on rooms)
        public static IRepo<Room, int, Room> GetRooms()
        {
            return new RoomRepo();
        }

        // Returns the Room-specific features (like filtering available rooms and room types)
        public static IRoomFeatures RoomFeatures()
        {
            return new RoomRepo();
        }

        // Returns the BookingRepo (for CRUD operations on bookings)
        public static IRepo<Booking, int, Booking> GetBookings()
        {
            return new BookingRepo();
        }

        // Returns the Booking-specific features (like tracking bookings and status filtering)
        public static IBookingFeatures BookingFeatures()
        {
            return new BookingRepo();
        }

        // Returns the GuestRepo (for CRUD operations on guests)
        public static IRepo<Guest, int, Guest> GetGuests()
        {
            return new GuestRepo();
        }

        // Returns the Guest-specific features (like filtering guests by name)
        public static IGuestFeatures GuestFeatures()
        {
            return new GuestRepo();
        }
    }
}