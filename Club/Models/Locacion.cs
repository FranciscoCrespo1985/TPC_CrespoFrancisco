using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Locacion
    {
        public int id { get; set; }
        public string descripcion { get; set; }

        public ActividadTipo tipo { get; set; }

        
    }
}