using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IPaymentsService
    {
        List<PaymentsResponse> RetrievePaymentsResponse(IConfiguration configuration);
    }
}
