using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bussines.Services
{
  public  class User : IUserService
    {
        public Domain.Models.User MapDto(UserDTO user)
        {
            var factory = new FactoryUser();
            Domain.Models.User nuevoUser = new Domain.Models.User()
            {

                Name = user.Name,
                Email = StringValidator.NormalizeEmail(user.Email),
                Address = user.Address,
                Phone = user.Phone,
                UserType = user.UserType,
                Money = user.Money
            };
            nuevoUser.Money = factory.GetMoneyCalculatedByUser(nuevoUser);
            return nuevoUser;
        }
    }
}
