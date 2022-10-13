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
    public class SubjectController : ControllerBase
    {
        private IConfiguration _configuration;
        private ISubjectService _subjectService;
        public SubjectController(IConfiguration configuration, ISubjectService subjectService)
        {
            _configuration = configuration;
            _subjectService = subjectService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-subjects")]
        public List<SubjectModel> GetClasses()
        {
            List<SubjectModel> subjects = new List<SubjectModel>();
            try
            {
                if (ModelState.IsValid)
                {
                    subjects = _subjectService.RetrieveSubjectResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return subjects;
        }
    }
}
