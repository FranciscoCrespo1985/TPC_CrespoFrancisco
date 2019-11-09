using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Horario
    {
        public int Id { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFin { get; set; }
        public DateTime fechaFinActividad { get; set; }

        public DateTime fechaInicioActividad { get; set; }
        public int cupo { get; set; }
        public int cantInscriptos { get; set; }

    }
}