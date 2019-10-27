using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Profesor
    {
        public long id { get; set; }
        public string nombre { get; set; }
        public string email { get; set; }
        public ActividadTipo actividad { get; set; }

    }
}