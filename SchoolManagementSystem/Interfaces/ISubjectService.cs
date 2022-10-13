﻿using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;
using System.Collections.Generic;

namespace SchoolManagementSystem.Interfaces
{
    public interface ISubjectService
    {
        List<SubjectModel> RetrieveSubjectResponse(IConfiguration configuration);
    }
}
