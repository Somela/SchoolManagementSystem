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
    public class AssignmentServices : IAssignmentServices
    {
        public List<AssignmentsResponse> RetrieveAssignmentsResponse(IConfiguration configuration)
        {
            List<AssignmentsResponse> response = new List<AssignmentsResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = AssignmentsSqlParametersCollection.GetAssignmentsSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Assignments:Get_Assignments"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new AssignmentsResponse
                {
                    AssignmentTitle = row["AssignmentTitle"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    AssignmentDescription = row["AssignmentDescription"].ToString(),
                    AssignmentsDeadline = Convert.ToDateTime(row["AssignmentDeadline"].ToString()),
                    Subject = row["Subject"].ToString()
                });
            }
            return response;
        }
    }
}
