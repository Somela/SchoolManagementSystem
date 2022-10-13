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
    public class EventsService:IEventsService
    {
        public List<EventsResponse> RetrieveEventsResponse(IConfiguration configuration)
        {
            List<EventsResponse> response = new List<EventsResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = EventSqlParametersCollection.GetEventSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Events:Get_Events"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new EventsResponse
                {
                    EventTitle = row["EventTitle"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    EventDescription = row["EventDescription"].ToString(),
                    EventPlace = row["EventPlace"].ToString(),
                    MessageFor = row["EventMessageFor"].ToString(),
                    EventDate = Convert.ToDateTime(row["EventDate"].ToString())
                });
            }
            return response;
        }
    }
}
