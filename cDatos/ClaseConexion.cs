using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace cDatos
{
    class ClaseConexion
    {
        public SqlConnection conectar(string conexion)
        {
            try
            {
                SqlConnection oconectar = new SqlConnection(ConfigurationSettings.AppSettings[conexion].ToString());
                oconectar.Open();
                return oconectar;
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }
    }
}
