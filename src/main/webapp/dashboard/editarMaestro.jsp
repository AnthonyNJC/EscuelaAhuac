
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Docente"%>
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>

<div id="layoutSidenav_content" style="background-image: url(assetsDashboard/img/2.jpeg); background-repeat: no-repeat; background-size: cover" class="col-lg-auto">
    <div id="layoutSidenav_content">
        <main >
            <div class="container"  >
                <div class="row justify-content-between">
                    <div class="col-lg-10 container-fluid px-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5" style="background: transparent; backdrop-filter: blur(20px); border-radius: 10px; padding: 30px 40px; box-shadow: 0 0 10px rgba(0, 0, 0, .2);  border: 2px solid rgba(255, 255, 255, .2);">
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Modificar Datos del Maestros</h3></div>
                            <div class="card-body">
                                <%
                                    Docente docente = (Docente) request.getSession().getAttribute("maestro");
                                %>
                                <form action="../SVEditarMaestro" method="POST" id="formulario">
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputNombre" type="text" value="<%= docente.getNombre()%>" />
                                                <label for="inputNombre">Nombres</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputApellido" type="text" value="<%= docente.getApellido()%>" />
                                                <label for="inputApellido">Apellidos</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputDNI" type="text" value="<%= docente.getDni()%>" />
                                                <label for="inputDNI">DNI</label>
                                            </div>
                                        </div>
                                        <%
                                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                            Date fechaDocente = docente.getFechaNacimiento();
                                            String fecha = formatter.format(fechaDocente);
                                        %>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputNacimiento" type="date"  min="1900-01-01" max="2200-12-31" value="<%= fecha %>"/>
                                                <label for="inputNacimiento">fecha de Nacimiento</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputTelefono" type="tel" value="<%= docente.getTelefono()%>" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" />
                                                <label for="inputTelefono">Teléfono/celular</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card card-header col-lg-12" style="background: #1c1e21">
                                        <h3 class="text-center text-white font-weight-light my-4">Datos del Usuario</h3>
                                    </div>
                                    <hr>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" name="inputRol" aria-label="Rol" >
                                                    <option value="Administrador" <%= "Administrador".equals(docente.getUsuario().getRol()) ? "selected" : "" %>>Administrador</option>
                                                    <option value="No-Administrador" <%= "No-Administrador".equals(docente.getUsuario().getRol()) ? "selected" : "" %>>No-Administrador</option>
                                                </select>
                                                <label for="inputRol">Rol</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputUsuario" type="text" value="<%= docente.getUsuario().getNombreUsuario() %>" />
                                                <label for="inputUsuario">Usuario</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputPassword" id="inputPassword" type="password" value="<%= docente.getUsuario().getContrasenia() %>" />
                                                <label for="inputPassword">Contraseña</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputPasswordConfirm" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                <label for="inputPasswordConfirm">Confirma tu Contraseña</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0 row">
                                        <div class="d-grid col-md-6"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="mostrarMaestros.jsp">Regresar</a></div>
                                        <div class="d-grid col-md-6"><button class="btn btn-primary btn-block" style="background: #1c1e21" type="submit">Guardar Cambios</button></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>


    <%@include file="componentesDashboard/footer.jsp" %>