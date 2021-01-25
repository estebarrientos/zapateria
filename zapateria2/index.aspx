<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="zapateria2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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
                    <h1 class="text-dark text-center text-capitalize"><i class="bi bi-cart-fill"></i><strong> Gestion de Zapatos</strong></h1> 
                </div>
            </div>
            <div class="row mt-4 justify-content-center">
                <div class="col-md-2">
                    <h5 class="text-center mb-5"><i class="bi bi-heart-fill"></i> Id:</h5>
                    <h5 class="text-center mb-4"><i class="bi bi-heart-fill"></i> Marca:</h5>
                    <h5 class="text-center mb-4"><i class="bi bi-heart-fill"></i> Tipo:</h5>
                    <h5 class="text-center mb-4"><i class="bi bi-heart-fill"></i> Genero:</h5>
                    <h5 class="text-center mb-4"><i class="bi bi-heart-fill"></i> Cantidad:</h5>
                    <h5 class="text-center"><i class="bi bi-heart-fill"></i> Precio:</h5>
                </div>
                <div class="col-md-2 mb-1">
                    <asp:TextBox ID="txtId" runat="server" TextMode="Number" CssClass="mb-4 col-12 form-control" placeholder="Ingrese el id"></asp:TextBox>
                    <asp:TextBox ID="txtMarca" runat="server" CssClass="mb-3 col-12 form-control mt-3" placeholder="ingrese la marca"></asp:TextBox>
                    <asp:DropDownList ID="listadoTipo" runat="server" CssClass="form-select">
                        <asp:ListItem>Deportivo</asp:ListItem>
                        <asp:ListItem>Botas</asp:ListItem>
                        <asp:ListItem>Bailarinas</asp:ListItem>
                        <asp:ListItem>Desert</asp:ListItem>
                        <asp:ListItem>Sneakers</asp:ListItem>
                        <asp:ListItem>Scarpines</asp:ListItem>
                        <asp:ListItem>Mocasin</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="opcionGenero" runat="server" CssClass="form-select mb-3 mt-2">
                        <asp:ListItem Value="1">Masculino</asp:ListItem>
                        <asp:ListItem Value="2">Femenino</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" CssClass="mb-3 col-12 form-control" placeholder="ingrese la cantidad"></asp:TextBox>
                    <asp:TextBox ID="txtPrecio" runat="server" AutoCompleteType="Enabled" CssClass="col-12 form-control" TextMode="Number" ToolTip="Ingrese un precio" placeholder="Ingrese un precio"></asp:TextBox>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-8 mt-3">
                    <p class="text-center">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="mr-2 btn btn-dark" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="mr-2 btn btn-dark" Enabled="False" OnClick="btnModificar_Click"/>
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
    <footer class="bg-dark text-light text-center text-lg-start">
        <!-- Grid container -->
        <div class="container p-4">
          <!--Grid row-->
          <div class="row">
            <!--Grid column-->
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
              <h5 class="text-uppercase">Creado por: </h5>
      
              <p>
                Carlos Andrés Diaz Aguirre
              </p>
              <p>
                Sebastián Llano Taborda
              </p>
              <p>
                Esteban Barrientos Aguirre
              </p>
            </div>
            <!--Grid column-->
      
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase">Links</h5>
      
              <ul class="list-unstyled mb-0">
                <li>
                  <a href="https://github.com/carlitosSoporte" class="btn btn-dark"><i class="fab fa-github-square"></i></a>
                </li>
                <li>
                  <a href="https://github.com/juanllano3311" class="btn btn-dark"><i class="fab fa-github-square"></i></a>
                </li>
                <li>
                  <a href="https://github.com/estebarrientos" class="btn btn-dark"><i class="fab fa-github-square"></i></a>
                </li>
                
              </ul>
            </div>
            <!--Grid column-->
      
            
          </div>
          <!--Grid row-->
        </div>
        <!-- Grid container -->
      
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
          © 2021 Copyright:
          <a class="text-white" href="https://github.com/estebarrientos/zapateria">CarlosD, SebasL, EstebanB</a>
        </div>
        <!-- Copyright -->
      </footer>
        <script src="https://kit.fontawesome.com/3a888d9e86.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </form>
    </body>
</html>
