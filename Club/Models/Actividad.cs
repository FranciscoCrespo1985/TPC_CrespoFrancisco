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
        public Locacion Locacion { get; set; }        
        
    }







}