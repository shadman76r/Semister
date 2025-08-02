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
    public class RoomRepo : IRepo<Room, int, bool>
    {
        private readonly HotelDbContext _context;

        public RoomRepo(HotelDbContext context)
        {
            _context = context;
        }

        public RoomRepo()
        {
        }

        // Create a new room
        public bool Create(Room room)
        {
            try
            {
                _context.Rooms.Add(room);
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Read all rooms
        public List<Room> Read()
        {
            return _context.Rooms.ToList();
        }

        // Read a room by its ID
        public Room Read(int id)
        {
            return _context.Rooms.FirstOrDefault(r => r.Id == id);
        }

        // Update an existing room
        public bool Update(Room room)
        {
            try
            {
                _context.Entry(room).State = System.Data.Entity.EntityState.Modified;
                _context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Delete a room by its ID
        public bool Delete(int id)
        {
            try
            {
                var room = Read(id);
                if (room != null)
                {
                    _context.Rooms.Remove(room);
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