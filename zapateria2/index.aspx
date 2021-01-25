<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="zapateria2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestion de zapatos</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
          <div class="container-fluid">
            <a class="navbar-brand" href="index.aspx">Zapateria</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="index.aspx">Inicio</a>
                </li>

              </ul>
            </div>
          </div>
        </nav>
    </header>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row justify-content-center mt-5">
                <div class="col-md-8 mt-5">
                    <h1 class="text-dark text-center text-capitalize"><strong> Gestion de Zapatos</strong></h1> 
                </div>
            </div>
            <div class="row mt-4 justify-content-center">
                <div class="col-md-2">
                    <h5 class="text-center mb-4">Id:</h5>
                    <h5 class="text-center mb-4">Marca:</h5>
                    <h5 class="text-center mb-3">Tipo:</h5>
                    <h5 class="text-center mb-4">Genero:</h5>
                    <h5 class="text-center mb-4">Cantidad:</h5>
                    <h5 class="text-center">Precio:</h5>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="txtId" runat="server" TextMode="Number" CssClass="mb-3 col-12"></asp:TextBox>
                    <asp:TextBox ID="txtMarca" runat="server" CssClass="mb-3 col-12"></asp:TextBox>
                    <asp:TextBox ID="txtTipo" runat="server" CssClass="mb-3 col-12"></asp:TextBox>
                    <asp:TextBox ID="txtGenero" runat="server" CssClass="mb-3 col-12"></asp:TextBox>
                    <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" CssClass="mb-3 col-12"></asp:TextBox>
                    <asp:TextBox ID="txtPrecio" runat="server" AutoCompleteType="Enabled" CssClass="col-12" TextMode="Number" ToolTip="Ingrese un precio"></asp:TextBox>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-8 mt-3">
                    <p class="text-center">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="mr-2 btn btn-dark" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="mr-2 btn btn-dark" Enabled="False"/>
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="mr-2 btn btn-dark" Enabled="False" OnClick="btnEliminar_Click"/>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="mr-2 btn btn-dark" OnClick="btnBuscar_Click"/>
                        <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-dark" OnClick="btnLimpiar_Click" />
                    </p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <p class="text-center text-danger"><strong><asp:Label ID="lblValidacion" runat="server"></asp:Label></strong></p>
                    <p class="text-center text-success"><strong><asp:Label ID="lblRespuesta" runat="server"></asp:Label></strong></p>
                </div>
            </div>
            <div class="row justify-content-center mb-5">
                <div class="col-md-12 mb-5">
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Double" CellPadding="20" CellSpacing="20" DataKeyNames="id" DataSourceID="SqlDataSource1" Font-Bold="True" Font-Overline="False" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                            <HeaderStyle BorderStyle="Ridge" />
                            </asp:BoundField>
                            <asp:BoundField DataField="marca" HeaderText="marca" SortExpression="marca" />
                            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                            <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                            <asp:BoundField DataField="cantidad_disponible" HeaderText="Cantidad" SortExpression="Cantidad" />
                            <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                        </Columns>
                        <HeaderStyle BorderStyle="Solid" CssClass="bg-dark" ForeColor="White" HorizontalAlign="Center" Wrap="False" />
                        <RowStyle HorizontalAlign="Center" BorderStyle="Dotted" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:zapateriaConnectionString2 %>" SelectCommand="SELECT * FROM [zapatos]" DeleteCommand="DELETE FROM zapatos"></asp:SqlDataSource>
                    
                </div>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </form>
    </body>
</html>
