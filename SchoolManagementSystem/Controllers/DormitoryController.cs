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
    public class DormitoryController : ControllerBase
    {
        private IConfiguration _configuration;
        private IDormitoryService _dormitoryService;
        public DormitoryController(IConfiguration configuration, IDormitoryService dormitoryService)
        {
            _configuration = configuration;
            _dormitoryService = dormitoryService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-domitory")]
        public List<DormitoryResponse> GetDomitoryDetails()
        {
            List<DormitoryResponse> dormitories = new List<DormitoryResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    dormitories = _dormitoryService.RetrieveDormitoryResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return dormitories;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("add-domitory")]
        public SuccessMessageResponse AddDomitoryDetails([FromBody] DormitoryRequest dormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            try
            {
                if (ModelState.IsValid)
                {
                    successMessageResponse = _dormitoryService.AddDormitory(_configuration,dormitoryRequest);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return successMessageResponse;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("update-domitory")]
        public SuccessMessageResponse UpdateDomitoryDetails([FromBody] UpdateDormitoryRequest dormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            try
            {
                if (ModelState.IsValid)
                {
                    successMessageResponse = _dormitoryService.UpdateDormitory(_configuration, dormitoryRequest);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return successMessageResponse;
        }

        [HttpDelete]
        [AllowAnonymous]
        [Route("delete-domitory")]
        public SuccessMessageResponse DeleteDomitoryDetails([FromBody] DeleteDormitoryRequest dormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            try
            {
                if (ModelState.IsValid)
                {
                    successMessageResponse = _dormitoryService.DeleteDormitory(_configuration, dormitoryRequest);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return successMessageResponse;
        }
    }
}
