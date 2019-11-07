using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;
using Club.Controllers;

namespace Club.Controllers
{
    public class SocioController : Controller
    {
        Listas lista = new Listas();
        // GET: Socio
        public ActionResult Index()
        {
            AccesoDatos datos = new AccesoDatos();
            Socio aux;
            List<Socio> socios = new List<Socio>();
            try
            {

                datos.setearQuery("select * from socios as s " +
                    "inner join tiposSubscripcion as ts on ts.id_subscripcion = s.id_tiposSubscripcion ");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Socio();
                    
                    aux.subscripcionTipo = new SubscripcionTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.dni = datos.lector.GetString(2);
                    aux.nombre = datos.lector.GetString(3);
                    aux.apellido = datos.lector.GetString(4);
                    aux.telefono = datos.lector.GetString(5);
                    aux.email = datos.lector.GetString(6);
                    aux.pwd = datos.lector.GetString(7);
                    aux.subscripcionTipo.id = datos.lector.GetInt32(8);
                    aux.subscripcionTipo.descripcion = datos.lector.GetString(9);


                    socios.Add(aux);
                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return View(socios);
        }

        // GET: Socio/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Socio/Create
        public ActionResult Create()
        {
            return View(lista.ListaSocioTipo());
        }

        // POST: Socio/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            AccesoDatos datos = new AccesoDatos();
            Socio socio = new Socio();
            socio.subscripcionTipo = new SubscripcionTipo();

            socio.nombre = Convert.ToString(collection["nombre"]);
            socio.apellido = Convert.ToString(collection["apellido"]);
            socio.pwd = Convert.ToString(collection["pwd"]);
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
            }
        }

        // GET: Socio/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Socio/Edit/5
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

        // GET: Socio/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Socio/Delete/5
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
