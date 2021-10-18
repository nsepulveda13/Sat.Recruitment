using System;
using System.Dynamic;
using System.Net.Http;
using System.Text;
using System.Threading;
using AutoMapper;
using Bussines.Handlers;
using Bussines.Services;
using Data.Access;
using Domain;
using Domain.Models;
using Domain.Request;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using Newtonsoft.Json;
using Sat.Recruitment.Api;
using Sat.Recruitment.Api.Controllers;
using FluentValidation.TestHelper;

using Xunit;
using System.Net;

namespace Sat.Recruitment.Test
{



    public class UnitTest1 : IClassFixture<TestFixture<Startup>>
    {
        private readonly TestFixture<Startup> _fixture;
        public readonly IMapper _mapper;
        public readonly IUserService _userService;
        public readonly IQueryUser _queryUser;

        public UnitTest1(TestFixture<Startup> fixture)
        {
            _fixture = fixture;
            _mapper = (IMapper)_fixture.Server.Host.Services.GetService(typeof(IMapper));
            _userService = (IUserService)_fixture.Server.Host.Services.GetService(typeof(IUserService));
            _queryUser = (IQueryUser)_fixture.Server.Host.Services.GetService(typeof(IQueryUser));


        }

        public void Dispose()
        {
      

        }

        [Fact]

        public async void CreateUser()
        {
            UserRequestHandler handler = new UserRequestHandler(_mapper, _queryUser, _userService);
            UserRequest user = new UserRequest() { Name = "Nicolas", Email = "nicolas@gmail.com", Address = "av brown", Phone = "+549 1165213283", UserType = "Normal", Money = 124 };
            var result = await handler.Handle(user, default(CancellationToken));
            Assert.True(result.IsSuccess);
            Assert.Equal("User created.", result.Message);
        }


        [Fact]
        public async void CreateDuplicatedUserForMail()
        {

            UserRequestHandler handler = new UserRequestHandler(_mapper, _queryUser, _userService);
            UserRequest user = new UserRequest()
            {
                Name = "Justin",
                Email = "Agustina@gmail.com",
                Address = "Address a",
                Phone = "+507 22224888",
                UserType = "Normal",
                Money = 151
            };
            var result = await handler.Handle(user, default(CancellationToken));

            Assert.False(result.IsSuccess);
            Assert.Equal("The user is duplicated", result.Message);
        }
        [Fact]
        public async void CreateDuplicatedUserForPhone()
        {

            UserRequestHandler handler = new UserRequestHandler(_mapper, _queryUser, _userService);
            UserRequest user = new UserRequest()
            {
                Name = "Justin",
                Email = "Agustin2a@gmail.com",
                Address = "Address a",
                Phone = "+534645213542",
                UserType = "Normal",
                Money = 151
            };

            var result = await handler.Handle(user, default(CancellationToken));
            Assert.False(result.IsSuccess);
            Assert.Equal("The user is duplicated", result.Message);
        }



        [Fact]
        public void Errros_Validations()
        {
            var userValidator = new UserValidator();
            var user = new Domain.Models.User
            {
                Name = "",
                Email = "Agustin2a@gmail.com",
                Address = "Garay y Otra Calle",
                Phone = "+534645211542",
                UserType = "Normal",
                Money = 151
            };
            var result = userValidator.TestValidate(user);
            Assert.False(result.IsValid);
            Assert.Equal("The name is required", result.Errors[0].ErrorMessage.ToString());
            Assert.NotEqual("The email is required", result.ToString());
            Assert.NotEqual("The phone is required", result.ToString());
            Assert.NotEqual("The address is required", result.ToString());
            Assert.NotEqual("The usertype is required", result.ToString());
            Assert.NotEqual("The money is required", result.ToString());
        }



        [Fact]
        public void UserController()
        {
            var client = _fixture.Server.CreateClient();
            var myContent = JsonConvert.SerializeObject(new
            {
                Name = "nicolas",
                Email = "Agustin2a@gmail.com",
                Address = "Garay y Otra Calle",
                Phone = "+534645211542",
                UserType = "Normal",
                Money = 151
            });
            HttpContent body = new StringContent(myContent, Encoding.UTF8, "application/json");
            var response = client.PostAsync("/create-user", body).Result;
            Assert.True(HttpStatusCode.OK.Equals(response.StatusCode));
        }


        [Fact]
        public void CheckStrategy()
        {
            UserDTO user = new UserDTO()
            {
                Name = "Justin",
                Email = "Agustin2a@gmail.com",
                Address = "Address a",
                Phone = "+534645213542",
                UserType = "Premium",
                Money = 1000
            };
            var userResult = _userService.MapDto(user);         
            Assert.Equal(3000, userResult.Money);

        }

    }
}
