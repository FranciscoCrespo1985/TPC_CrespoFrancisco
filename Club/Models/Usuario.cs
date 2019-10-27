using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Usuario
    {
        public long id { get; set; }
        public string email { get; set; }
        public string pwd { get; set; }
    }
}