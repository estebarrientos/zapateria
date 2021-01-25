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
                    listadoTipo.SelectedValue = fila["tipo"].ToString();
                    String genero = fila["genero"].ToString();
                    if (genero.Equals("Masculino"))
                    {
                        opcionGenero.SelectedValue = "1";
                    }
                    else
                    {
                        opcionGenero.SelectedValue = "2";
                    }
                    txtCantidad.Text = fila["cantidad_disponible"].ToString();
                    Double precio = Double.Parse(fila["precio"].ToString());
                    txtPrecio.Text = precio.ToString();
                    lblRespuesta.Text = "Zapatos Encontrados";
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
                    txtCantidad.Text = "";
                    txtPrecio.Text = "";
                    lblValidacion.Text = "";
                    lblValidacion.Text = "Zapatos con id " + txtId.Text + " no encontrados";
                    lblRespuesta.Text = "";
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            lblRespuesta.Text = "Campos limpiados";
            lblValidacion.Text = "";
            limpiarCampos();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtMarca.Text.Equals("") || txtCantidad.Text.Equals("") || txtPrecio.Text.Equals(""))
            {
                lblValidacion.Text = "Error al guardar, faltan campos por ingresar.";
                lblRespuesta.Text = "";
            }
            else
            {
                ClaseEntidad zapatoIngresar = new ClaseEntidad();
                zapatoIngresar.Marca = txtMarca.Text;
                zapatoIngresar.Tipo = listadoTipo.SelectedValue;
                if (opcionGenero.SelectedValue.Equals("1"))
                {
                    zapatoIngresar.Genero = "Masculino";
                }
                else
                {
                    zapatoIngresar.Genero = "Femenino";
                }

                zapatoIngresar.Cantidad_disponible = int.Parse(txtCantidad.Text);
                zapatoIngresar.Precio = double.Parse(txtPrecio.Text);
                bool ingresoExitoso = negocio.guardar_zapato(zapatoIngresar);
                if (ingresoExitoso)
                {
                    lblRespuesta.Text = "Zapatos registrados correctamente";
                    lblValidacion.Text = "";
                    limpiarCampos();
                }
                else
                {
                    lblValidacion.Text = "ha ocurrido un error registrando los zapatos";
                    lblRespuesta.Text = "";
                }
            }

        }


        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            bool respuesta = negocio.eliminar_zapatos(int.Parse(txtId.Text));

            if (respuesta)
            {
                lblRespuesta.Text = "Zapatos eliminados con exito";
                lblValidacion.Text = "";
                limpiarCampos();
            }
            else
            {
                lblValidacion.Text = "Error al intentar eliminar";
                lblRespuesta.Text = "";
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            if (txtMarca.Text.Equals("") || txtCantidad.Text.Equals("") || txtPrecio.Text.Equals(""))
            {
                lblValidacion.Text = "Error al guardar, faltan campos por ingresar.";
                lblRespuesta.Text = "";
            }
            else
            {
                ClaseEntidad zapatos = new ClaseEntidad();
                zapatos.Id = int.Parse(txtId.Text);
                zapatos.Marca = txtMarca.Text;
                zapatos.Tipo = listadoTipo.SelectedValue;
                zapatos.Cantidad_disponible = int.Parse(txtCantidad.Text);
                zapatos.Precio = double.Parse(txtPrecio.Text);

                if (opcionGenero.SelectedValue.Equals("1"))
                {
                    zapatos.Genero = "Masculino";
                }
                else
                {
                    zapatos.Genero = "Femenino";
                }

                bool actualizado = negocio.actualizar_zapa(zapatos);
      
                if (actualizado)
                {
                    lblRespuesta.Text = "Zapatos modificados correctamente.";
                    lblValidacion.Text = "";
                    limpiarCampos();

                }
                else
                {
                    lblValidacion.Text = "Error al modificar los zapatos";
                    lblRespuesta.Text = "";
                }
            }
        }

        public void limpiarCampos()
        {
            txtId.Enabled = true;
            btnEliminar.Enabled = false;
            btnModificar.Enabled = false;
            btnBuscar.Enabled = true;
            btnGuardar.Enabled = true;
            txtId.Text = "";
            txtMarca.Text = "";
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            GridView1.DataBind();

        }
    }
}