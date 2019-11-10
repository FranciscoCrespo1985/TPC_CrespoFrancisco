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
            hora.fechaInicioActividad = DateTime.ParseExact((collection["fechaInicioActividad"]),"d/M/yyyy", null);
            hora.fechaFinActividad = DateTime.ParseExact((collection["fechaFinActividad"]),"d/M/yyyy",null);
            hora.horaInicio = Convert.ToDateTime(collection["horainicio"]);
            hora.horaFin = Convert.ToDateTime(collection["horafin"]);
            hora.dias = new List<bool>();
            
            hora.dias.Add(Convert.ToBoolean(collection["lunes"]));
            hora.dias.Add(Convert.ToBoolean(collection["martes"]));
            hora.dias.Add(Convert.ToBoolean(collection["miercoles"]));
            hora.dias.Add(Convert.ToBoolean(collection["jueves"]));
            hora.dias.Add(Convert.ToBoolean(collection["viernes"]));
            hora.dias.Add(Convert.ToBoolean(collection["sabado"]));
            hora.dias.Add(Convert.ToBoolean(collection["domingo"]));


            try
            {
                datos.setearQuery("insert into horario(horaInicio,horaFin,fechaFinActividad,fechaInicioActividad,cupo,cantInscriptos,domingo,lunes,martes,miercoles,jueves,viernes,sabado)" +
                    " values(@horaInicio,@horaFin,@fechaFinActividad,@fechaInicioActividad,@cupo,@cantInscriptos,@domingo,@lunes,@martes,@miercoles,@jueves,@viernes,@sabado)");

                datos.agregarParametro("@horaInicio",hora.horaInicio); 
                datos.agregarParametro("@horaFin", hora.horaFin); 
                datos.agregarParametro("@fechaFinActividad", hora.fechaFinActividad);
                datos.agregarParametro("@fechaInicioActividad", hora.fechaInicioActividad);
                datos.agregarParametro("@cupo", hora.cupo);
                datos.agregarParametro("@cantInscriptos", hora.cantInscriptos);

                
                datos.agregarParametro("@lunes", hora.dias[0]);
                datos.agregarParametro("@martes", hora.dias[1]);
                datos.agregarParametro("@miercoles", hora.dias[2]);
                datos.agregarParametro("@jueves", hora.dias[3]);
                datos.agregarParametro("@viernes", hora.dias[4]);
                datos.agregarParametro("@sabado", hora.dias[5]);
                datos.agregarParametro("@domingo", hora.dias[6]);

                datos.ejecutarAccion();
                datos.cerrarConexion();

                return RedirectToAction("Index");


            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
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
