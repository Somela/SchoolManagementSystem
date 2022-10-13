using SchoolManagementSystem.Interfaces;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.SqlParametersCollection;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.Services
{
    public class SubjectService: ISubjectService
    {
        public List<SubjectModel> RetrieveSubjectResponse(IConfiguration configuration)
        {
            List<SubjectModel> response = new List<SubjectModel>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = SubjectSqlParametersCollection.GetSubjectSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Subject:Get_Subject"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new SubjectModel
                {
                    SubjectName = row["SubjectName"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    TeacherName = row["TeacherName"].ToString(),
                    Class = row["Class"].ToString()
                });
            }
            return response;
        }
    }
}
