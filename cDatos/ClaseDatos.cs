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
                SqlCommand ocmd = new SqlCommand("agregar_zapatos", oconexion.conectar("conexionBD"));
                ocmd.CommandType = CommandType.StoredProcedure;
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

       
        public DataTable D_zapatos()
        {
            SqlCommand cmd = new SqlCommand("listar_zapatos", oconexion.conectar("conexionBD"));
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        ClaseConexion oconexion2 = new ClaseConexion();
        SqlCommand ocmd2 = new SqlCommand();

        public bool eliminar_zapato(int id)
        {
            try
            {
                SqlCommand ocmd2 = new SqlCommand("eliminar_zapatos", oconexion.conectar("conexionBD"));
                ocmd2.CommandType = CommandType.StoredProcedure;
                ocmd2.Parameters.Add("id", id);
                ocmd2.ExecuteNonQuery();
                return true;
            }
            catch(Exception error)
            {
                throw new Exception(error.Message);
            }
        }

        public bool Actualizar(ClaseEntidad oZapato)
        {
            try
            {
                SqlCommand ocmd = new SqlCommand("actualizar_zapatos", oconexion.conectar("conexionBD"));
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Parameters.Add("@id", oZapato.Id);
                ocmd.Parameters.Add("@marca", oZapato.Marca);
                ocmd.Parameters.Add("@tipo", oZapato.Tipo);
                ocmd.Parameters.Add("@genero", oZapato.Genero);
                ocmd.Parameters.Add("@cantidad_disponible", oZapato.Cantidad_disponible);
                ocmd.Parameters.Add("@precio", oZapato.Precio);

                ocmd.ExecuteNonQuery();
                return true;
            }


            catch (Exception err)
            {
                throw new Exception(err.Message);
            }

        }

        public DataTable buscarZapatos(int id)
        {
            SqlCommand cmd = new SqlCommand("buscar_zapatos", oconexion.conectar("conexionBD"));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

    }
}
