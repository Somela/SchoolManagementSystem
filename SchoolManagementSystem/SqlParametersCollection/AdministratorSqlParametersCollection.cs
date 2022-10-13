using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Services;
using System.Data;
using System.Data.SqlClient;

namespace SchoolManagementSystem.SqlParametersCollection
{
    public class AdministratorSqlParametersCollection
    {
        public static SqlCommand GetAdministratorSqlParameterCollection(IConfiguration configuration, string queryStoreProcedure)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            return sqlCommand;
        }
    }
}
