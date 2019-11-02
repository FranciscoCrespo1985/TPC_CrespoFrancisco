using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Reserva
    {
        public long id { get; set; }
        public Actividad actividad { get; set; }
        public Socio socio { get; set; }
        public bool recurrente { get; set; }
        public DateTime fechaFinActividad { get; set; }
        public Horario horario{ get; set; }
        public EstadoReserva estado { get; set; }
    }
}