using System;

namespace SchoolManagementSystem.Models
{
    public class AssignmentsResponse
    {
        public int Id { get; set; }
        public string AssignmentTitle { get; set; }
        public string AssignmentDescription { get; set; }
        public DateTime AssignmentsDeadline { get; set; }
        public string FileName { get; set; }
        public string FileType { get; set; }
        public string FileData { get; set; }
        public string Class { get; set; }
        public string Subject { get; set; }
    }
}
