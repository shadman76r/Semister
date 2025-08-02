using AutoMapper;
using BLL.DTOs;
using DAL;
using DAL.Interfaces;
using DAL.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Services
{
    public class HotelBookingService
    {
        private readonly IRepo<Room, int, bool> _roomRepo;
        private readonly IRepo<Booking, int, bool> _bookingRepo;
        private readonly IRepo<Guest, int, bool> _guestRepo;
        private readonly IMapper _mapper;

        public HotelBookingService()
        {
            // Initialize the repositories using DataAccessFactory
            _roomRepo = DataAccessFactory.GetRoomRepo();
            _bookingRepo = DataAccessFactory.GetBookingRepo();
            _guestRepo = DataAccessFactory.GetGuestRepo();

            // Initialize AutoMapper configuration
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Room, RoomDTO>();
                cfg.CreateMap<RoomDTO, Room>();

                cfg.CreateMap<Booking, BookingDTO>();
                cfg.CreateMap<BookingDTO, Booking>();

                cfg.CreateMap<Guest, GuestDTO>();
                cfg.CreateMap<GuestDTO, Guest>();
            });

            _mapper = new Mapper(config);
        }

        // Room CRUD Operations

        public bool AddRoom(RoomDTO roomDTO)
        {
            var room = _mapper.Map<Room>(roomDTO);
            return _roomRepo.Create(room);
        }

        public List<RoomDTO> GetAllRooms()
        {
            var rooms = _roomRepo.Read();
            return _mapper.Map<List<RoomDTO>>(rooms);
        }

        public RoomDTO GetRoomById(int id)
        {
            var room = _roomRepo.Read(id);
            return _mapper.Map<RoomDTO>(room);
        }

        public bool UpdateRoom(RoomDTO roomDTO)
        {
            var room = _mapper.Map<Room>(roomDTO);
            return _roomRepo.Update(room);
        }

        public bool DeleteRoom(int id)
        {
            return _roomRepo.Delete(id);
        }

        // Booking CRUD Operations

        public bool AddBooking(BookingDTO bookingDTO)
        {
            var room = _roomRepo.Read(bookingDTO.RoomId);
            var guest = _guestRepo.Read(bookingDTO.GuestId);

            if (room == null || guest == null) return false;

            var booking = new Booking
            {
                RoomId = bookingDTO.RoomId,
                GuestId = bookingDTO.GuestId,
                CheckInDate = bookingDTO.CheckInDate,
                CheckOutDate = bookingDTO.CheckOutDate,
                TotalAmount = room.Price * (bookingDTO.CheckOutDate - bookingDTO.CheckInDate).Days
            };

            return _bookingRepo.Create(booking);
        }

        public List<BookingDTO> GetAllBookings()
        {
            var bookings = _bookingRepo.Read();
            return _mapper.Map<List<BookingDTO>>(bookings);
        }

        public BookingDTO GetBookingById(int id)
        {
            var booking = _bookingRepo.Read(id);
            return _mapper.Map<BookingDTO>(booking);
        }

        public bool UpdateBooking(BookingDTO bookingDTO)
        {
            var booking = _mapper.Map<Booking>(bookingDTO);
            return _bookingRepo.Update(booking);
        }

        public bool DeleteBooking(int id)
        {
            return _bookingRepo.Delete(id);
        }

        // Guest CRUD Operations

        public bool AddGuest(GuestDTO guestDTO)
        {
            var guest = _mapper.Map<Guest>(guestDTO);
            return _guestRepo.Create(guest);
        }

        public List<GuestDTO> GetAllGuests()
        {
            var guests = _guestRepo.Read();
            return _mapper.Map<List<GuestDTO>>(guests);
        }

        public GuestDTO GetGuestById(int id)
        {
            var guest = _guestRepo.Read(id);
            return _mapper.Map<GuestDTO>(guest);
        }

        public bool UpdateGuest(GuestDTO guestDTO)
        {
            var guest = _mapper.Map<Guest>(guestDTO);
            return _guestRepo.Update(guest);
        }

        public bool DeleteGuest(int id)
        {
            return _guestRepo.Delete(id);
        }

        // Business Logic for Hotel Management

        public string ExportBookingsToCsv()
        {
            var bookings = _bookingRepo.Read();
            var csvBuilder = new StringBuilder();

            // Add CSV headers
            csvBuilder.AppendLine("Booking ID,Room Number,Guest Name,Check-In Date,Check-Out Date,Total Amount");

            // Add data rows
            foreach (var booking in bookings)
            {
                var room = _roomRepo.Read(booking.RoomId);
                var guest = _guestRepo.Read(booking.GuestId);
                csvBuilder.AppendLine($"{booking.Id},{room.RoomNumber},{guest.Name},{booking.CheckInDate:yyyy-MM-dd},{booking.CheckOutDate:yyyy-MM-dd},{booking.TotalAmount}");
            }

            return csvBuilder.ToString();
        }

        // Feature to get rooms by availability
        public List<RoomDTO> GetAvailableRooms()
        {
            var rooms = _roomRepo.Read().Where(r => r.IsAvailable).ToList();
            return _mapper.Map<List<RoomDTO>>(rooms);
        }

        // Feature to check the total number of bookings
        public int GetTotalBookings()
        {
            return _bookingRepo.Read().Count();
        }
    }
}
