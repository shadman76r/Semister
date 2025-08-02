using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.DTOs
{
    public class RoomDTO
    {
        public int RoomId { get; set; }
        public string RoomType { get; set; } // e.g., Single, Double, Suite
        public bool IsAvailable { get; set; }
        public decimal Price { get; set; } // Price per night
    }
}