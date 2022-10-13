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
    public class BookLibraryController : ControllerBase
    {
        private IConfiguration _configuration;
        private IBookLibraryService _bookLibraryService;
        public BookLibraryController(IConfiguration configuration, IBookLibraryService bookLibraryService)
        {
            _configuration = configuration;
            _bookLibraryService = bookLibraryService;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("Get-Books")]
        public List<BookLibraryResponse> GetClasses()
        {
            List<BookLibraryResponse> books = new List<BookLibraryResponse>();
            try
            {
                if (ModelState.IsValid)
                {
                    books = _bookLibraryService.RetrieveBookLibraryResponse(_configuration);
                }
            }
            catch (Exception ex)
            {
                throw ex.InnerException;
            }
            return books;
        }
    }
}
