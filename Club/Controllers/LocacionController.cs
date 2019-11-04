using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Models;
using Club.Services;

namespace Club.Controllers
{
    public class LocacionController : Controller
    {
        Listas lista = new Listas();
        // GET: Locacion
        public ActionResult Index()
        {
            AccesoDatos datos = new AccesoDatos();
            Locacion aux;
            List<Locacion> locaciones = new List<Locacion>();
            try
            {

                datos.setearQuery("Select * from Locacion as l " +
                    "inner join TiposActividad as ta on ta.id = l.id_actividad_tipo");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Locacion();
                    aux.tipo = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.descripcion = datos.lector.GetString(2);
                    aux.tipo.id = datos.lector.GetInt32(3);
                    aux.tipo.descripcion = datos.lector.GetString(4);
                    locaciones.Add(aux);
                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return View(locaciones);
            
        }

        // GET: Locacion/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Locacion/Create
        public ActionResult Create()
        {
            
            

            return View(lista.ListaActividadTipo());
        }

        /*public List<ActividadTipo> cargarListaActividadTipo()
        {
            AccesoDatos datos = new AccesoDatos();
            ActividadTipo aux;
            List<ActividadTipo> tiposActividades = new List<ActividadTipo>();
            
            try
            {

                datos.setearQuery("Select * from TiposActividad");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.descripcion = datos.lector.GetString(1);
                    tiposActividades.Add(aux);

                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return tiposActividades;
        }
        */

        // POST: Locacion/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            Locacion loc = new Locacion();
            AccesoDatos datos = new AccesoDatos();
           
            

            

            try
            {
                loc.descripcion = Convert.ToString(collection["descripcion"]);
                loc.tipo = new ActividadTipo();
                loc.tipo.id = Convert.ToInt32(collection["Id"]);

                datos.setearQuery("insert into locacion(ID_Actividad_Tipo,descripcion) values(@idTipoActividad,@descripcion)");
                datos.agregarParametro("@descripcion", loc.descripcion);
                datos.agregarParametro("@idTipoActividad", loc.tipo.id);
                datos.ejecutarAccion();
                datos.cerrarConexion();
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                datos.cerrarConexion();
                return View();
            }
        }

        // GET: Locacion/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Locacion/Edit/5
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

        // GET: Locacion/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Locacion/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("delete from locacion where id =@id");
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
    }
}
