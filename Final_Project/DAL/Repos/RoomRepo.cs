using DAL.EF.Tables;
using DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repos
{
    internal class RoomRepo : RepoDB, IRepo<Room, int, Room>, IRoomFeatures
    {
        public Room Add(Room obj)
        {
            db.Rooms.Add(obj);
            db.SaveChanges();
            return obj;
        }

        public bool Delete(int id)
        {
            var obj = db.Rooms.Find(id);
            if (obj == null) return false;
            db.Rooms.Remove(obj);
            return db.SaveChanges() > 0;
        }

        public List<Room> GetAll()
        {
            return db.Rooms.ToList();
        }

        public Room GetById(int id)
        {
            return db.Rooms.Find(id);
        }

        public Room Update(Room obj)
        {
            var exobj = db.Rooms.Find(obj.RoomId);
            if (exobj == null) return null;
            db.Entry(exobj).CurrentValues.SetValues(obj);
            db.SaveChanges();
            return obj;
        }

        public List<Room> GetAvailableRooms(string roomType = null, decimal ? minPrice = null, decimal? maxPrice= null)
        {
            var roomsQuery = db.Rooms.Where(r => r.IsAvailable);
            if (!string.IsNullOrEmpty(roomType))
            {
                roomsQuery = roomsQuery.Where(r => r.RoomType.Equals(roomType, StringComparison.OrdinalIgnoreCase));
            }
            if (minPrice.HasValue)
            {
                roomsQuery = roomsQuery.Where(r => r.Price >= minPrice.Value);
            }
            if (maxPrice.HasValue)
            {
                roomsQuery = roomsQuery.Where(r => r.Price <= maxPrice.Value);
            }
            return roomsQuery.ToList();
        }

        public List<Room> GetRoomsByType(string roomType)
        {
            return db.Rooms.Where(r => r.RoomType == roomType).ToList();
        }

        public Room GetRoomById(int id)
        {
            throw new NotImplementedException();
        }

        public object GetGuestsByName(string name)
        {
            throw new NotImplementedException();
        }

        public List<Room> GetAvailableRooms()
        {
            throw new NotImplementedException();
        }

        object IRepo<Room, int, Room>.GetAvailableRooms(string roomType, decimal? minPrice, decimal? maxPrice)
        {
            return GetAvailableRooms(roomType, minPrice, maxPrice);
        }

        public object Add(object guest)
        {
            throw new NotImplementedException();
        }
    }
}