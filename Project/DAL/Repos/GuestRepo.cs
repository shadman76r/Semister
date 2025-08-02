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
    public class GuestRepo : IRepo<Guest, int, bool>
    {
        private readonly HotelDbContext _context;

        public GuestRepo(HotelDbContext context)
        {
            _context = context;
        }

        public GuestRepo()
        {
        }

        // Create a new guest
        public bool Create(Guest guest)
        {
            try
            {
                _context.Guests.Add(guest);
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Read all guests
        public List<Guest> Read()
        {
            return _context.Guests.ToList();
        }

        // Read a guest by their ID
        public Guest Read(int id)
        {
            return _context.Guests.FirstOrDefault(g => g.Id == id);
        }

        // Update an existing guest
        public bool Update(Guest guest)
        {
            try
            {
                _context.Entry(guest).State = System.Data.Entity.EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Delete a guest by their ID
        public bool Delete(int id)
        {
            try
            {
                var guest = Read(id);
                if (guest != null)
                {
                    _context.Guests.Remove(guest);
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