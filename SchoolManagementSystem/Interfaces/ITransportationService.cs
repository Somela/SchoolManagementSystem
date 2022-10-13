using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface ITransportationService
    {
        List<TransportationResponse> RetrieveTransportationResponse(IConfiguration configuration);
    }
}
