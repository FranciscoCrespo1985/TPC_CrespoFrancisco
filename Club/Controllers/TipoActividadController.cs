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
            return View();
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
                
                return RedirectToAction("Index");
            }
            catch
            {
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
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
