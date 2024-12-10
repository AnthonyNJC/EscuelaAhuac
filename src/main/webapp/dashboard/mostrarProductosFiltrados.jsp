<%@ page contentType="text/html; charset=UTF-8" %>
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
            <div class="card-header row mb-3">
                <div class="col-md-6">
                    <i class="fas fa-table me-1"></i>
                    <h1>Lista de Inventario</h1>
                </div>
                <div class="col-md-6">
                    <form action="../SVBuscarProducto" method="GET">
                        <div class="row mt-4 mb-0">
                            <select class="form-control col-md-3 mb-1" name="inputGrado" required >
                                <option value="" disabled selected>Buscar Objeto por Grado</option>
                                <option value="3 años">3 años</option>
                                <option value="4 años 'A'">4 años 'A'</option>
                                <option value="4 años 'B'">4 años 'B'</option>
                                <option value="5 años 'A'">5 años 'A'</option>
                                <option value="5 años 'B'">5 años 'B'</option>
                                <option value="1° 'U'">1° 'U'</option>
                                <option value="2° 'A'">2° 'A'</option>
                                <option value="2° 'B'">2° 'B'</option>
                                <option value="3° 'U'">3° 'U'</option>
                                <option value="4° 'A'">4° 'A'</option>
                                <option value="4° 'B'">4° 'B'</option>
                                <option value="5° 'U'">5° 'U'</option>
                                <option value="6° 'A'">6° 'A'</option>
                                <option value="6° 'B'">6° 'B'</option>
                                <!-- Agrega más opciones según sea necesario -->
                            </select>
                            <div class=" mb-0 row">
                                <div class="d-grid col-md-3"><button class="btn btn-primary btn-block" style="background: #1c1e21" type="submit">Buscar</button></div>
                                <div class="d-grid col-md-3"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="../SVInventario">limpiar</a></div>
                            </div>
                        </div>
                    </form>
                </div>
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
                                    <th>Salón</th> <!<!--  tipo de ingreso esta represantado como salon, es a donde pertenece-->
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
                                    <th>Salón</th>
                                    <th>Centro de Costos</th>
                                    <th>Ubicacion fisica</th>
                                    <th>Estado</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </tfoot>
                            <%
                                List<Inventario> listaProductos = (List) request.getSession().getAttribute("listaFiltrada");
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
                                        Date fecha = inv.getFechaAlta();
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
                                        <form name="editar" action="../SVEditarProducto" method="GET"> <!-- esto es para mandar el codigo al servlet -->
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
