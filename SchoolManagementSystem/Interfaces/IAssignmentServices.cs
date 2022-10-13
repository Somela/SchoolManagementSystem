using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IAssignmentServices
    {
        List<AssignmentsResponse> RetrieveAssignmentsResponse(IConfiguration configuration);
    }
}
