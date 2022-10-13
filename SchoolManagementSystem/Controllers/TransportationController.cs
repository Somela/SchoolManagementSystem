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
    public class TransportationController : ControllerBase
    {
        private IConfiguration _configuration;
        private ITransportationService _transportationService;
        public TransportationController(IConfiguration configuration, ITransportationService transportationService)
        {
            _configuration = configuration;
            _transportationService = transportationService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-Transportations")]
        public List<TransportationResponse> GetClasses()
        {
            List<TransportationResponse> transportations = new List<TransportationResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    transportations = _transportationService.RetrieveTransportationResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return transportations;
        }
    }
}
