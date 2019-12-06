using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Inscripcion
    {
        public int id { get; set; }
        public Socio socio{ get; set; }
        public Actividad actividad { get; set; }
        public DateTime fechaInscripcion { get; set; }
    }
}