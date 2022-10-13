using SchoolManagementSystem.Models;
using SchoolManagementSystem.Services;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.SqlParametersCollection
{
    public class LoginRequestSqlParameterCollection
    {
        public static SqlCommand GetLoginRequestSqlParameterCollection(IConfiguration configuration, string queryStoreProcedure, LoginRequest loginRequest)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@EmailAddress", SqlDbType.NVarChar).Value = loginRequest.Email;
            sqlCommand.Parameters.AddWithValue("@Password", SqlDbType.NVarChar).Value = loginRequest.Password;
            return sqlCommand;
        }
    }
}
