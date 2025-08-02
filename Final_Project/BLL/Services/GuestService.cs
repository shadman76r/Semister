using AutoMapper;
using BLL.DTOs;
using DAL;
using DAL.EF.Tables;
using OxyPlot.Series;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class GuestService
    {
        public static Mapper GetMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Guest, GuestDTO>();
                cfg.CreateMap<GuestDTO, Guest>();
            });
            return new Mapper(config);
        }
        /// <summary>
        /// Adds a new guest to the system and sends a welcome email.
        /// </summary>
        /// <param name="guestDto"></param>
        /// <returns></returns>
        public static GuestDTO AddGuest(GuestDTO guestDto)
        {
            var repo = DataAccessFactory.GetGuests();
            var data = GetMapper().Map<Guest>(guestDto);
            var addedGuest = repo.Add(data);
            var subject = "Welcome to our hotel";
            var body = $"Dear {addedGuest.FullName},\n\nThank you for choosing our hotel. We look forward to serving you.\n\nBest regards,\nHotel Management";
            var emailService = new EmailService();
            emailService.SendEmail(addedGuest.Email, subject, body);
            return GetMapper().Map<GuestDTO>(addedGuest);
        }

        public static List<GuestDTO> GetGuests()
        {
            var repo = DataAccessFactory.GetGuests();
            return GetMapper().Map<List<GuestDTO>>(repo.GetAll());
        }

        public static GuestDTO GetGuest(int id)
        {
            var repo = DataAccessFactory.GetGuests();
            return GetMapper().Map<GuestDTO>(repo.GetById(id));
        }

        public static GuestDTO UpdateGuest(GuestDTO guest)
        {
            var repo = DataAccessFactory.GetGuests();
            var data = GetMapper().Map<Guest>(guest);
            return GetMapper().Map<GuestDTO>(repo.Update(data));
        }

        public static bool DeleteGuest(int id)
        {
            var repo = DataAccessFactory.GetGuests();
            return repo.Delete(id);
        }

        public static List<GuestDTO> GetGuestsByName(string name)
        {
            var repo = DataAccessFactory.GetGuests();
            // return all guests if name is null or empty
            if (string.IsNullOrEmpty(name))
            {
                return GetMapper().Map<List<GuestDTO>>(repo.GetAll());
            }

            var guests = repo.GetGuestsByName(name);
            return GetMapper().Map<List<GuestDTO>>(guests);
        }
    }
}
