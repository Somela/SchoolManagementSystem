using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface IActivatedModulesService
    {
        List<Modules> GetModules(IConfiguration configuration);
    }
}
