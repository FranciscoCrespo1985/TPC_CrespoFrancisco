using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Actividad
    {
        public long ID { get; set; }
        public long ID_ACTIVIDAD_TIPO { get; set; }
        public long ID_SOCIO { get; set; }
        public long ID_PROFESOR { get; set; }
        public long ID_LOCACION { get; set; }

        public DateTime FECHA { get; set; }

        public bool ES_CANCELADO { get; set; }
        public bool ES_APROBADO { get; set; }
        public bool ES_FINALIZADO { get; set; }



    }
}