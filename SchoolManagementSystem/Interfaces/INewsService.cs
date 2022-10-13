using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface INewsService
    {
        List<NewsResponse> RetrieveNewsResponse(IConfiguration configuration);
    }
}
