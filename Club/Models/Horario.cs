using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class Horario
    {
        public long id { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFin { get; set; }
        public DateTime fechaFinActividad { get; set; }
        public DateTime fechaInicioActividad { get; set; }
        public int cupo { get; set; }
        public int cantInscriptos { get; set; }
        public List<bool> dias { get; set; }
        public int id_locacion { get; set; }


        public override string ToString()
        {
            string s;
            s = horaInicio + " - " + horaFin + " - ";
            s += (dias[0] == true) ? "Lunes" : "";
            s += (dias[1] == true) ? " - Martes" : "";
            s += (dias[2] == true) ? " - Miercoles" : "";
            s += (dias[3] == true) ? " - Jueves" : "";
            s += (dias[4] == true) ? " - Viernes" : "";
            s += (dias[5] == true) ? " - Sabado" : "";
            s += (dias[6] == true) ? " - Domingo" : "";
            s += " Cupo: " + cupo;
            return s ;
        }
        public string diasXSemana() {
            string s = "";
            
            s += (dias[0] == true) ? "Lunes" : "";
            s += (dias[1] == true) ? " - Martes" : "";
            s += (dias[2] == true) ? " - Miercoles" : "";
            s += (dias[3] == true) ? " - Jueves" : "";
            s += (dias[4] == true) ? " - Viernes" : "";
            s += (dias[5] == true) ? " - Sabado" : "";
            s += (dias[6] == true) ? " - Domingo" : "";
            return s;
        }
    }
}