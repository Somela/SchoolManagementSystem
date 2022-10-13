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
    public class PaymentsController : ControllerBase
    {
        private IConfiguration _configuration;
        private IPaymentsService _paymentsService;
        public PaymentsController(IConfiguration configuration, IPaymentsService paymentsService)
        {
            _configuration = configuration;
            _paymentsService = paymentsService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-class")]
        public List<PaymentsResponse> GetClasses()
        {
            List<PaymentsResponse> payments = new List<PaymentsResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    payments = _paymentsService.RetrievePaymentsResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return payments;
        }
    }
}
