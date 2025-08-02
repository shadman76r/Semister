using DAL.EF.Tables;
using DAL.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repos
{
    internal class GuestRepo : RepoDB, IRepo<Guest, int, Guest>, IGuestFeatures
    {
        public Guest Add(Guest obj)
        {
            db.Guests.Add(obj);
            db.SaveChanges();
            return obj;
        }

        public bool Delete(int id)
        {
            var obj = db.Guests.Find(id);
            if (obj == null) return false;
            db.Guests.Remove(obj);
            return db.SaveChanges() > 0;
        }

        public List<Guest> GetAll()
        {
            return db.Guests.ToList();
        }

        public Guest GetById(int id)
        {
            return db.Guests.Find(id);
        }

        public Guest Update(Guest obj)
        {
            var exobj = db.Guests.Find(obj.GuestId);
            if (exobj == null) return null;
            db.Entry(exobj).CurrentValues.SetValues(obj);
            db.SaveChanges();
            return obj;
        }

       // Additional feature: Get guests by name
        public List<Guest> GetGuestsByName(string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                return new List<Guest>();  // Return an empty list if name is null or empty
            }

            return db.Guests.Where(g => g.FullName.ToLower().Contains(name.ToLower()) ||
                    g.Email.ToLower().Contains(name.ToLower()) ||
                    g.PhoneNumber.Contains(name)).ToList();
        }

        public List<Guest> GetAllGuests()
        {
            throw new NotImplementedException();
        }

        public Guest GetGuestById(int id)
        {
            throw new NotImplementedException();
        }

        object IRepo<Guest, int, Guest>.GetGuestsByName(string name)
        {
            return GetGuestsByName(name);
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
