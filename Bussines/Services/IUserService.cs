using Domain;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines.Services
{
   public interface IUserService
    {

      public Domain.Models.User MapDto(UserDto user); 

    }
}
