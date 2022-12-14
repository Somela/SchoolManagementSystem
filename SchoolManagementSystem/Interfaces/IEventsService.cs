using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IEventsService
    {
        List<EventsResponse> RetrieveEventsResponse(IConfiguration configuration);
    }
}
