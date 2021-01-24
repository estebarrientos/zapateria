using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cEntidad;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace cDatos
{
    public class ClaseDatos
    {
        ClaseConexion oconexion = new ClaseConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool guardar_zapato(ClaseEntidad oZapato)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("bdZapateria");
                ocmd.CommandText = "agregar_zapatos";

                ocmd.Parameters.Add("@marca", oZapato.Marca);
                ocmd.Parameters.Add("@tipo", oZapato.Tipo);
                ocmd.Parameters.Add("@genero", oZapato.Genero);
                ocmd.Parameters.Add("@cantidad_disponible", oZapato.Cantidad_disponible);
                ocmd.Parameters.Add("@precio", oZapato.Precio);

                ocmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["bdZapateria"].ConnectionString);
        public DataTable D_zapatos()
        {
            SqlCommand cmd = new SqlCommand("listar_zapatos", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        ClaseConexion oconexion2 = new ClaseConexion();
        SqlCommand ocmd2 = new SqlCommand();

        public bool eliminar_zapato(ClaseEntidad oZapato2)
        {
            try
            {
                ocmd2.CommandType = CommandType.StoredProcedure;
                ocmd2.Connection = oconexion2.conectar("bdZapateria");
                ocmd.CommandText = "eliminar_zapatos";

                ocmd2.Parameters.Add("id", oZapato2.Id);
                ocmd2.ExecuteNonQuery();
                return true;
            }
            catch(Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        public bool Actualizar(ClaseEntidad id)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("bdZapateria");
                ocmd.CommandText = "actualizar_zapatos";
                ocmd.Parameters.Add("@id",id.Id);
                ocmd.ExecuteNonQuery();
                return true;
            }


            catch (Exception err)
            {
                throw new Exception(err.Message);
            }

        }


    }
}
