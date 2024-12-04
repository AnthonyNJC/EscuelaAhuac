
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
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Id_Usuario</th>
                                    <th>Nombre de Usuario</th>
                                    <th>Rol</th>
                                    <th>Propietario</th>
                                    <th style="width: 210px">Acción</th>
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
                                    <td><%=usu.getDocente().getNombre()%></td>
                                    <td style="display: flex; width: 230px;">
                                        <%-- <form name="eliminar" action="SVEliminarUsuarios" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px;">
                                                <i class="fas fa-trash-alt"></i> Eliminar
                                            </button>
                                            <input type="hidden" name="id" value="<%= usu.getIdUsuario()%>"> <!-- esto es para mandar el codigo al servlet -->
                                        </form> --%>
                                        <form name="editar" action="SVEditarUsuarios" method="GET"> <!-- esto es para mandar el codigo al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-left: 5px;">
                                                <i class="fas fa-pencil-alt"></i> Editar
                                            </button>
                                            <input type="hidden" name="id" value="<%= usu.getIdUsuario()%>"> <!-- esto es para mandar el codigo al servlet -->
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


