using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IDormitoryService
    {
        List<DormitoryResponse> RetrieveDormitoryResponse(IConfiguration configuration);
        SuccessMessageResponse AddDormitory(IConfiguration configuration, DormitoryRequest dormitoryRequest);
        SuccessMessageResponse DeleteDormitory(IConfiguration configuration,DeleteDormitoryRequest deleteDormitoryRequest);
        SuccessMessageResponse UpdateDormitory(IConfiguration configuration, UpdateDormitoryRequest dormitoryRequest);
    }
}
