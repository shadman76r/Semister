using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.EF.Tables
{
    public class Guest
    {
        [Key]
        public int GuestId { get; set; }

        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [Required]
        [StringLength(100)]
        public string Email { get; set; }

        [Required]
        [StringLength(15)]
        public string PhoneNumber { get; set; }

        // Optional navigation property
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
