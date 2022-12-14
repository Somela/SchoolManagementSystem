using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IBookLibraryService
    {
        List<BookLibraryResponse> RetrieveBookLibraryResponse(IConfiguration configuration);
    }
}
