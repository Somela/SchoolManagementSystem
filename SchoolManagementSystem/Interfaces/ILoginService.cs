using SchoolManagementSystem.Models;
using System.Data;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.Interfaces
{
    public interface ILoginService
    {
        DataTable Authenticate(IConfiguration configuration, LoginRequest model);
    }
}
