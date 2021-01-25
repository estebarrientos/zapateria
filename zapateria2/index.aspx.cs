using System;
using System.Collections.Generic;
using System.Data;
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
        ClaseNegocio negocio = new ClaseNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            ClaseEntidad zapato = new ClaseEntidad();
            zapato.Id = 5;
            zapato.Marca = "Adidas";
            zapato.Tipo = "deportivo";
            zapato.Genero = "masculino";
            zapato.Cantidad_disponible = 10;
            zapato.Precio = 4000;
            negocio.buscarZapato(5);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Equals(""))
            {
                lblValidacion.Text = "Debe ingresar un id para poder buscar";
                lblRespuesta.Text = "";
            }
            else
            {
                DataTable zapatoBuscado = new DataTable();
                zapatoBuscado = negocio.buscarZapato(int.Parse(txtId.Text));
                if(zapatoBuscado.Rows.Count>0)
                {
                    DataRow fila = zapatoBuscado.Rows[0];
                    txtMarca.Text = fila["marca"].ToString();
                    txtTipo.Text = fila["tipo"].ToString();
                    txtGenero.Text = fila["genero"].ToString();
                    txtCantidad.Text = fila["cantidad_disponible"].ToString();
                    Double precio = Double.Parse(fila["precio"].ToString());
                    txtPrecio.Text = precio.ToString();
                    lblRespuesta.Text = "Zapato Encontrado";
                    lblValidacion.Text = "";
                    btnModificar.Enabled = true;
                    btnEliminar.Enabled = true;
                    btnGuardar.Enabled = false;
                    btnBuscar.Enabled = false;
                    txtId.Enabled = false;
                }
                else
                {
                    txtMarca.Text = "";
                    txtTipo.Text = "";
                    txtGenero.Text = "";
                    txtCantidad.Text = "";
                    txtPrecio.Text = "";
                    lblValidacion.Text = "";
                    lblValidacion.Text = "Zapato con id " + txtId.Text + " no encontrado";
                    lblRespuesta.Text = "";
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Text = "";
            txtMarca.Text = "";
            txtTipo.Text = "";
            txtGenero.Text = "";
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            lblRespuesta.Text = "Campos limpiados";
            lblValidacion.Text = "";
            btnModificar.Enabled = false;
            btnGuardar.Enabled = true;
            btnBuscar.Enabled = true;
            btnEliminar.Enabled = false;
            txtId.Enabled = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtMarca.Text.Equals("") || txtTipo.Text.Equals("") || txtGenero.Text.Equals("") || txtCantidad.Text.Equals("") || txtPrecio.Text.Equals(""))
            {
                lblValidacion.Text = "Error al guardar, faltan campos por ingresar.";
                lblRespuesta.Text = "";
            }
            else
            {
                ClaseEntidad zapatoIngresar = new ClaseEntidad();
                zapatoIngresar.Marca = txtMarca.Text;
                zapatoIngresar.Tipo = txtTipo.Text;
                zapatoIngresar.Genero = txtGenero.Text;
                zapatoIngresar.Cantidad_disponible = int.Parse(txtCantidad.Text);
                zapatoIngresar.Precio = double.Parse(txtPrecio.Text);
                bool ingresoExitoso = negocio.guardar_zapato(zapatoIngresar);
                if (ingresoExitoso)
                {
                    lblRespuesta.Text = "Zapatos registrados correctamente";
                    txtId.Text = "";
                    txtMarca.Text = "";
                    txtTipo.Text = "";
                    txtGenero.Text = "";
                    txtCantidad.Text = "";
                    txtPrecio.Text = "";
                    lblValidacion.Text = "";
                    btnModificar.Enabled = false;
                    btnGuardar.Enabled = true;
                    btnBuscar.Enabled = true;
                    btnEliminar.Enabled = false;
                    txtId.Enabled = true;
                }
                else
                {
                    lblValidacion.Text = "ha ocurrido un error registrando los zapatos";
                }
            }

        }


    }
}