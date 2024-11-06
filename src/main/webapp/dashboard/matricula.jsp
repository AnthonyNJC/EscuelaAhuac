
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
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Datos del Estudiante</h3></div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputNombreEstudiante" type="text" placeholder="Ingrese sus nombres" />
                                                <label for="inputNombre">Nombres del estudiante</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputApellidoEstudiante" type="text" placeholder="Ingrese sus apellidos" />
                                                <label for="inputApellido">Apellidos del estudiante</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputDNIEstudiante" type="text" placeholder="Ingrese su DNI" />
                                                <label for="inputDNI">DNI del estudiante</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputNacimientoEstudiante" type="date" placeholder="Ingrese su fecha de nacimiento" />
                                                <label for="inputNacimiento">fecha de Nacimiento del estudiante</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" id="inputGrado" aria-label="Grado">
                                                    <option value="" disabled selected>Seleccione su Grado</option>
                                                    <option value="Inicial">Inicial</option>
                                                    <option value="1° grado">1° grado</option>
                                                    <option value="2° grado">2° grado</option>
                                                    <option value="3° grado">3° grado</option>
                                                    <option value="4° grado">4° grado</option>
                                                    <option value="5° grado">5° grado</option>
                                                    <option value="6° grado">6° grado</option>
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
                                        <h3 class="text-center text-white font-weight-light my-4">Registro del apoderado</h3>
                                    </div>
                                    <hr>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputNombreApoderado" type="text" placeholder="Ingrese sus nombres" />
                                                <label for="inputNombre">Nombres del apoderado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputApellidoApoderado" type="text" placeholder="Ingrese sus apellidos" />
                                                <label for="inputApellido">Apellidosdel apoderado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputDNIApoderado" type="text" placeholder="Ingrese su DNI" />
                                                <label for="inputDNI">DNI del apoderado</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputNacimientoApoderado" type="date" placeholder="Ingrese su fecha de nacimiento" />
                                                <label for="inputNacimiento">fecha de Nacimiento del apoderado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputParentesco" type="text" placeholder="Ingrese su parentesco" />
                                                <label for="inputGrado">Parentesco con el estudiante</label>
                                            </div>
                                        </div>  
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputTelefono" type="tel" placeholder="Ingrese su Telefono" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" />
                                                <label for="inputTelefono">telefono/celular</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="login.html">Registrar Matricula</a></div>
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

