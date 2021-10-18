using AutoMapper;
using Bussines.Services;
using Data.Access;
using Domain;
using Domain.Models;
using Domain.Request;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Bussines.Handlers
{
    public class UserRequestHandler : IRequestHandler<UserRequest, UserResponse>
    {
        private readonly IMapper _mapper;
        private readonly IQueryUser _repository;
        private readonly IUserService _userService;


        public UserRequestHandler(IMapper mapper, IQueryUser repository , IUserService userService )
        {
            _mapper = mapper;
            _repository = repository;
            _userService = userService;
        }

        public async Task<UserResponse> Handle(UserRequest request, CancellationToken cancellationToken)
        {
            var userDTO = _mapper.Map<UserDTO>(request);
            var user = _userService.MapDto(userDTO); 
            var listUsers = await _repository.GetUsersAsync();
            if (listUsers.Any(u => u.Email == user.Email || u.Name ==user.Name || u.Phone == user.Phone))
            {
                return new UserResponse()
                {
                    IsSuccess = false,
                    ResultValue = string.Empty ,
                    Message = "The user is duplicated"
                };
            }
            return new UserResponse()
            {
                IsSuccess = true,
                ResultValue = user,
                Message = "User created."
            };

        }


    }
}
