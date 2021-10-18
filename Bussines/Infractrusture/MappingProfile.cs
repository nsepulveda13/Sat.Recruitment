using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;
using Domain;
using Domain.Models;
using Domain.Request;

namespace Bussines.Infractrusture
{
    class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<UserRequest, UserDto>();
            CreateMap<UserDto, UserResponse>();
        }
    }
}
