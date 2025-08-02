using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IRepo<CLASS, ID, RETURN>
    {
        List<CLASS> GetAll(); //This is dor read
        RETURN GetById(ID id); // Get a record by its ID
        RETURN Add(CLASS obj); // Add a new record
        RETURN Update(CLASS obj); // Update an existing record
        bool Delete(ID id); // Delete a record by its ID
        object GetGuestsByName(string name);
        object GetAvailableRooms(string roomType, decimal? minPrice, decimal? maxPrice);
        object Add(object guest);
    }
}