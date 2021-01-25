using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cEntidad;
using cNegocio;

namespace zapateria2
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClaseNegocio negocio = new ClaseNegocio();
            ClaseEntidad zapato = new ClaseEntidad();
            zapato.Id = 5;
            zapato.Marca = "Adidas";
            zapato.Tipo = "deportivo";
            zapato.Genero = "masculino";
            zapato.Cantidad_disponible = 10;
            zapato.Precio = 4000;
            negocio.actualizar_zapa(zapato);
        }
    }
}