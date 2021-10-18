using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Domain.Models;
namespace Domain.Request
{
   public class UserRequest : User ,  IRequest <UserResponse>
    {
        //public UserResponse UserResponse { get; set; }
    }
}
