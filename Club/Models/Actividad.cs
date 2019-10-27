using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Actividad
    {
        public long id { get; set; }
        public long actividadTipo{ get; set; }
        public long id_socio { get; set; }
        public long id_profesor { get; set; }
        public long id_locacion { get; set; }
        public DateTime fecha{ get; set; }
        public bool es_cancelado { get; set; }
        public bool es_aprobado { get; set; }
        public bool es_finalizado { get; set; }
    }
}