using System;

namespace SchoolManagementSystem.Models
{
    public class EventsResponse
    {
        public int Id { get; set; }
        public string EventTitle { get; set; }
        public string EventDescription { get; set; }
        public string EventPlace { get; set; }
        public string MessageFor { get; set; }
        public DateTime EventDate { get; set; }
    }
}
