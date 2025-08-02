using BLL.DTOs;
using DAL.Interfaces;
using DAL.Interfaces;
using DAL.Models;
using DAL.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Services
{
    public class RoomService
    {
        private readonly IRepo<Room, int, bool> _roomRepo;

        public RoomService(IRepo<Room, int, bool> roomRepo)
        {
            _roomRepo = roomRepo;
        }

        // Create a new room
        public bool CreateRoom(RoomDTO roomDTO)
        {
            var room = new Room
            {
                RoomType = roomDTO.RoomType,
                RoomNumber = roomDTO.RoomNumber,
                IsAvailable = roomDTO.IsAvailable,
                Price = roomDTO.Price
            };

            return _roomRepo.Create(room);
        }

        // Get all rooms
        public List<RoomDTO> GetAllRooms()
        {
            var rooms = _roomRepo.Read();

            return rooms.Select(r => new RoomDTO
            {
                Id = r.Id,
                RoomType = r.RoomType,
                RoomNumber = r.RoomNumber,
                IsAvailable = r.IsAvailable,
                Price = r.Price
            }).ToList();
        }

        // Get room by ID
        public RoomDTO GetRoomById(int id)
        {
            var room = _roomRepo.Read(id);
            if (room == null) return null;

            return new RoomDTO
            {
                Id = room.Id,
                RoomType = room.RoomType,
                RoomNumber = room.RoomNumber,
                IsAvailable = room.IsAvailable,
                Price = room.Price
            };
        }

        // Update a room
        public bool UpdateRoom(RoomDTO roomDTO)
        {
            var room = new Room
            {
                Id = roomDTO.Id,
                RoomType = roomDTO.RoomType,
                RoomNumber = roomDTO.RoomNumber,
                IsAvailable = roomDTO.IsAvailable,
                Price = roomDTO.Price
            };

            return _roomRepo.Update(room);
        }

        // Delete a room
        public bool DeleteRoom(int id)
        {
            return _roomRepo.Delete(id);
        }
    }
}