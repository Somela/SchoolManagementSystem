using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SchoolManagementSystem.Helpers;
using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Models;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private IConfiguration _configuration;
        private ILoginService _loginService;
        public LoginController(
           IConfiguration configuration,
           ILoginService loginService
           )
        {
            _configuration = configuration;
            _loginService = loginService;
        }
        [AllowAnonymous]
        [HttpPost("authenticate")]
        public LoginResponse Authenticate([FromBody] LoginRequest model)
        {
            JwtSecurityToken jwtSecurityToken = new JwtSecurityToken();
            DataTable data = new DataTable();
            try
            {
                data = _loginService.Authenticate(_configuration, model);
                if (data.Rows.Count < 1)
                    return new LoginResponse
                    {
                        Message = "Email and Password does not matched",
                        Token = "",
                        Role = ""
                    };
                var claims = new List<Claim>();
                claims.Add(new Claim("Email", data.Rows[0]["EmailAddress"].ToString()));
                claims.Add(new Claim("RoleName", data.Rows[0]["Role"].ToString()));
                claims.Add(new Claim(ClaimTypes.Role, data.Rows[0]["Role"].ToString()));
                claims.Add(new Claim("ApplicationName", "School Management System"));
                claims.Add(new Claim("MobileNumber", data.Rows[0]["MobileNumber"].ToString()));
                claims.Add(new Claim(ClaimTypes.Name, data.Rows[0]["EmailAddress"].ToString()));
                jwtSecurityToken = JwtHelper.GetJwtToken(
                           model.Email,
              _configuration.GetSection("JwtToken:SigningKey").Value,
              _configuration.GetSection("JwtToken:Issuer").Value,
              _configuration.GetSection("JwtToken:Audience").Value,
              TimeSpan.FromMinutes(Convert.ToDouble(_configuration.GetSection("JwtToken:TokenTimeoutMinutes").Value)),
              _configuration,
              claims.ToArray()
                          );
            }   catch (Exception ex)
            {
                return new LoginResponse
                {
                    Message = ex.Message,
                    Token = ""
                };
            }
            return new LoginResponse
            {
                Message = "Logged In Successfully",
                Token = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken),
                ValidTo = jwtSecurityToken.ValidTo,
                Role = data.Rows[0]["Role"].ToString()
            };
        }
    }
}
