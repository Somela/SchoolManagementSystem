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
    public class BookLibraryService: IBookLibraryService
    {
        public List<BookLibraryResponse> RetrieveBookLibraryResponse(IConfiguration configuration)
        {
            List<BookLibraryResponse> response = new List<BookLibraryResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = BookLibrarySqlParameterCollection.GetBookLibrarySqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:BookLibrary:Get_BookLibrary"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new BookLibraryResponse
                {
                    BookTitle = row["BookTitle"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    BookDescription = row["BookDescription"].ToString(),
                    BookAuthor = row["BookAuthor"].ToString(),
                    BookType = row["BookType"].ToString(),
                    BookPrice = row["BookPrice"].ToString(),
                    State = row["State"].ToString()
                });
            }
            return response;
        }
    }
}
