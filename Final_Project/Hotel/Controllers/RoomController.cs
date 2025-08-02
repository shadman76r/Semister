using BLL.DTOs;
using BLL.Services;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API.Controllers
{
    public class RoomController : ApiController
    {
        
        [HttpGet]
        [Route("api/rooms/getAll")]
        public HttpResponseMessage GetRooms()
        {
            var rooms = RoomService.GetRooms();
            return Request.CreateResponse(HttpStatusCode.OK, rooms);
        }

        [HttpGet]
        [Route("api/rooms/get/{id}")]
        public HttpResponseMessage GetRoom(int id)
        {
            var room = RoomService.GetRoom(id);
            return room == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, room);
        }

        [HttpPost]
        [Route("api/rooms/add")]
        public HttpResponseMessage AddRoom(RoomDTO room)
        {
            var addedRoom = RoomService.AddRoom(room);
            return Request.CreateResponse(HttpStatusCode.OK, addedRoom);
        }

        [HttpPut]
        [Route("api/rooms/update/{id}")]
        public HttpResponseMessage UpdateRoom(int id, RoomDTO room)
        {
            if (id != room.RoomId)
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            var updatedRoom = RoomService.UpdateRoom(room);
            return updatedRoom == null ? Request.CreateResponse(HttpStatusCode.NotFound) : Request.CreateResponse(HttpStatusCode.OK, updatedRoom);
        }

        [HttpDelete]
        [Route("api/rooms/delete/{id}")]
        public HttpResponseMessage DeleteRoom(int id)
        {
            var success = RoomService.DeleteRoom(id);
            return success ? Request.CreateResponse(HttpStatusCode.OK) : Request.CreateResponse(HttpStatusCode.NotFound);
        }

        ///aditional feature
        /// Filtering available rooms based on room type, minimum price, and maximum price
        [HttpGet]
        [Route("api/rooms/available")]
        public HttpResponseMessage GetAvailableRooms([FromUri] string roomType = null, [FromUri] decimal? minPrice = null, [FromUri] decimal? maxPrice = null)
        {
            var rooms = RoomService.GetAvailableRooms(roomType, minPrice, maxPrice);  // Get filtered rooms from service
            return Request.CreateResponse(HttpStatusCode.OK, rooms);  // Return the filtered rooms
        }

    }
}
