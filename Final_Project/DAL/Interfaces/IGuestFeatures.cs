using DAL.EF.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IGuestFeatures
    {
        List<Guest> GetAllGuests(); // Get all guests
        Guest GetGuestById(int id); // Get guest by ID
        List<Guest> GetGuestsByName(string name); // Get guests by their name
    }
}
