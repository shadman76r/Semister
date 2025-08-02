using DAL.Interfaces;
using DAL.Models;
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
        // Get the Room repository
        public static IRepo<Room, int, bool> GetRoomRepo()
        {
            return new RoomRepo();
        }

        // Get the Booking repository
        public static IRepo<Booking, int, bool> GetBookingRepo()
        {
            return new BookingRepo();
        }

        // Get the Guest repository
        public static IRepo<Guest, int, bool> GetGuestRepo()
        {
            return new GuestRepo();
        }
    }
}