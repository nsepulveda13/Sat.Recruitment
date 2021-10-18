using Domain.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Domain
{
  public  class UserDTO
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Address { get; set; }

        public string Phone { get; set; }

        public string UserType { get; set; }

        public decimal Money { get; set; }
      


    }
}
