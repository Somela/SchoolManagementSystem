using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdministratorController : ControllerBase
    {
        private IConfiguration _configuration;
        private IAdministratorService _administratorService;
        public AdministratorController(IConfiguration configuration, IAdministratorService administratorService)
        {
            _configuration = configuration;
            _administratorService = administratorService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-administrator")]
        public List<AdministratorResponse> GetClasses()
        {
            List<AdministratorResponse> admins = new List<AdministratorResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    admins = _administratorService.RetrieveAdministratorResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return admins;
        }
    }
}
