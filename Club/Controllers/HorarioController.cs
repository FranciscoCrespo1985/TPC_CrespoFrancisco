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
            Listas l = new Listas();
            return View(l.listaHorario());
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




            Horario hora = new Horario();
            hora.locacion = new Locacion();

            hora.cupo = Convert.ToInt32(collection["cupo"]);
            hora.fechaInicioActividad = DateTime.ParseExact((collection["fechaInicioActividad"]), "d/M/yyyy", null);
            hora.fechaFinActividad = DateTime.ParseExact((collection["fechaFinActividad"]), "d/M/yyyy", null);
            hora.horaInicio = Convert.ToDateTime(collection["horainicio"]);
            hora.horaFin = Convert.ToDateTime(collection["horafin"]);
            hora.dias = new List<bool>();
            hora.locacion.id = Convert.ToInt32(collection["Cancha"]);
            hora.dias.Add(Convert.ToBoolean(collection["lunes"]));
            hora.dias.Add(Convert.ToBoolean(collection["martes"]));
            hora.dias.Add(Convert.ToBoolean(collection["miercoles"]));
            hora.dias.Add(Convert.ToBoolean(collection["jueves"]));
            hora.dias.Add(Convert.ToBoolean(collection["viernes"]));
            hora.dias.Add(Convert.ToBoolean(collection["sabado"]));
            hora.dias.Add(Convert.ToBoolean(collection["domingo"]));

            if (ValidateHorario(hora))
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearQuery("insert into horario(horaInicio,horaFin,fechaFinActividad,fechaInicioActividad,cupo,cantInscriptos,domingo,lunes,martes,miercoles,jueves,viernes,sabado,locacion_id)" +
                        " values(@horaInicio,@horaFin,@fechaFinActividad,@fechaInicioActividad,@cupo,@cantInscriptos,@domingo,@lunes,@martes,@miercoles,@jueves,@viernes,@sabado,@locacion_id)");

                    datos.agregarParametro("@horaInicio", hora.horaInicio);
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
                    datos.agregarParametro("@locacion_id", hora.locacion.id);

                    datos.ejecutarAccion();
                    datos.cerrarConexion();

                    return RedirectToAction("Index");


                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            return RedirectToAction("Create");
        }
            
            
        

        private bool ValidateHorario(Horario hora)
        {

            Listas l = new Listas();
            List <Horario> lh = l.listaHorario();
            foreach (var i in lh) 
            {
                if(hora.locacion.id ==i.locacion.id) 
                {
                    if((hora.fechaInicioActividad <= i.fechaInicioActividad && hora.fechaFinActividad>=i.fechaFinActividad)   || (hora.fechaInicioActividad >= i.fechaInicioActividad && hora.fechaInicioActividad<=i.fechaFinActividad) || (hora.fechaFinActividad <=i.fechaFinActividad &&hora.fechaFinActividad >=i.fechaInicioActividad))
                    {
                        if (((hora.dias[0]) && (i.dias[0])) || ((hora.dias[1]) && (i.dias[1])) || ((hora.dias[2]) && (i.dias[2])) || ((hora.dias[3] && i.dias[3])) || ((hora.dias[4] && i.dias[4])) || ((hora.dias[5] && i.dias[5])) || ((hora.dias[6] && i.dias[6]))) 
                         {
                            if ((hora.horaInicio <= i.horaInicio && hora.horaFin >= i.horaFin) || (hora.horaInicio >= i.horaInicio && hora.horaInicio <= i.horaFin) || (hora.horaFin <= i.horaFin && hora.horaFin >= i.horaInicio)) {
                                return false;
                            }
                        }
                    } 
                }
            }

            return true;



#region sqltry
           /* try
            {
                datos.setearQuery("select * from horario where " +
                    "locacion_id = @locacion_id " +
                    "and " +
                    "(" +
                    "lunes = @lunes " +
                    "or martes = @martes " +
                    "or miercoles = @miercoles " +
                    "or jueves = @jueves " +
                    "or viernes = @viernes " +
                    "or sabado = @sabado " +
                    "or domingo = @domingo" +
                    ") " +
                    "and " +
                    "(" +
                    "cast(@horainicio as time) between cast(horaInicio as time) and cast(horaFin as time) or cast(@horafin as time) between cast(horaInicio as time) and cast(horaFin as time) " +
                    "or " +
                    "(cast(@horainicio as time) <= cast(horaInicio as time) and cast(@horafin as time) >= cast(horaFin as time))" +
                    ") " +
                    "and ((@fechaInicioActividad between fechaInicioActividad and fechafinactividad or @fechafinactividad between fechaInicioActividad and fechafinactividad) " +
                    "or (@fechaInicioActividad < fechaInicioActividad and @fechaFinActividad > fechaFinActividad ))");

                datos.agregarParametro("@horaInicio", hora.horaInicio);
                datos.agregarParametro("@horaFin", hora.horaFin);
                datos.agregarParametro("@fechaFinActividad", hora.fechaFinActividad);
                datos.agregarParametro("@fechaInicioActividad", hora.fechaInicioActividad);
              
        

                datos.agregarParametro("@lunes", hora.dias[0]);
                datos.agregarParametro("@martes", hora.dias[1]);
                datos.agregarParametro("@miercoles", hora.dias[2]);
                datos.agregarParametro("@jueves", hora.dias[3]);
                datos.agregarParametro("@viernes", hora.dias[4]);
                datos.agregarParametro("@sabado", hora.dias[5]);
                datos.agregarParametro("@domingo", hora.dias[6]);
                datos.agregarParametro("@locacion_id", hora.id_locacion);

    */
#endregion


            
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
        public ActionResult Delete(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearQuery("delete from horario where id =@id");
                datos.agregarParametro("@id", collection["id"]);
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

        public JsonResult getCancha(string idTipo) 
        {
            Listas listar = new Listas();
    
            try
            {
                // convierto el string que recibo a entero
                int idLoc = idTipo != null && idTipo != "" ? Convert.ToInt32(idTipo) : 0;
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
    }


    public class MVListaTipoCancha 
    {
        Listas l = new Listas();
        public List<Locacion> lLocacion { get; set; }
        public List<ActividadTipo> lTipos { get; set; }

        public MVListaTipoCancha() {
            lLocacion = l.listaLocacion();
            lTipos = l.ListaActividadTipo();
        }

    }
}
