using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Actividad
    {

        public long id { get; set; }
        public ActividadTipo tipo{ get; set; }
        public Profesor profesor { get; set; }
        public Locacion locacion { get; set; }
        public Horario horario { get; set; }
        public Actividad() {
            tipo = new ActividadTipo();
            profesor = new Profesor();
            locacion = new Locacion();
            horario = new Horario();
        }

    }







}