
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Club.Services;

namespace Club.Models
{
    public class mvListaActividadComponentes
    {

        Listas l = new Listas();
        public List<ActividadTipo> lTipo { get; set; }
        public List<Profesor> lProfesor { get; set; }
        public List<Locacion> lLocacion { get; set; }


        public mvListaActividadComponentes()
        {
            lTipo = l.ListaActividadTipo();
            lProfesor = l.listaProfesor();
            lLocacion = l.listaLocacion();
        }
    }
}