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
    public class ActivatedModulesService : IActivatedModulesService
    {
        public List<Modules> GetModules(IConfiguration configuration)
        {
            SqlCommand sqlCommand = ModulesSqlParameterCollection.GetModulesSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:ActivatedModules"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable table = new DataTable();
            sqlDataAdapter.Fill(table);
            List<Modules> modules = new List<Modules>();
            foreach (DataRow row in table.Rows)
            {
#pragma warning disable CS8601 // Possible null reference assignment.
                modules.Add(new Modules
                {
                    Id = Convert.ToInt32(row["Id"]),
                    ModuleName = row["Modules"].ToString(),
                    Icon = row["Icon"].ToString(),
                });
#pragma warning restore CS8601 // Possible null reference assignment.
            }
            return modules;
        }
    }
}
