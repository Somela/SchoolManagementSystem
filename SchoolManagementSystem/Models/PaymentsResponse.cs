namespace SchoolManagementSystem.Models
{
    public class PaymentsResponse
    {
        public int Id { get; set; }
        public string PaymentTitle { get; set; }
        public string PaymentDescription { get; set; }
        public string RollNumber { get; set; }
        public int Amount { get; set; }
        public string Status { get; set; }
        public string InvoiceNumber { get; set; }
    }
}
