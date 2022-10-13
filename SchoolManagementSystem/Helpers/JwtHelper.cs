using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace SchoolManagementSystem.Helpers
{
    public class JwtHelper
    {
        public static JwtSecurityToken GetJwtToken(
        string email,
        string signingKey,
        string issuer,
        string audience,
        TimeSpan expiration,
        IConfiguration Configuration,
        Claim[] additionalClaims = null)
        {
            var claims = new[]
            {
            new Claim(JwtRegisteredClaimNames.Sub,email),
            // this guarantees the token is unique
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };

            if (additionalClaims is object)
            {
                var claimList = new List<Claim>(claims);
                claimList.AddRange(additionalClaims);
                claims = claimList.ToArray();
            }
            var uniqueKey = Encoding.ASCII.GetBytes(Configuration.GetSection("Secret").Value);
            var key = new SymmetricSecurityKey(uniqueKey);
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            return new JwtSecurityToken(
                issuer: issuer,
                audience: audience,
                expires: DateTime.UtcNow.Add(expiration),
                claims: claims,
                signingCredentials: creds
            );
        }
    }
}