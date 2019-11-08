using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class PosibleHours
    {
        public List<string> horas { get; set; }
        public  PosibleHours() {
            horas = new List<string>();
            horas.Add("8:00");
            horas.Add("8:30");
            horas.Add("9:00");
            horas.Add("10:00");
            horas.Add("10:30");
            horas.Add("11:00");
            horas.Add("11:30");
            horas.Add("12:00");
            horas.Add("12:30");
            horas.Add("13:00");
            horas.Add("13:30");
            horas.Add("14:00");
            horas.Add("14:30");
            horas.Add("15:00");
            horas.Add("15:30");
            horas.Add("16:00");
            horas.Add("16:30");
            horas.Add("17:00");
            horas.Add("17:30");
            horas.Add("18:00");
            horas.Add("18:30");
            horas.Add("19:00");
            horas.Add("19:30");
            horas.Add("20:00");
            horas.Add("20:30");
            horas.Add("21:00");
            horas.Add("21:30");
            horas.Add("22:00");
            horas.Add("22:30");
            horas.Add("23:00");
            horas.Add("23:30");
            horas.Add("00:00");
            horas.Add("00:30"); 
        }
    }
}