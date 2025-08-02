using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models
{
    public class Room
    {
        public int Id { get; set; }
        public string RoomNumber { get; set; }
        public string Type { get; set; } // e.g. Single, Double, Suite
        public decimal Price { get; set; }
        public bool IsAvailable { get; set; } = true;
    }
}
