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
    public class NewsService:INewsService
    {
        public List<NewsResponse> RetrieveNewsResponse(IConfiguration configuration)
        {
            List<NewsResponse> response = new List<NewsResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = NewsSqlParametersCollection.GetNewsSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:News:Get_News"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new NewsResponse
                {
                    NewsTitle = row["NewsTitle"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    NewsContent = row["NewsContent"].ToString(),
                    EventMessageFor = row["EventMessageFor"].ToString(),
                    NewsDate = Convert.ToDateTime(row["NewDate"].ToString())
                });
            }
            return response;
        }
    }
}
