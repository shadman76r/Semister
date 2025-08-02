using BLL.DTOs;
using DAL.Interfaces;
using DAL.Interfaces;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class GuestService
    {
        private readonly IRepo<Guest, int, bool> _guestRepo;

        public GuestService(IRepo<Guest, int, bool> guestRepo)
        {
            _guestRepo = guestRepo;
        }

        // Create a new guest
        public bool CreateGuest(GuestDTO guestDTO)
        {
            var guest = new Guest
            {
                Name = guestDTO.Name,
                Email = guestDTO.Email,
                Phone = guestDTO.Phone
            };

            return _guestRepo.Create(guest);
        }

        // Get all guests
        public List<GuestDTO> GetAllGuests()
        {
            var guests = _guestRepo.Read();
            return guests.Select(g => new GuestDTO
            {
                Id = g.Id,
                Name = g.Name,
                Email = g.Email,
                Phone = g.Phone
            }).ToList();
        }

        // Get guest by ID
        public GuestDTO GetGuestById(int id)
        {
            var guest = _guestRepo.Read(id);
            if (guest == null) return null;

            return new GuestDTO
            {
                Id = guest.Id,
                Name = guest.Name,
                Email = guest.Email,
                Phone = guest.Phone
            };
        }

        // Delete a guest
        public bool DeleteGuest(int id)
        {
            return _guestRepo.Delete(id);
        }
    }
}
