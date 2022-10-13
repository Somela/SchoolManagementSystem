using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Models;
using System;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClassController : ControllerBase
    {
        private IConfiguration _configuration;
        private IClassService _classService;
        public ClassController(IConfiguration configuration, IClassService classService)
        {
            _configuration = configuration;
            _classService = classService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-class")]
        public List<ClassResponse> GetClasses()
        {
            List<ClassResponse> classes = new List<ClassResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    classes = _classService.RetrieveClassResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return classes;
        }
    }
}
