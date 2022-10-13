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
    public class PaymentsService: IPaymentsService
    {
        public List<PaymentsResponse> RetrievePaymentsResponse(IConfiguration configuration)
        {
            List<PaymentsResponse> response = new List<PaymentsResponse>();
            DataTable dataTable = new DataTable();
            SqlCommand sqlCommand = PaymentsSqlParametersCollection.GetPaymentsSqlParameterCollection(configuration, SqlConnectionDatabase.GetQuery(configuration, "StoreProcedureQuery:Payments:Get_Payments"));
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);
            foreach (DataRow row in dataTable.Rows)
            {
                response.Add(new PaymentsResponse
                {
                    PaymentTitle = row["PaymentTitle"].ToString(),
                    Id = Convert.ToInt32(row["Id"]),
                    PaymentDescription = row["PaymentDescription"].ToString(),
                    Amount = Convert.ToInt32(row["Amount"].ToString()),
                    Status = row["Status"].ToString(),
                    InvoiceNumber = row["InvoiceNumber"].ToString()
                });
            }
            return response;
        }
    }
}
