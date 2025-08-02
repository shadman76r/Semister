using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.DTOs
{
    public class BookingDTO
    {
        public int Id { get; set; }             // Unique identifier for each booking
        public int RoomId { get; set; }         // Room ID (Foreign key to the Room table)
        public int GuestId { get; set; }        // Guest ID (Foreign key to the Guest table)
        public DateTime CheckInDate { get; set; }// Check-in date for the booking
        public DateTime CheckOutDate { get; set; }// Check-out date for the booking
        public decimal TotalAmount { get; set; }// Total amount for the booking
        public string RoomType { get; set; }    // Room Type for the booking
        public string GuestName { get; set; }   // Guest Name for the booking
    }
}
