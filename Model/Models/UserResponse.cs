using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Models
{
    public class UserResponse
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }

        public object ResultValue { get; set; }
        public string Errors { get; set; }

    }
}
