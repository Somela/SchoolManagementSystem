using System;

namespace SchoolManagementSystem.Models
{
    public class NewsResponse
    {
        public int Id { get; set; }
        public string NewsTitle { get; set; }
        public string NewsContent { get; set; }
        public string EventMessageFor { get; set; }
        public DateTime NewsDate { get; set; }
    }
}
