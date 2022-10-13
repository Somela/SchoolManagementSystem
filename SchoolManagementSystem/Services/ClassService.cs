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
    public class ClassService: IClassService
    {
        public List<ClassResponse> RetrieveClassResponse(IConfiguration configuration)
        {
            List<ClassResponse> response = new List<ClassResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = ClassSqlParameterCollection.GetClassSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Class:Get_Class"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new ClassResponse
                {
                    ClassName = row["ClassName"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    DormitoryName = row["ClassDomitory"].ToString(),
                    TeacherName = row["ClassTeacher"].ToString()
                });
            }
            return response;
        }
    }
}
