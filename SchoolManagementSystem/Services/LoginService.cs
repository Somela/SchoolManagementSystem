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
    public class LoginService : ILoginService
    {
        public DataTable Authenticate(IConfiguration configuration, LoginRequest loginRequest)
        {
            SqlCommand sqlCommand = LoginRequestSqlParameterCollection.GetLoginRequestSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:login"), loginRequest);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable table = new DataTable();
            if (sqlCommand.Connection != null)
            {
                sqlDataAdapter.Fill(dataTable: table);
            }
            return table;
        }
    }
}
