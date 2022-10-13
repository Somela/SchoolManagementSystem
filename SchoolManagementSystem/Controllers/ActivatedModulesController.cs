using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActivatedModulesController : ControllerBase
    {
        private IConfiguration _configuration;
        private IActivatedModulesService _activatedModulesService;
        public ActivatedModulesController(IConfiguration configuration, IActivatedModulesService activatedModulesService)
        {
            _configuration = configuration;
            _activatedModulesService = activatedModulesService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-activatedModules")]
        public List<Modules> ActivatedModules()
        {
            List<Modules> modules = new List<Modules>();
            try
            {
                if (ModelState.IsValid)
                {
                    modules = _activatedModulesService.GetModules(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return modules;
        }
    }
}
