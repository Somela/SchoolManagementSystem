using SchoolManagementSystem.Services;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using SchoolManagementSystem.Models;

namespace SchoolManagementSystem.SqlParametersCollection
{
    public class DormitorySqlParameterCollection
    {
        public static SqlCommand GetDormitorySqlParameterCollection(IConfiguration configuration, string queryStoreProcedure)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            return sqlCommand;
        }

        public static SqlCommand AddDormitorySqlParameterCollection(IConfiguration configuration, string queryStoreProcedure, DormitoryRequest dormitoryRequest)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@DormitoryName", SqlDbType.NVarChar).Value = dormitoryRequest.DormitoryName;
            sqlCommand.Parameters.AddWithValue("@DormitoryDescription", SqlDbType.NVarChar).Value = dormitoryRequest.DormitoryDescription;
            if (sqlConnection != null && sqlConnection.State == ConnectionState.Closed)
            {
                sqlConnection.Open();
            }
            return sqlCommand;
        }

        public static SqlCommand UpdateDormitorySqlParameterCollection(IConfiguration configuration, string queryStoreProcedure, UpdateDormitoryRequest dormitoryRequest)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@Id", SqlDbType.Int).Value = dormitoryRequest.Id;
            sqlCommand.Parameters.AddWithValue("@DormitoryName", SqlDbType.NVarChar).Value = dormitoryRequest.DormitoryName;
            sqlCommand.Parameters.AddWithValue("@DormitoryDescription", SqlDbType.NVarChar).Value = dormitoryRequest.DormitoryDescription;
            if (sqlConnection != null && sqlConnection.State == ConnectionState.Closed)
            {
                sqlConnection.Open();
            }
            return sqlCommand;
        }

        public static SqlCommand DeleteDormitorySqlParameterCollection(IConfiguration configuration, string queryStoreProcedure, DeleteDormitoryRequest dormitoryRequest)
        {
            SqlConnection sqlConnection = SqlConnectionDatabase.ConnectionOfDatabase(configuration);
            SqlCommand sqlCommand = new SqlCommand(queryStoreProcedure, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue("@Id", SqlDbType.Int).Value = dormitoryRequest.Id;
            if (sqlConnection != null && sqlConnection.State == ConnectionState.Closed)
            {
                sqlConnection.Open();
            }
            return sqlCommand;
        }
    }
}
