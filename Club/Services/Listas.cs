﻿using System;
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
    }

}