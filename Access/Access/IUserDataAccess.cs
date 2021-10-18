using Domain.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Data.Access
{
    public interface IUserDataAccess
    {
        Task<IEnumerable<User>> GetUsersAsync();
    }
}
