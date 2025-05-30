<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Estudiante"%>
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
                    <h1>Lista de Estudiantes</h1>
                </div>
                <div class="col-md-6">
                    <form action="../SVBuscarEstudiante" method="GET">
                        <div class="row mt-4 mb-0">
                            <select class="form-control col-md-3 mb-1" name="inputGrado" required >
                                <option value="" disabled selected>Buscar Estudiante por Grado</option>
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
                                <div class="d-grid col-md-3"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="../SVEstudiante">limpiar</a></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Estudiantes</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Id_Estudiante</th>
                                    <th>Nombre</th>
                                    <th>DNI</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Grado</th>
                                    <th>Apoderado</th>
                                    <th>DNI del apoderado</th>
                                    <th>Fecha de Nacimiento del apoderado</th>
                                    <th>Parentesco</th>
                                    <th>Telefono</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Id_Estudiante</th>
                                    <th>Nombre</th>
                                    <th>DNI</th>
                                    <th>Fecha de Nacimiento</th>
                                    <th>Grado</th>
                                    <th>Apoderado</th>
                                    <th>DNI del apoderado</th>
                                    <th>Fecha de Nacimiento del apoderado</th>
                                    <th>Parentesco</th>
                                    <th>Telefono</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </tfoot>
                            <%
                                List<Estudiante> listaEstudiantes = (List) request.getSession().getAttribute("listaEstudiantes");
                            %> 

                            <tbody>
                                <%
                                    for (Estudiante est : listaEstudiantes) {
                                        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                %> 
                                <tr>
                                    <td><%=est.getId()%></td>
                                    <td><%=est.getNombre() + " " + est.getApellido()%></td>
                                    <td><%=est.getDni()%></td>
                                    <%
                                        Date fecha = est.getFechaNacimiento();
                                        String fechaString = formatter.format(fecha);
                                    %> 
                                    <td><%=fechaString%></td>
                                    <td><%=est.getGrado()%></td>
                                    <td><%=est.getApoderado().getNombre() + " " + est.getApoderado().getApellido()%></td>
                                    <td><%=est.getApoderado().getDni()%></td>
                                    <%
                                        Date fechaApoderado = est.getApoderado().getFechaNacimiento();
                                        String fechaStringApoderado = formatter.format(fechaApoderado);
                                    %>
                                    <td><%=fechaStringApoderado%></td>
                                    <td><%=est.getApoderado().getParentesco()%></td>
                                    <td><%=est.getApoderado().getTelefono()%></td>
                                    <td style="display: flex; width: 230px;">
                                        <% if (usuario.getRol().equalsIgnoreCase("Administrador")) {%>
                                        <!-- Botón Eliminar -->
                                        <form name="eliminar" action="../SVEliminaEstudiante" method="POST"> <!-- esto es para mandar el código al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px;">
                                                <i class="fas fa-trash-alt"></i> Eliminar
                                            </button>
                                            <input type="hidden" name="id" value="<%= est.getId()%>"> <!-- esto es para mandar el código al servlet -->
                                        </form>
                                        <!-- Botón Editar -->
                                        <form name="editar" action="../SVEditarEstudiante" method="GET"> <!-- esto es para mandar el código al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px;">
                                                <i class="fas fa-pencil-alt"></i> Editar
                                            </button>
                                            <input type="hidden" name="id" value="<%= est.getId()%>"> <!-- esto es para mandar el código al servlet -->
                                        </form>
                                        <% } else { %>
                                        <!-- Mensaje de acceso restringido o botones desactivados -->
                                        <button type="button" class="btn btn-secondary btn-block" disabled style="margin-right: 5px;">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>
                                        <button type="button" class="btn btn-secondary btn-block" disabled style="margin-left: 5px;">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <% } %>
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