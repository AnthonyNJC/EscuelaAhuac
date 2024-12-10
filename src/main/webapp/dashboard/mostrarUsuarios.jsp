
<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>

<div id="layoutSidenav_content">
    <main>
        <div class="container card mb-0">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <h1>Lista de Usuarios</h1>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Usuarios</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Id_Usuario</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Rol</th>
                                    <th>Propietario</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Id_Usuario</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Rol</th>
                                    <th>Propietario</th>
                                </tr>
                            </tfoot>
                              <%
                                 List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                              %> 
                            
                            <tbody>
                                 <%
                                    for (Usuario usu : listaUsuarios) {
                                %> 
                                <tr>
                                    <td><%=usu.getIdUsuario()%></td>
                                    <td><%=usu.getNombreUsuario()%></td>
                                    <td><%=usu.getRol()%></td>
                                    <td><%=usu.getDocente().getNombre() + " " + usu.getDocente().getApellido()  %></td>
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


