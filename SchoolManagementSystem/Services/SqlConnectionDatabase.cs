using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;

namespace SchoolManagementSystem.Services
{
    public class SqlConnectionDatabase
    {
        public static SqlConnection ConnectionOfDatabase(IConfiguration _configuration)
        {
            string connectionString = null;
            SqlConnection connection = null;
            try
            {
                connectionString = _configuration.GetConnectionString("Connection");
                connection = new SqlConnection(connectionString);
            }
            catch (SqlException ex)
            {
                connectionString = ex.Message;
            }

            return connection;
        }

        public static string GetQuery(IConfiguration configuration, string tableScript)
        {
            return configuration.GetSection(tableScript).Value;
        }
    }
}
