using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Socio
    {
        public long id { get; set; }
        public string email { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string pwd { get; set; }
        public string dni { get; set; }
        public string telefono { get; set; }
        public SubscripcionTipo subscripcionTipo { get; set; }

    }
}