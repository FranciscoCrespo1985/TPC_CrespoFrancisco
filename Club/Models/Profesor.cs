﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Profesor
    {
        public int id { get; set; }
        public string dni { get; set; }
        public string nombre { get; set; }
        public string telefono { get; set; }
        public string email { get; set; }
        public ActividadTipo actividad { get; set; }

    }
}