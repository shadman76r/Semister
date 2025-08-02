using BLL.DTOs;
using BLL.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace YourProject.Controllers
{
    public class HotelBookingController : ApiController
    {
        private readonly HotelBookingService _hotelBookingService;

        public HotelBookingController(HotelBookingService hotelBookingService)
        {
            _hotelBookingService = hotelBookingService;
        }

        // Room CRUD Operations

        [HttpPost]
        [Route("api/rooms/add")]
        public HttpResponseMessage AddRoom([FromBody] RoomDTO roomDTO)
        {
            var result = _hotelBookingService.AddRoom(roomDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Room created successfully." : "Failed to create room.");
        }

        [HttpGet]
        [Route("api/rooms/getAll")]
        public HttpResponseMessage GetRooms()
        {
            var data = _hotelBookingService.GetAllRooms();
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpGet]
        [Route("api/rooms/get/{id}")]
        public HttpResponseMessage GetRoomById(int id)
        {
            var data = _hotelBookingService.GetRoomById(id);
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpPost]
        [Route("api/rooms/update")]
        public HttpResponseMessage UpdateRoom([FromBody] RoomDTO roomDTO)
        {
            var result = _hotelBookingService.UpdateRoom(roomDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Room updated successfully." : "Failed to update room.");
        }

        [HttpPost]
        [Route("api/rooms/delete/{id}")]
        public HttpResponseMessage DeleteRoom(int id)
        {
            var result = _hotelBookingService.DeleteRoom(id);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Room deleted successfully." : "Failed to delete room.");
        }

        // Booking CRUD Operations

        [HttpPost]
        [Route("api/bookings/add")]
        public HttpResponseMessage AddBooking([FromBody] BookingDTO bookingDTO)
        {
            var result = _hotelBookingService.AddBooking(bookingDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Booking created successfully." : "Failed to create booking.");
        }

        [HttpGet]
        [Route("api/bookings/getAll")]
        public HttpResponseMessage GetBookings()
        {
            var data = _hotelBookingService.GetAllBookings();
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpGet]
        [Route("api/bookings/get/{id}")]
        public HttpResponseMessage GetBookingById(int id)
        {
            var data = _hotelBookingService.GetBookingById(id);
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpPost]
        [Route("api/bookings/update")]
        public HttpResponseMessage UpdateBooking([FromBody] BookingDTO bookingDTO)
        {
            var result = _hotelBookingService.UpdateBooking(bookingDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Booking updated successfully." : "Failed to update booking.");
        }

        [HttpPost]
        [Route("api/bookings/delete/{id}")]
        public HttpResponseMessage DeleteBooking(int id)
        {
            var result = _hotelBookingService.DeleteBooking(id);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Booking deleted successfully." : "Failed to delete booking.");
        }

        // Guest CRUD Operations

        [HttpPost]
        [Route("api/guests/add")]
        public HttpResponseMessage AddGuest([FromBody] GuestDTO guestDTO)
        {
            var result = _hotelBookingService.AddGuest(guestDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Guest created successfully." : "Failed to create guest.");
        }

        [HttpGet]
        [Route("api/guests/getAll")]
        public HttpResponseMessage GetGuests()
        {
            var data = _hotelBookingService.GetAllGuests();
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpGet]
        [Route("api/guests/get/{id}")]
        public HttpResponseMessage GetGuestById(int id)
        {
            var data = _hotelBookingService.GetGuestById(id);
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpPost]
        [Route("api/guests/update")]
        public HttpResponseMessage UpdateGuest([FromBody] GuestDTO guestDTO)
        {
            var result = _hotelBookingService.UpdateGuest(guestDTO);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Guest updated successfully." : "Failed to update guest.");
        }

        [HttpPost]
        [Route("api/guests/delete/{id}")]
        public HttpResponseMessage DeleteGuest(int id)
        {
            var result = _hotelBookingService.DeleteGuest(id);
            return Request.CreateResponse(HttpStatusCode.OK, result ? "Guest deleted successfully." : "Failed to delete guest.");
        }

        // Export Bookings to CSV
        [HttpGet]
        [Route("api/bookings/export")]
        public HttpResponseMessage ExportBookingsToCsv()
        {
            var csvContent = _hotelBookingService.ExportBookingsToCsv();

            var result = new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new StringContent(csvContent, Encoding.UTF8, "text/csv")
            };
            result.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment")
            {
                FileName = "Bookings.csv"
            };

            return result;
        }

        // Get Available Rooms
        [HttpGet]
        [Route("api/rooms/available")]
        public HttpResponseMessage GetAvailableRooms()
        {
            var data = _hotelBookingService.GetAvailableRooms();
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        // Get Total Bookings
        [HttpGet]
        [Route("api/bookings/total")]
        public HttpResponseMessage GetTotalBookings()
        {
            var totalBookings = _hotelBookingService.GetTotalBookings();
            return Request.CreateResponse(HttpStatusCode.OK, totalBookings);
        }
    }
}
