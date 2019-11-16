﻿using System;
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
            return View();
        }

        // GET: Actividad/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Actividad/Create
        public ActionResult Create()
        {
            mvListaActividadComponentes mv = new mvListaActividadComponentes();
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
                actividad.profesor.id = Convert.ToInt32(collection["idProfesor"]);
                actividad.locacion.id = Convert.ToInt32(collection["idLocacion"]);
                actividad.horario.id = Convert.ToInt64(collection["idHorario"]);
                

                datos.setearQuery("insert into actividad(id_profesor,id_actividad_tipo,id_locacion,id_horario) values(@id_profesor,@id_actividad_tipo,@id_locacion,@id_horario)");
                datos.agregarParametro("@id_profesor", actividad.profesor.id);
                datos.agregarParametro("@id_actividad_tipo", actividad.profesor.actividad.id);
                datos.agregarParametro("@id_locacion", actividad.locacion.id);
                datos.agregarParametro("@id_horario", actividad.horario.id);
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

        // GET: Actividad/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Actividad/Edit/5
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

        // GET: Actividad/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Actividad/Delete/5
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
        public JsonResult getProfesor(string idActividad)
        {
            Listas listar = new Listas();
            try
            {
                // convierto el string que recibo a entero
                int IdAct = idActividad != null && idActividad != "" ? Convert.ToInt32(idActividad) : 0;
                // acá armas la lista de profesores y la devolves en un JSON 
                return Json(new SelectList(listar.listaProfesor(IdAct), "Id", "Nombre"));
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
            finally
            {
               
            }

        }

    }
    
}
