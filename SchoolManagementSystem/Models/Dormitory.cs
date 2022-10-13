namespace SchoolManagementSystem.Models
{
    public class DormitoryResponse
    {
        public int Id { get; set; }
        public string DormitoryName { get; set; }
        public string DormitoryDescription { get; set; }
    }

    public class DormitoryRequest
    {
        public string DormitoryName { get; set; }
        public string DormitoryDescription { get; set; }
    }

    public class UpdateDormitoryRequest
    {
        public int Id { get; set; }
        public string DormitoryName { get; set; }
        public string DormitoryDescription { get; set; }
    }

    public class DeleteDormitoryRequest
    {
        public int Id { get; set; }
        public string DormitoryName { get; set; }
        public string DormitoryDescription { get; set; }
    }
}
