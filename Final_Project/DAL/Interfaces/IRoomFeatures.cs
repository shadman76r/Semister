using DAL.EF.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Interfaces
{
    public interface IRoomFeatures
    {
        List<Room> GetAvailableRooms(); // Get all available rooms
        Room GetRoomById(int id); // Get room by its ID
        List<Room> GetRoomsByType(string roomType); // Get rooms by type (Single, Double, etc.)
    }
}