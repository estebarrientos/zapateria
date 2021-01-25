using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using cEntidad;
using cDatos;
using System.Data;



namespace cNegocio
{
    public class ClaseNegocio
        
    {
        ClaseDatos CP = new ClaseDatos();
        public bool actualizar_zapa(ClaseEntidad id)
        {
            return CP.Actualizar(id);
        }
        public bool eliminar_zapatos(int id)
        {
            return CP.eliminar_zapato(id);
        }
        public DataTable N_productos()
        {
            return CP.D_zapatos();
        }

        public bool guardar_zapato(ClaseEntidad zapato)
        {
            return CP.guardar_zapato(zapato);
        }
            


    }
}
