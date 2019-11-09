using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;
namespace Club.Controllers
{
    public class HorarioController : Controller
    {
        // GET: Horario
        public ActionResult Index()
        {
            return View();
        }

        // GET: Horario/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Horario/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Horario/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            Horario hora = new Horario();
          

            hora.cupo = Convert.ToInt32(collection["cupo"]);
            hora.fechaInicioActividad = Convert.ToDateTime(collection["fechaInicioActividad"]);
            hora.fechaFinActividad = Convert.ToDateTime(collection["fechaFinActividad"]);
            hora.horaInicio = Convert.ToDateTime(collection["horainicio"]);
            hora.horaFin = Convert.ToDateTime(collection["horafin"]);
            hora.cantInscriptos = 0;
         
            /*socio.pwd = Convert.ToString(collection["pwd"]);
            socio.dni = Convert.ToString(collection["dni"]);
            socio.email = Convert.ToString(collection["email"]);
            socio.telefono = Convert.ToString(collection["telefono"]);
            socio.subscripcionTipo.id = Convert.ToInt32(collection["Id"]);


            try
            {
                datos.setearQuery("insert into socios(nombre,apellido,dni,telefono,email,pwd,id_tiposSubscripcion)" +
                "values (@nombre,@apellido,@dni,@telefono,@email,@pwd,@id)");
                datos.agregarParametro("@nombre", socio.nombre);
                datos.agregarParametro("@apellido", socio.apellido);
                datos.agregarParametro("@dni", socio.dni);
                datos.agregarParametro("@telefono", socio.telefono);
                datos.agregarParametro("@email", socio.email);
                datos.agregarParametro("@pwd", socio.pwd);
                datos.agregarParametro("@id", socio.subscripcionTipo.id);
                datos.ejecutarAccion();
                datos.cerrarConexion();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }*/
            return View();
        }

        // GET: Horario/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Horario/Edit/5
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

        // GET: Horario/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Horario/Delete/5
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
