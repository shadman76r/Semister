using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.DTOs
{
    public class GuestDTO
    {
        public int Id { get; set; }             // Unique identifier for each guest
        public string Name { get; set; }        // Name of the guest (first and last name)
        public string Email { get; set; }       // Email address of the guest
        public string Phone { get; set; }       // Phone number of the guest
    }
}

