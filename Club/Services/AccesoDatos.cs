using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace Club.Services
{
    public class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; set; }
        public SqlCommand comando { get; set; }


        public AccesoDatos()
        {
            /*laptop*/
            conexion = new SqlConnection("data source=Paco-PC; initial catalog=DEPORTES_CRESPO_TP; integrated security=sspi");
            /*casa*/ //conexion = new SqlConnection("data source=DESKTOP-3OE155I\\SQLEXPRESS; initial catalog=DEPORTES_CRESPO_TP; integrated security=sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void setearSP(string sp)
        {

        }

        public void agregarParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void ejecutarLector()
        {
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //conexion.Close();
            }
        }

        public void cerrarConexion()
        {
            conexion.Close();
        }

        public void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }


    }
}