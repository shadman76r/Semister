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
    public class RoomService
    {
        public static Mapper GetMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Room, RoomDTO>();
                cfg.CreateMap<RoomDTO, Room>();
            });
            return new Mapper(config);
        }

        public static RoomDTO AddRoom(RoomDTO room)
        {
            var repo = DataAccessFactory.GetRooms();
            var data = GetMapper().Map<Room>(room);
            return GetMapper().Map<RoomDTO>(repo.Add(data));
        }

        public static List<RoomDTO> GetRooms()
        {
            var repo = DataAccessFactory.GetRooms();
            return GetMapper().Map<List<RoomDTO>>(repo.GetAll());
        }

        public static RoomDTO GetRoom(int id)
        {
            var repo = DataAccessFactory.GetRooms();
            return GetMapper().Map<RoomDTO>(repo.GetById(id));
        }

        public static RoomDTO UpdateRoom(RoomDTO room)
        {
            var repo = DataAccessFactory.GetRooms();
            var data = GetMapper().Map<Room>(room);
            return GetMapper().Map<RoomDTO>(repo.Update(data));
        }

        public static bool DeleteRoom(int id)
        {
            var repo = DataAccessFactory.GetRooms();
            return repo.Delete(id);
        }

        public static List<RoomDTO> GetAvailableRooms(string roomType = null, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var repo = DataAccessFactory.GetRooms();  // Get the room repository
            var rooms = repo.GetAvailableRooms(roomType, minPrice, maxPrice);  // Call the filtering method

            return GetMapper().Map<List<RoomDTO>>(rooms);  // Map to RoomDTO and return
        }
    }
}
