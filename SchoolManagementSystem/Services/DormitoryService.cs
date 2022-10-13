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
    public class DormitoryService: IDormitoryService
    {
        public List<DormitoryResponse> RetrieveDormitoryResponse(IConfiguration configuration)
        {
            List<DormitoryResponse> response = new List<DormitoryResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = DormitorySqlParameterCollection.GetDormitorySqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Dormitory:Get_Dormitory"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach(DataRow row in dataTable.Rows)
            {
                response.Add(new DormitoryResponse
                {
                    DormitoryName = row["DormitoryName"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    DormitoryDescription = row["DormitoryDescription"].ToString(),
                });
            }
            return response;
        }

        public SuccessMessageResponse AddDormitory(IConfiguration configuration,DormitoryRequest dormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            int effectedRows = -1;
            SqlCommand sqlCommand = DormitorySqlParameterCollection.AddDormitorySqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Dormitory:Add_Dormitory"), dormitoryRequest);
            effectedRows = sqlCommand.ExecuteNonQuery();
            if (effectedRows >= 0)
            {
                successMessageResponse = new SuccessMessageResponse
                {
                    Message = "Dormitory Details Saved Successfully",
                    StatusCode = 201
                };
            }

            return successMessageResponse;
        }

        public SuccessMessageResponse UpdateDormitory(IConfiguration configuration, UpdateDormitoryRequest dormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            int effectedRows = -1;
            SqlCommand sqlCommand = DormitorySqlParameterCollection.UpdateDormitorySqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Dormitory:Update_Dormitory"), dormitoryRequest);
            effectedRows = sqlCommand.ExecuteNonQuery();
            if (effectedRows >= 0)
            {
                successMessageResponse = new SuccessMessageResponse
                {
                    Message = "Dormitory Details updated Successfully",
                    StatusCode = 200
                };
            }

            return successMessageResponse;
        }

        public SuccessMessageResponse DeleteDormitory(IConfiguration configuration, DeleteDormitoryRequest deleteDormitoryRequest)
        {
            SuccessMessageResponse successMessageResponse = new SuccessMessageResponse();
            int effectedRows = -1;
            SqlCommand sqlCommand = DormitorySqlParameterCollection.DeleteDormitorySqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Dormitory:Delete_Dormitory"), deleteDormitoryRequest);
            effectedRows = sqlCommand.ExecuteNonQuery();
            if (effectedRows >= 0)
            {
                successMessageResponse = new SuccessMessageResponse
                {
                    Message = "Dormitory Details deleted Successfully",
                    StatusCode = 200
                };
            }

            return successMessageResponse;
        }
    }
}
