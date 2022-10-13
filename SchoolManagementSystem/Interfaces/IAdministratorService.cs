using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;
namespace SchoolManagementSystem.Interfaces
{
    public interface IAdministratorService
    {
        List<AdministratorResponse> RetrieveAdministratorResponse(IConfiguration configuration);
    }
}
