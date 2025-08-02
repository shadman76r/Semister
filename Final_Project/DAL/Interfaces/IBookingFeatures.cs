using DAL.EF.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IBookingFeatures
    {
        List<Booking> GetBookingsByGuest(int guestId); // Get all bookings made by a guest
        List<Booking> GetBookingsByStatus(string status); // Get bookings by their status (Confirmed, Cancelled, etc.)
        string TrackBooking(int bookingId); // Track the status of a booking
    }
}