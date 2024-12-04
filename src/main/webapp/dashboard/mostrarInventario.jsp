
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Inventario"%>
<%@page import="java.util.List"%>
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>



<div id="layoutSidenav_content">
    <main>
        <div class="container card mb-0">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <h1>Lista de Inventario</h1>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Inventario</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre del Producto</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Fecha de Alta</th>
                                    <th>Tipo de Ingreso</th>
                                    <th>Centro de Costos</th>
                                    <th>Ubicacion fisica</th>
                                    <th>Estado</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre del Producto</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Fecha de Alta</th>
                                    <th>Tipo de Ingreso</th>
                                    <th>Centro de Costos</th>
                                    <th>Ubicacion fisica</th>
                                    <th>Estado</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </tfoot>
                                <%
                                    List<Inventario> listaProductos = (List) request.getSession().getAttribute("listaProductos");
                                %> 
                            
                            <tbody>
                                <%
                                    for (Inventario inv : listaProductos) {
                                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                %> 
                                <tr>
                                    <td><%=inv.getCodigo()%></td>
                                    <td><%=inv.getNombreBien()%></td>
                                    <td><%=inv.getMarca()%></td>
                                    <td><%=inv.getModelo()%></td>
                                    <%
                                        Date fecha =inv.getFechaAlta();
                                        String fechaString = formatter.format(fecha);
                                        %> 
                                    <td><%=fechaString%></td>
                                    <td><%=inv.getTipoIngreso()%></td>
                                    <td><%=inv.getCentroCosto()%></td>
                                    <td><%=inv.getUbicacionFisica()%></td>
                                    <td><%=inv.getEstado()%></td>
                                    <td style="display: flex; width: 230px;">
                                        <form name="eliminar" action="../SVEliminarProducto" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px;">
                                                <i class="fas fa-trash-alt"></i> Eliminar
                                            </button>
                                            <input type="hidden" name="id" value="<%= inv.getIdInventario()%>"> <!-- esto es para mandar el codigo al servlet -->
                                        </form>
                                        <form name="editar" action="SVEditarUsuarios" method="GET"> <!-- esto es para mandar el codigo al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px;">
                                                <i class="fas fa-pencil-alt"></i> Editar
                                            </button>
                                            <input type="hidden" name="id" value="<%= inv.getIdInventario()%>"> <!-- esto es para mandar el codigo al servlet -->
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                %> 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@include file="componentesDashboard/footer.jsp" %>                            
</div>
