using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Models
{
    public class Booking
    {
        [Key]
        public int BookingId { get; set; }

        [ForeignKey("Room")]
        public int RoomId { get; set; }

        [ForeignKey("Guest")]
        public int GuestId { get; set; }

        [Required]
        public DateTime CheckInDate { get; set; }

        [Required]
        public DateTime CheckOutDate { get; set; }

        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalPrice { get; set; }

        // Navigation properties
        public virtual Room Room { get; set; }
        public virtual Guest Guest { get; set; }
    }
}

