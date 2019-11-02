using Club.Models;
using Club.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;



namespace Club.Controllers
{
    public class TipoActividadController : Controller
    {
        // GET: TipoActividad
        public ActionResult Index()
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


            }
            catch (Exception ex)
            {

                throw;
            }
            return View(tiposActividades);
        }

        // GET: TipoActividad/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TipoActividad/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TipoActividad/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            string descripcion;
            try
            {
                // TODO: Add insert logic here
                
                descripcion = Convert.ToString(collection["descripcionTipoActividad"]);
                datos.setearQuery("insert into TiposActividad(descripcion) values (@descripcion)");
                datos.agregarParametro("@descripcion", descripcion);
               
                datos.ejecutarAccion();
                datos.cerrarConexion();
                return RedirectToAction("Index");
            }
            catch
            {
                datos.cerrarConexion();
                return View();
            }
        }

        // GET: TipoActividad/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TipoActividad/Edit/5
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

        // GET: TipoActividad/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TipoActividad/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.setearQuery("delete from TiposActividad where id =@id");
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
