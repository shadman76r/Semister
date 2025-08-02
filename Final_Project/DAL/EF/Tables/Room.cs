using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.EF.Tables
{
    public class Room
    {
        [Key]
        public int RoomId { get; set; }

        [Required]
        public string RoomType { get; set; } //Single, Double, Suite

        [Required]
        public bool IsAvailable { get; set; } 

        [Required]
        public decimal Price { get; set; }

        // Optional navigation property
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
