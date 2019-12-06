using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;

namespace Club.Controllers
{
    public class ActividadController : Controller
    {
        // GET: Actividad
        public ActionResult Index()
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

        // GET: Actividad/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Actividad/Create
        public ActionResult Create()
        {
            MVListaActividadComponentes mv = new MVListaActividadComponentes();
            return View(mv);
        }

        // POST: Actividad/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            Actividad actividad = new Actividad();
            AccesoDatos datos = new AccesoDatos();
            try
            {
               
                
                actividad.tipo.id = Convert.ToInt64(collection["idTipo"]);
                actividad.profesor.id = Convert.ToInt32(collection["idProfesor"]);
                actividad.locacion.id = Convert.ToInt32(collection["idLocacion"]);
                actividad.horario.id = Convert.ToInt64(collection["idHorario"]);

                datos.setearQuery("insert into actividad(id_profesor,id_actividad_tipo,id_locacion,id_horario) values(@id_profesor,@id_actividad_tipo,@id_locacion,@id_horario)");
                datos.agregarParametro("@id_profesor", actividad.profesor.id);
                datos.agregarParametro("@id_actividad_tipo", actividad.tipo.id);
                datos.agregarParametro("@id_locacion", actividad.locacion.id);
                datos.agregarParametro("@id_horario", actividad.horario.id);
                datos.ejecutarAccion();
                datos.cerrarConexion();
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
                
            }
        }

        // GET: Actividad/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Actividad/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Session["idActividad" + Session.SessionID] = id;
            List<Socio> socios = new List<Socio>();
            Socio aux;
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("select s.id,s.dni,s.nombre,s.apellido,s.telefono,s.email,ts.id_subscripcion,ts.descripcion from inscripciones as i " +
                "inner join socios as s on i.id_socio = s.id " +
                "inner join TiposSubscripcion as ts on s.id_tiposSubscripcion = ts.id_subscripcion " +
                "where i.id_actividad = @id");
            datos.agregarParametro("@id",id);
            
            try
            {
                datos.ejecutarLector();
                while (datos.lector.Read()) 
                {
                    aux = new Socio();
                    aux.subscripcionTipo = new SubscripcionTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.dni = datos.lector.GetString(1);
                    aux.nombre = datos.lector.GetString(2);
                    aux.apellido = datos.lector.GetString(3);
                    aux.telefono = datos.lector.GetString(4);
                    aux.email = datos.lector.GetString(5);
                    aux.subscripcionTipo.id = datos.lector.GetInt32(6);
                    aux.subscripcionTipo.descripcion = datos.lector.GetString(7);
                    socios.Add(aux);
                }
                datos.cerrarConexion();
                return View("SociosInscriptos",socios);
            }
            catch
            {
                throw;
                return View();
            }
        }

        // GET: Actividad/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Actividad/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("delete from actividad where id =@id");
                datos.agregarParametro("@id", id);
                datos.ejecutarAccion();

                // TODO: Add delete logic here

                datos.cerrarConexion();

                return RedirectToAction("Index");

            }
            catch
            {
                datos.cerrarConexion();
                return View();
            }
        }
        [HttpPost]
        public ActionResult QuitarSocioDeActividad(int id, FormCollection collection)  
        {
            int idActividad = (int)Session["idActividad" + Session.SessionID];
            AccesoDatos datos = new AccesoDatos();
            long idH;
            int num;
            datos.setearQuery("select h.cupo,h.cantInscriptos,h.id from horario as h " +
                "inner join actividad as a on a.id_horario = h.id where a.id = @id_actividad");
            datos.agregarParametro("@id_actividad", idActividad);
            datos.ejecutarLector();
            datos.lector.Read();
            idH = datos.lector.GetInt64(2);
            num = datos.lector.GetInt32(1);
            datos.cerrarConexion();
            disminuirHorarioInscripcion(idH, num);

            datos = new AccesoDatos();
            datos.setearQuery("delete from inscripciones  where inscripciones.id_socio = @id and inscripciones.id_actividad=@id_actividad");
            datos.agregarParametro("@id", Convert.ToInt32(collection["Id"]));
            datos.agregarParametro("@id_actividad", idActividad);
            datos.ejecutarAccion();
            datos.cerrarConexion();

            return RedirectToAction("Create","Actividad");

        }
        private void disminuirHorarioInscripcion(long idH, int num)
        {
            num--;
            AccesoDatos datos = new AccesoDatos();
            datos.setearQuery("update horario set cantInscriptos =@num where horario.id = @idH");
            datos.agregarParametro("@num", num);
            datos.agregarParametro("@idH", idH);
            datos.ejecutarAccion();
            datos.cerrarConexion();
        }



        public JsonResult getProfesor(string idActividad)
        {
            Listas listar = new Listas();
            try
            {
                // convierto el string que recibo a entero
                int IdAct = idActividad != null && idActividad != "" ? Convert.ToInt32(idActividad) : 0;
                // acá armas la lista de profesores y la devolves en un JSON 
                return Json(new SelectList(listar.listaProfesor(IdAct), "id", "Nombre"));
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
            finally
            {
               
            }

        }
        public JsonResult getLocacion(string idActividad)
        {
            Listas listar = new Listas();
            try
            {
                // convierto el string que recibo a entero
                int idLoc = idActividad != null && idActividad != "" ? Convert.ToInt32(idActividad) : 0;
                // acá armas la lista de profesores y la devolves en un JSON 
                return Json(new SelectList(listar.listaLocacion(idLoc), "id", "descripcion"));
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
            finally
            {

            }

        }

        public JsonResult getHorario(string idLocacion)
        {
            Listas listar = new Listas();
            try
            {
                // convierto el string que recibo a entero
                int IdLoc = idLocacion != null && idLocacion != "" ? Convert.ToInt32(idLocacion) : 0;
                // acá armas la lista de profesores y la devolves en un JSON 
                return Json(new SelectList(listar.listaHorario(IdLoc), "id", "descripcion"));
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
            finally
            {

            }

        }

        /*public JsonResult getHorario(string idLocacion) 
        {
        
        
        
        
            
        
        }*/



    }
    
}
