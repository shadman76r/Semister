using BLL.DTOs;
using BLL.Services;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API.Controllers
{
    public class BookingController : ApiController
    {
        [HttpGet]
        [Route("api/bookings/getAll")]
        public HttpResponseMessage GetBookings()
        {
            var bookings = BookingService.GetBookings();
            return Request.CreateResponse(HttpStatusCode.OK, bookings);
        }

        [HttpGet]
        [Route("api/bookings/get/{id}")]
        public HttpResponseMessage GetBooking(int id)
        {
            var booking = BookingService.GetBooking(id);
            return booking == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, booking);
        }

        [HttpPost]
        [Route("api/bookings/add")]
        public HttpResponseMessage AddBooking(BookingDTO booking)
        {
            var addedBooking = BookingService.AddBooking(booking);
            return Request.CreateResponse(HttpStatusCode.OK, addedBooking);
        }

        [HttpPut]
        [Route("api/bookings/update/{id}")]
        public HttpResponseMessage UpdateBooking(int id, BookingDTO booking)
        {
            if (id != booking.BookingId)
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            var updatedBooking = BookingService.UpdateBooking(booking);
            return updatedBooking == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, updatedBooking);
        }

        [HttpDelete]
        [Route("api/bookings/delete/{id}")]
        public HttpResponseMessage DeleteBooking(int id)
        {
            var success = BookingService.DeleteBooking(id);
            return success ? Request.CreateResponse(HttpStatusCode.OK) : Request.CreateResponse(HttpStatusCode.NotFound);
        }

        [HttpGet]
        [Route("api/bookings/track/{id}")]
        public HttpResponseMessage TrackBooking(int id)
        {
            var status = BookingService.TrackBooking(id);
            return Request.CreateResponse(HttpStatusCode.OK, status);
        }

        [HttpGet]
        [Route("api/bookings/status/{status}")]
        public HttpResponseMessage GetBookingsByStatus(string status)
        {
            var bookings = BookingService.GetBookingsByStatus(status);
            return Request.CreateResponse(HttpStatusCode.OK, bookings);
        }
    }
}
