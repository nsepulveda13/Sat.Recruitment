using AutoMapper;
using Data.Access;
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
        private readonly IUserDataAccess _repository;

        public UserRequestHandler(IMapper mapper, IUserDataAccess repository)
        {
            _mapper = mapper;
            _repository = repository;

        }

        public async Task<UserResponse> Handle(UserRequest request, CancellationToken cancellationToken)
        {
            var user = _mapper.Map<User>(request);
            user.Email = StringValidator.NormalizeEmail(user.Email);
            var factory = new FactoryUser();
            user.Money = factory.GetMoneyCalculatedByUser(user);
            var users = await _repository.GetUsersAsync();
            if (users.Any(u => u.Email == user.Email && u.Name == u.Name))
            {
                return new UserResponse()
                {
                    IsSuccess = false,
                    ResultValue = string.Empty ,
                    Message = "User duplicate."
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
