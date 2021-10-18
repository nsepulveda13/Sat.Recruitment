using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Domain.Models;
using Domain.Request;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using MediatR;
using Domain;

namespace Sat.Recruitment.Api.Controllers
{
    public class Result
    {
        public bool IsSuccess { get; set; }
        public string Errors { get; set; }
    }

    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        internal readonly IMediator _mediator;

        

        public UsersController(IMediator mediator)
        {

            _mediator = mediator;
        }


        [HttpPost("user")]
        [Route("/create-user")]     
        public async Task<ActionResult<UserResponse>> AddAsync([FromBody] UserRequest newUser)
        {

            try
            {
                var response = await _mediator.Send(newUser);
                if (response.IsSuccess) return Ok(response);  else return BadRequest (response);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError , ex);
            }
        }


    }
}
