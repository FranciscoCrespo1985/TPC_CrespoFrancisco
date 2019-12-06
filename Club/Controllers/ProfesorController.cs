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

            return View(lista.listaProfesor());
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
            Listas l = new Listas();
            return View(l.seleccionarProfesor(id));
        }

        // POST: Profesor/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();

            Profesor p = new Profesor();
            p.actividad = new ActividadTipo();
            p.nombre = Convert.ToString(collection["nombre"]);
            p.dni = Convert.ToString(collection["dni"]);
            p.telefono = Convert.ToString(collection["telefono"]);
            p.email = Convert.ToString(collection["email"]);
            p.id = Convert.ToInt32(collection["Id"]);
            p.actividad.id = Convert.ToInt32(collection["idact"]);




            try
            {
                datos.setearQuery("update profesores set nombre=@nombre,dni=@dni,telefono=@telefono,email=@email where id=@id");
                datos.agregarParametro("@nombre", p.nombre);
                datos.agregarParametro("@dni", p.dni);
                datos.agregarParametro("@telefono", p.telefono);
                datos.agregarParametro("@email", p.email);
                datos.agregarParametro("@ID_Actividad_Tipo",p.actividad.id);
                datos.agregarParametro("@id", p.id);               
     
                datos.ejecutarAccion();
                datos.cerrarConexion();


                return RedirectToAction("Index");
            }
            catch
            {
                throw;
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
        public ActionResult Delete(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("delete from profesor where id =@id");
                datos.agregarParametro("@id",collection["id"]);
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
