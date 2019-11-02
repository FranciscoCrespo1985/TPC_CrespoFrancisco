using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class EstadoReserva
    {
        public bool es_cancelado { get; set; }
        public bool es_aprobado { get; set; }
        public bool es_finalizado { get; set; }
    }
}