using System;

namespace SchoolManagementSystem.Models
{
    public class LoginResponse
    {
        public string Message { get; set; }
        public string Token { get; set; }
        public DateTime ValidTo { get; set; }
        public string Role { get; set; }
    }
}
