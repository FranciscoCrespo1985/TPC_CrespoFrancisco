using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Models;
using Club.Services;
namespace Club.Controllers
{
    public class InscripcionController : Controller
    {
        // GET: Inscripcion
        public ActionResult Index()
        {
            AccesoDatos datos = new AccesoDatos();
            Listas l = new Listas();
            List<Inscripcion> inscripciones = new List<Inscripcion>();
            List<Actividad> actividades = l.ListaActividades();
            MVListaActividadComponentes mvL = new MVListaActividadComponentes();
            Inscripcion aux;
            try
            {
                Socio s = (Socio)Session["idSocio" + Session.SessionID];
                datos.setearQuery("select * from inscripciones as i where i.id_socio =" + s.id);
                datos.ejecutarLector();
                while (datos.lector.Read()) {
                    aux = new Inscripcion();
                    aux.actividad = new Actividad();
                    aux.socio = s;
                    aux.id = datos.lector.GetInt32(0);
                    aux.actividad = actividades.Find(e => e.id == datos.lector.GetInt32(2));
                    aux.fechaInscripcion = datos.lector.GetDateTime(3);
                    inscripciones.Add(aux);
                }
                foreach (var item in inscripciones) 
                {
                    item.actividad.horario = mvL.lHorarios.Find(e => e.id == item.actividad.horario.id);
                    item.actividad.locacion = mvL.lLocacion.Find(e => e.id == item.actividad.locacion.id);
                    item.actividad.profesor = mvL.lProfesor.Find(e => e.id == item.actividad.profesor.id);
                    item.actividad.tipo = mvL.lTipo.Find(e => e.id == item.actividad.tipo.id);
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View(inscripciones);
        }

        // GET: Inscripcion/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Inscripcion/Create
        public ActionResult Create()
        {
            Listas l = new Listas();
            List<Actividad> actividad = l.ListaActividades();
            MVListaActividadComponentes mvL = new MVListaActividadComponentes();
            foreach (var item in actividad)
            {
                item.horario = mvL.lHorarios.Find(e => e.id == item.horario.id);
                item.locacion = mvL.lLocacion.Find(e => e.id == item.locacion.id);
                item.profesor = mvL.lProfesor.Find(e => e.id == item.profesor.id);
                item.tipo = mvL.lTipo.Find(e => e.id == item.tipo.id);
            }
            return View(actividad);
        }

        // POST: Inscripcion/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            long idH;
            Inscripcion inscripcion = new Inscripcion();
            inscripcion.actividad = new Actividad();
            inscripcion.socio = (Socio)Session["idSocio" + Session.SessionID];
            inscripcion.actividad.id = Convert.ToInt32(collection["Id"]);
            inscripcion.fechaInscripcion = DateTime.Now;

            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select h.cupo,h.cantInscriptos,h.id from horario as h " +
                "inner join actividad as a on a.id_horario = h.id where a.id = @id_actividad");
            datos.agregarParametro("@id_actividad", inscripcion.actividad.id);
            datos.ejecutarLector();
            datos.lector.Read();
            idH = datos.lector.GetInt64(2);
            if (datos.lector.GetInt32(0) > datos.lector.GetInt32(1))
            {
                int num = datos.lector.GetInt32(1);
                datos.cerrarConexion();
                datos = new AccesoDatos();
                try
                {
                    datos.setearQuery("insert into inscripciones (id_socio,id_actividad,fecha_inscripcion) " +
                                                      "values(@id_socio,@id_actividad,@fecha_inscripcion)");
                    datos.agregarParametro("@id_socio", inscripcion.socio.id);
                    datos.agregarParametro("@id_actividad", inscripcion.actividad.id);
                    datos.agregarParametro("@fecha_inscripcion", inscripcion.fechaInscripcion.ToString());
                    datos.ejecutarAccion();

                    aumentarHorarioInscripcion(idH, num);
                    // TODO: Add insert logic here

                    return RedirectToAction("Index");
                }
                catch
                {
                    return View("~/Views/Error/YaInscripto.cshtml");

                }
            }
            return View();
        }

        private void aumentarHorarioInscripcion(long idH, int num)
        {
            num++;
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("update horario set cantInscriptos =@num where horario.id = @idH");
            datos.agregarParametro("@num", num);
            datos.agregarParametro("@idH", idH);
            datos.ejecutarAccion();
            datos.cerrarConexion();
        }

        // GET: Inscripcion/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Inscripcion/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Inscripcion/Delete/5
        public ActionResult Delete(int id)
        {

            return View();
        }

        private void disminuirHorarioInscripcion(long idH,int num)
        {
            num--;
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("update horario set cantInscriptos =@num where horario.id = @idH");
            datos.agregarParametro("@num", num);
            datos.agregarParametro("@idH", idH);
            datos.ejecutarAccion();
            datos.cerrarConexion();
        }





        // POST: Inscripcion/Delete/5
        [HttpPost]
        public ActionResult Delete(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            long idH;
            int num;
            datos.setearQuery("select h.cupo,h.cantInscriptos,h.id from horario as h " +
                "inner join actividad as a on a.id_horario = h.id where a.id = @id_actividad");
            datos.agregarParametro("@id_actividad", Convert.ToInt32(collection["idActividad"]));
            datos.ejecutarLector();
            datos.lector.Read();
            idH = datos.lector.GetInt64(2);
            num = datos.lector.GetInt32(1);
            datos.cerrarConexion();
            disminuirHorarioInscripcion(idH, num);

            datos = new AccesoDatos();
            datos.setearQuery("delete from inscripciones where id = @id");
            datos.agregarParametro("@id", Convert.ToInt32(collection["i"]));
            datos.ejecutarAccion();
            datos.cerrarConexion();

            return RedirectToAction("Index");
        }
    }
}
