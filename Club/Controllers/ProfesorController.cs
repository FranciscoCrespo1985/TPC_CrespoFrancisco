using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;
namespace Club.Controllers
{
    public class ProfesorController : Controller
    {
        Listas lista = new Listas();
        // GET: Profesor
        public ActionResult Index()
        {
            return View();
        }

        // GET: Profesor/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Profesor/Create
        public ActionResult Create()
        {
           return View(lista.ListaActividadTipo());
        }

        // POST: Profesor/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            Profesor profesor = new Profesor();
            profesor.actividad = new ActividadTipo();
            profesor.nombre = Convert.ToString(collection["nombre"]);
            profesor.dni = Convert.ToString(collection["dni"]);
            profesor.email = Convert.ToString(collection["email"]);
            profesor.telefono = Convert.ToString(collection["telefono"]);
            profesor.actividad.id = Convert.ToInt32(collection["id"]);

            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                // TODO: Add insert logic here
                datos.setearQuery("insert into profesor(nombre,dni,telefono,email,id_actividad_tipo)" +
                "values (@nombre,@dni,@telefono,@email,@id) ");
                datos.agregarParametro("@nombre", profesor.nombre);
                datos.agregarParametro("@dni", profesor.dni);
                datos.agregarParametro("@telefono", profesor.telefono);
                datos.agregarParametro("@email", profesor.email);
                datos.agregarParametro("@id", profesor.actividad.id);                
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

        // GET: Profesor/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Profesor/Edit/5
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

        // GET: Profesor/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Profesor/Delete/5
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
