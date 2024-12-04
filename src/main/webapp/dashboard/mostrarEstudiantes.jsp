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
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <h1>Lista de Estudiantes</h1>
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
                                        <td><%=est.getNombre() +" "+ est.getApellido()%></td>
                                        <td><%=est.getDni()%></td>
                                        <%
                                        Date fecha =est.getFechaNacimiento();
                                        String fechaString = formatter.format(fecha);
                                        %> 
                                        <td><%=fechaString%></td>
                                        <td><%=est.getGrado()%></td>
                                        <td><%=est.getApoderado().getNombre()+" "+ est.getApoderado().getApellido()%></td>
                                        <td><%=est.getApoderado().getDni()%></td>
                                        <%
                                        Date fechaApoderado =est.getApoderado().getFechaNacimiento();
                                        String fechaStringApoderado = formatter.format(fechaApoderado);
                                        %>
                                        <td><%=fechaStringApoderado%></td>
                                        <td><%=est.getApoderado().getParentesco()%></td>
                                        <td><%=est.getApoderado().getTelefono()%></td>
                                        <td style="display: flex; width: 230px;">
                                            <form name="eliminar" action="../SVEliminaEstudiante" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                                <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px;">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                                <input type="hidden" name="id" value="<%= est.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
                                            </form>
                                            <form name="editar" action="SVEditarUsuarios" method="GET"> <!-- esto es para mandar el codigo al servlet -->
                                                <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px;">
                                                    <i class="fas fa-pencil-alt"></i> Editar
                                                </button>
                                                <input type="hidden" name="id" value="<%= est.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
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