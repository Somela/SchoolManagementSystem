using SchoolManagementSystem.Services;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.SqlParametersCollection
{
    public class EventSqlParametersCollection
    {
        public static SqlCommand GetEventSqlParameterCollection(IConfiguration configuration, string queryStoreProcedure)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            return sqlCommand;
        }
    }
}
