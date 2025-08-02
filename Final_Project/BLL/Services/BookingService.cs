using AutoMapper;
using BLL.DTOs;
using DAL;
using DAL.EF.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class BookingService
    {
        public static Mapper GetMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Booking, BookingDTO>();
                cfg.CreateMap<BookingDTO, Booking>();
                cfg.CreateMap<Booking, BookingWithGuestDTO>();
            });
            return new Mapper(config);
        }

        public static BookingDTO AddBooking(BookingDTO booking)
        {
            var repo = DataAccessFactory.GetBookings();
            var data = GetMapper().Map<Booking>(booking);
            return GetMapper().Map<BookingDTO>(repo.Add(data));
        }

        public static List<BookingDTO> GetBookings()
        {
            var repo = DataAccessFactory.GetBookings();
            return GetMapper().Map<List<BookingDTO>>(repo.GetAll());
        }

        public static BookingDTO GetBooking(int id)
        {
            var repo = DataAccessFactory.GetBookings();
            return GetMapper().Map<BookingDTO>(repo.GetById(id));
        }

        public static BookingDTO UpdateBooking(BookingDTO booking)
        {
            var repo = DataAccessFactory.GetBookings();
            var data = GetMapper().Map<Booking>(booking);
            return GetMapper().Map<BookingDTO>(repo.Update(data));
        }

        public static bool DeleteBooking(int id)
        {
            var repo = DataAccessFactory.GetBookings();
            return repo.Delete(id);
        }

        public static string TrackBooking(int id)
        {
            var repo = DataAccessFactory.BookingFeatures();
            return repo.TrackBooking(id);
        }

        public static List<BookingDTO> GetBookingsByStatus(string status)
        {
            var repo = DataAccessFactory.BookingFeatures();
            return GetMapper().Map<List<BookingDTO>>(repo.GetBookingsByStatus(status));
        }
    }
}
