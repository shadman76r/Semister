using DAL.Interfaces;
using DAL.Interfaces;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repos
{
    public class BookingRepo : IRepo<Booking, int, bool>
    {
        private readonly HotelDbContext _context;

        public BookingRepo(HotelDbContext context)
        {
            _context = context;
        }

        public BookingRepo()
        {
        }

        // Create a new booking
        public bool Create(Booking booking)
        {
            try
            {
                _context.Bookings.Add(booking);
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Read all bookings
        public List<Booking> Read()
        {
            return _context.Bookings.ToList();
        }

        // Read a booking by its ID
        public Booking Read(int id)
        {
            return _context.Bookings.FirstOrDefault(b => b.Id == id);
        }

        // Update an existing booking
        public bool Update(Booking booking)
        {
            try
            {
                _context.Entry(booking).State = System.Data.Entity.EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Delete a booking by its ID
        public bool Delete(int id)
        {
            try
            {
                var booking = Read(id);
                if (booking != null)
                {
                    _context.Bookings.Remove(booking);
                    _context.SaveChanges();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
            }
        }
    }
}