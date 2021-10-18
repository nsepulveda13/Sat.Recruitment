using System;
using System.Collections.Generic;
using System.Text;
using MediatR;
using Domain.Models;
namespace Domain.Request
{
   public class UserRequest : UserDTO ,  IRequest <UserResponse>
    {
    }
}
