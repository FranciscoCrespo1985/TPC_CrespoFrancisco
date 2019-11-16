using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Club.Services;
using Club.Models;
namespace Club.Services
{
    public class Listas
    {
        public List<ActividadTipo> ListaActividadTipo()
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
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return tiposActividades;
        }

        public List<Horario> listaHorario()
        {
            AccesoDatos datos = new AccesoDatos();
            Horario aux;
            List<Horario> horarios = new List<Horario>();

            try
            {
                datos.setearQuery("select * from horario");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Horario();
                    aux.dias = new List<bool>();
                    aux.id = datos.lector.GetInt64(0);
                    aux.horaInicio = datos.lector.GetDateTime(1);
                    aux.horaFin = datos.lector.GetDateTime(2);
                    aux.fechaFinActividad = datos.lector.GetDateTime(3);
                    aux.fechaInicioActividad = datos.lector.GetDateTime(4);
                    aux.cupo = datos.lector.GetInt32(5);
                    aux.cantInscriptos = datos.lector.GetInt32(6);
                    aux.dias.Add(datos.lector.GetBoolean(7));
                    aux.dias.Add(datos.lector.GetBoolean(8));
                    aux.dias.Add(datos.lector.GetBoolean(9));
                    aux.dias.Add(datos.lector.GetBoolean(10));
                    aux.dias.Add(datos.lector.GetBoolean(11));
                    aux.dias.Add(datos.lector.GetBoolean(12));
                    aux.dias.Add(datos.lector.GetBoolean(13));
                    horarios.Add(aux);

                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }
            return horarios;
        }

        public Socio getPassword(string email) {
            AccesoDatos datos = new AccesoDatos();
            Socio aux = new Socio();
            
            try
            {

                datos.setearQuery("select * from socios as s " +
                    "inner join tiposSubscripcion as ts on ts.id_subscripcion = s.id_tiposSubscripcion " +
                    "where s.email = @email");
                datos.agregarParametro("@email",email);
                datos.ejecutarLector();
                datos.lector.Read();
                
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


                    
                
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return aux;

        }

        public List<SubscripcionTipo> ListaSocioTipo()
        {
            AccesoDatos datos = new AccesoDatos();
            SubscripcionTipo aux;
            List<SubscripcionTipo> tiposSubscripciones = new List<SubscripcionTipo>();

            try
            {

                datos.setearQuery("Select * from TiposSubscripcion");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new SubscripcionTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.descripcion = datos.lector.GetString(1);
                    tiposSubscripciones.Add(aux);

                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw;
            }
            return tiposSubscripciones;
        }


        public Profesor seleccionarProfesor(int id) {
            List<Profesor> lProfesor = new List<Profesor>();
            AccesoDatos datos = new AccesoDatos();
            Profesor aux;


            try
            {
                datos.setearQuery("select * from profesor as p" +
                              " inner join tiposActividad as tp on p.ID_Actividad_Tipo = tp.id where p.id = "+id.ToString());
                datos.ejecutarLector();
                
                    aux = new Profesor();
                    aux.actividad = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.nombre = datos.lector.GetString(1);
                    aux.dni = datos.lector.GetString(2);
                    aux.telefono = datos.lector.GetString(3);
                    aux.email = datos.lector.GetString(4);
                    aux.actividad.id = datos.lector.GetInt32(6);
                    aux.actividad.descripcion = datos.lector.GetString(7);

                    lProfesor.Add(aux);
                
            }
            catch (Exception ex)
            {

                throw;
            }
            return aux;
        }
        public List<Profesor> listaProfesor() {
            List<Profesor> lProfesor = new List<Profesor>();
            AccesoDatos datos = new AccesoDatos();
            Profesor aux;
            

            try
            {
                datos.setearQuery("select * from profesor as p" +
                              " inner join tiposActividad as tp on p.ID_Actividad_Tipo = tp.id ");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Profesor();
                    aux.actividad = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.nombre = datos.lector.GetString(1);
                    aux.dni = datos.lector.GetString(2);
                    aux.telefono = datos.lector.GetString(3);
                    aux.email = datos.lector.GetString(4);
                    aux.actividad.id = datos.lector.GetInt32(6);
                    aux.actividad.descripcion = datos.lector.GetString(7);

                    lProfesor.Add(aux);
                }
            }
            catch (Exception ex)
            {

                throw;
            }


            return lProfesor;
        }


        public List<Profesor> listaProfesor(int actividad)
        {
            List<Profesor> lProfesor = new List<Profesor>();
            AccesoDatos datos = new AccesoDatos();
            Profesor aux;


            try
            {
                datos.setearQuery("select * from profesor as p" +
                              " inner join tiposActividad as tp on p.ID_Actividad_Tipo = tp.id where p.ID_Actividad_Tipo =@ID_Actividad_Tipo ");
                datos.agregarParametro("@ID_Actividad_Tipo", actividad);
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Profesor();
                    aux.actividad = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.nombre = datos.lector.GetString(1);
                    aux.dni = datos.lector.GetString(2);
                    aux.telefono = datos.lector.GetString(3);
                    aux.email = datos.lector.GetString(4);
                    aux.actividad.id = datos.lector.GetInt32(6);
                    aux.actividad.descripcion = datos.lector.GetString(7);

                    lProfesor.Add(aux);
                }
            }
            catch (Exception ex)
            {

                throw;
            }


            return lProfesor;
        }


        public List<Locacion> listaLocacion()
        {
            List<Locacion> locaciones = new List<Locacion>();
            AccesoDatos datos = new AccesoDatos();
            Locacion aux;


            try
            {
                datos.setearQuery("select * from Locacion as p" +
                              " inner join tiposActividad as tp on p.ID_Actividad_Tipo = tp.id ");
                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    aux = new Locacion();
                    aux.tipo = new ActividadTipo();
                    aux.id = datos.lector.GetInt32(0);
                    aux.descripcion = datos.lector.GetString(2);
                    aux.tipo.id = datos.lector.GetInt32(3);
                    aux.tipo.descripcion = datos.lector.GetString(4);

                    locaciones.Add(aux);
                }
            }
            catch (Exception ex)
            {

                throw;
            }


            return locaciones;
        }

        

    }

}