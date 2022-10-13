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
    public class TransportationService: ITransportationService
    {
        public List<TransportationResponse> RetrieveTransportationResponse(IConfiguration configuration)
        {
            List<TransportationResponse> response = new List<TransportationResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = TransportationSqlParametersCollection.GetTransportationSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Transportation:Get_Transportation"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new TransportationResponse
                {
                    TransportDescription = row["TransportDescription"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    TransportTitle = row["TransportTitle"].ToString(),
                    Contact = row["Contact"].ToString(),
                    Fare = Convert.ToInt32(row["Fare"].ToString())
                });
            }
            return response;
        }
    }
}
