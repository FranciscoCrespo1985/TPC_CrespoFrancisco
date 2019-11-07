using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;

namespace Club.Controllers
{
    public class SubcripcionTipoController : Controller
    {
        // GET: SubcripcionTipo
        public ActionResult Index()
        {
            AccesoDatos datos = new AccesoDatos();
            SubscripcionTipo aux;
            List<SubscripcionTipo> tiposActividades = new List<SubscripcionTipo>();
            try
            {

                datos.setearQuery("Select * from TiposSubscripcion");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new SubscripcionTipo();
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

        // GET: SubcripcionTipo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SubcripcionTipo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SubcripcionTipo/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            string descripcion;
            try
            {
                // TODO: Add insert logic here

                descripcion = Convert.ToString(collection["descripcionSubscripcion"]);
                datos.setearQuery("insert into TiposSubscripcion(descripcion) values (@descripcion)");
                                            
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

        // GET: SubcripcionTipo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SubcripcionTipo/Edit/5
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

        // GET: SubcripcionTipo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SubcripcionTipo/Delete/5
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
