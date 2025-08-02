using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.DTOs
{
    public class RoomDTO
    {
        public int Id { get; set; }             // Unique identifier for each room
        public string RoomType { get; set; }    // Type of the room (e.g., "Single", "Double", "Suite")
        public int RoomNumber { get; set; }     // Room number (e.g., 101, 102, 103...)
        public bool IsAvailable { get; set; }   // Availability status of the room (true = available, false = booked)
        public decimal Price { get; set; }      // Price per night for the room
    }
}

