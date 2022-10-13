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
    public class AdministratorService: IAdministratorService
    {
        public List<AdministratorResponse> RetrieveAdministratorResponse(IConfiguration configuration)
        {
            List<AdministratorResponse> response = new List<AdministratorResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = AdministratorSqlParametersCollection.GetAdministratorSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Administrator:Get_Administrator"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new AdministratorResponse
                {
                    FullName = row["FullName"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    UserName = row["UserName"].ToString(),
                    EmailAddress = row["EmailAddress"].ToString()
                });
            }
            return response;
        }
    }
}
