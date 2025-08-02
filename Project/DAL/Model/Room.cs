using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models
{
    public class Room
    {
        [Key]
        public int RoomId { get; set; }

        [Required]
        [StringLength(100)]
        public string RoomType { get; set; } // e.g., Single, Double, Suite

        [Required]
        public bool IsAvailable { get; set; } // Availability status

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; } // Room price per night

        // Navigation property
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}

