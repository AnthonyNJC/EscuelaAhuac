<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Estudiante"%>
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>

<div id="layoutSidenav_content" style="background-image: url(assetsDashboard/img/2.jpeg); background-repeat: no-repeat; background-size: cover" class="col-lg-auto">
        <main >
            <div class="container"  >
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-md-12 px-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5" style="background: transparent; backdrop-filter: blur(20px); border-radius: 10px; padding: 30px 40px; box-shadow: 0 0 10px rgba(0, 0, 0, .2);  border: 2px solid rgba(255, 255, 255, .2);">
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Edición de Datos del Estudiante</h3></div>
                            <div class="card-body">

                                <% Estudiante estudiante1 = (Estudiante) request.getSession().getAttribute("estudiante1");%>

                                <form action="../SVEditarEstudiante" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3" >
                                            <div class="form-floating ">
                                                <input class="form-control" name="inputNombreEstudiante" type="text" value="<%= estudiante1.getNombre()%>" />
                                                <label for="inputNombreEstudiante">Nombres del estudiante</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputApellidoEstudiante" type="text" value="<%= estudiante1.getApellido()%>" />
                                                <label for="inputApellidoEstudiante">Apellidos del estudiante</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputDNIEstudiante" type="text" value="<%= estudiante1.getDni()%>" />
                                                <label for="inputDNIEstudiante">DNI del estudiante</label>
                                            </div>
                                        </div>
                                        <% SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                            String fechaFormateadaEstudiante = formatter.format(estudiante1.getFechaNacimiento());
                                            String fechaFormateadaApoderado = formatter.format(estudiante1.getApoderado().getFechaNacimiento());
                                        %>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputNacimientoEstudiante" type="date" min="1900-01-01" max="2200-12-31" value="<%= fechaFormateadaEstudiante%>" />
                                                <label for="inputNacimientoEstudiante">fecha de Nacimiento del estudiante</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <select class="form-control" name="inputGrado" aria-label="Grado">
                                                    <option value="3 años" <%= "3 años".equals(estudiante1.getGrado()) ? "selected" : ""%>>3 años</option>
                                                    <option value="4 años 'A'" <%= "4 años 'A'".equals(estudiante1.getGrado()) ? "selected" : ""%>>4 años 'A'</option>
                                                    <option value="4 años 'B'" <%= "4 años 'B'".equals(estudiante1.getGrado()) ? "selected" : ""%>>4 años 'B'</option>
                                                    <option value="5 años 'A'" <%= "5 años 'A'".equals(estudiante1.getGrado()) ? "selected" : ""%>>5 años 'A'</option>
                                                    <option value="5 años 'B'" <%= "5 años 'B'".equals(estudiante1.getGrado()) ? "selected" : ""%>>5 años 'B'</option>
                                                    <option value="1° 'U'" <%= "1° 'U'".equals(estudiante1.getGrado()) ? "selected" : ""%>>1° 'U'</option>
                                                    <option value="2° 'A'" <%= "2° 'A'".equals(estudiante1.getGrado()) ? "selected" : ""%>>2° 'A'</option>
                                                    <option value="2° 'B'" <%= "2° 'B'".equals(estudiante1.getGrado()) ? "selected" : ""%>>2° 'B'</option>
                                                    <option value="3° 'U'" <%= "3° 'U'".equals(estudiante1.getGrado()) ? "selected" : ""%>>3° 'U'</option>
                                                    <option value="4° 'A'" <%= "4° 'A'".equals(estudiante1.getGrado()) ? "selected" : ""%>>4° 'A'</option>
                                                    <option value="4° 'B'" <%= "4° 'B'".equals(estudiante1.getGrado()) ? "selected" : ""%>>4° 'B'</option>
                                                    <option value="5° 'U'" <%= "5° 'U'".equals(estudiante1.getGrado()) ? "selected" : ""%>>5° 'U'</option>
                                                    <option value="6° 'A'" <%= "6° 'A'".equals(estudiante1.getGrado()) ? "selected" : ""%>>6° 'A'</option>
                                                    <option value="6° 'B'" <%= "6° 'B'".equals(estudiante1.getGrado()) ? "selected" : ""%>>6° 'B'</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                                <label for="inputGrado">Grado</label>
                                            </div>

                                        </div>
                                        <!-- <div class="col-md-6">
                                             <div class="form-floating mb-3 mb-md-0">
                                                 <input class="form-control" id="inputTelefono" type="tel" placeholder="Ingrese su Telefono" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" />
                                                 <label for="inputTelefono">telefono/celular</label>
                                             </div>
                                         </div>-->
                                    </div>
                                    <div class="card card-header col-lg-12" style="background: #1c1e21">
                                        <h3 class="text-center text-white font-weight-light my-4">Edicion de Datos del Apoderado</h3>
                                    </div>
                                    <hr>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3" >
                                            <div class="form-floating">
                                                <input class="form-control" name="inputNombreApoderado" type="text" value="<%= estudiante1.getApoderado().getNombre()%>" />
                                                <label for="inputNombreApoderado">Nombres del apoderado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputApellidoApoderado" type="text" value="<%= estudiante1.getApoderado().getApellido()%>" />
                                                <label for="inputApellidoApoderado">Apellidosdel apoderado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputDNIApoderado" type="text" value="<%= estudiante1.getApoderado().getDni()%>" />
                                                <label for="inputDNIApoderado">DNI del apoderado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputNacimientoApoderado" type="date" value="<%= fechaFormateadaApoderado%>" />
                                                <label for="inputNacimientoApoderado">fecha de Nacimiento del apoderado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputParentesco" type="text" value="<%= estudiante1.getApoderado().getParentesco()%>" />
                                                <label for="inputParentesco">Parentesco con el estudiante</label>
                                            </div>
                                        </div>  
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputTelefono" type="tel" placeholder="Ingrese su Telefono" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" value="<%= estudiante1.getApoderado().getTelefono()%>" />
                                                <label for="inputTelefono">telefono/celular</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-3 row">
                                        <div class="d-grid mb-3 col-md-6"><a class="btn btn-primary btn-block " style="background: #1c1e21" href="mostrarEstudiantes.jsp">Regresar</a></div>
                                        <div class="d-grid mb-3 col-md-6"><button class="btn btn-primary btn-block " style="background: #1c1e21" type="submit">Guardar Cambios</button></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    <%@include file="componentesDashboard/footer.jsp" %>
    </div>


