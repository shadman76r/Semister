using BLL.DTOs;
using BLL.Services;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API.Controllers
{
    public class GuestController : ApiController
    {
        [HttpGet]
        [Route("api/guests/getAll")]
        public HttpResponseMessage GetGuests()
        {
            var guests = GuestService.GetGuests();
            return Request.CreateResponse(HttpStatusCode.OK, guests);
        }

        [HttpGet]
        [Route("api/guests/get/{id}")]
        public HttpResponseMessage GetGuest(int id)
        {
            var guest = GuestService.GetGuest(id);
            return guest == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, guest);
        }

        [HttpPost]
        [Route("api/guests/add")]
        public HttpResponseMessage AddGuest(GuestDTO guest)
        {
            var addedGuest = GuestService.AddGuest(guest);
            return Request.CreateResponse(HttpStatusCode.OK, addedGuest);
        }

        [HttpPut]
        [Route("api/guests/update/{id}")]
        public HttpResponseMessage UpdateGuest(int id, GuestDTO guest)
        {
            if (id != guest.GuestId)
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            var updatedGuest = GuestService.UpdateGuest(guest);
            return updatedGuest == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, updatedGuest);
        }

        [HttpDelete]
        [Route("api/guests/delete/{id}")]
        public HttpResponseMessage DeleteGuest(int id)
        {
            var success = GuestService.DeleteGuest(id);
            return success ? Request.CreateResponse(HttpStatusCode.OK) : Request.CreateResponse(HttpStatusCode.NotFound);
        }

        [HttpGet]
        [Route("api/guests/search/{name}")]
        public HttpResponseMessage GetGuestsByName(string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Search term is needed");
            }
            var guests = GuestService.GetGuestsByName(name);
            return Request.CreateResponse(HttpStatusCode.OK, guests);
        }
    }
}
