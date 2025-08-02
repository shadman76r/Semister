using DAL.EF.Tables;
using DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repos
{
    internal class BookingRepo : RepoDB, IRepo<Booking, int, Booking>, IBookingFeatures
    {
        public Booking Add(Booking obj)
        {
            db.Bookings.Add(obj);
            db.SaveChanges();
            return obj;
        }

        public bool Delete(int id)
        {
            var obj = db.Bookings.Find(id);
            if (obj == null) return false;
            db.Bookings.Remove(obj);
            return db.SaveChanges() > 0;
        }

        public List<Booking> GetAll()
        {
            return db.Bookings.ToList();
        }

        public Booking GetById(int id)
        {
            return db.Bookings.Find(id);
        }

        public Booking Update(Booking obj)
        {
            var exobj = db.Bookings.Find(obj.BookingId);
            if (exobj == null) return null;
            db.Entry(exobj).CurrentValues.SetValues(obj);
            db.SaveChanges();
            return obj;
        }

        public List<Booking> GetBookingsByGuest(int guestId)
        {
            return db.Bookings.Where(b => b.GuestId == guestId).ToList();
        }

        public List<Booking> GetBookingsByStatus(string status)
        {
            return db.Bookings.Where(b => b.Status == status).ToList();
        }

        public string TrackBooking(int bookingId)
        {
            var booking = db.Bookings.FirstOrDefault(b => b.BookingId == bookingId);
            return booking != null ? booking.Status : "Booking not found";
        }

        public object GetGuestsByName(string name)
        {
            throw new NotImplementedException();
        }

        public object GetAvailableRooms(string roomType, decimal? minPrice, decimal? maxPrice)
        {
            throw new NotImplementedException();
        }

        public object Add(object guest)
        {
            throw new NotImplementedException();
        }
    }
}
