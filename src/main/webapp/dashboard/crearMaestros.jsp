
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
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Datos del Maestros</h3></div>
                            <div class="card-body">
                                <form action="../SVDocente" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputNombre" type="text" placeholder="Ingrese sus nombres" />
                                                <label for="inputNombre">Nombres</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputApellido" type="text" placeholder="Ingrese sus apellidos" />
                                                <label for="inputApellido">Apellidos</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputDNI" type="text" placeholder="Ingrese su DNI" />
                                                <label for="inputDNI">DNI</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputNacimiento" type="date" placeholder="Ingrese su fecha de nacimiento" min="1900-01-01" max="2200-12-31" />
                                                <label for="inputNacimiento">fecha de Nacimiento</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputTelefono" type="tel" placeholder="Ingrese su Telefono" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" />
                                                <label for="inputTelefono">Teléfono/celular</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card card-header col-lg-10" style="background: #1c1e21">
                                        <h3 class="text-center text-white font-weight-light my-4">Registro de Usuario</h3>
                                    </div>
                                    <hr>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" name="inputRol" aria-label="Rol">
                                                    <option value="" disabled selected>Seleccione el Rol que tendra el usuario</option>
                                                    <option value="Administrador">Administrador</option>
                                                    <option value="Administrativo">No-Administrador</option>
                                                </select>
                                                <label for="inputRol">Rol</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputUsuario" type="text" placeholder="cree su usuario" />
                                                <label for="inputUsuario">Usuario</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputPassword" type="password" placeholder="Crea una contraseña" />
                                                <label for="inputPassword">Contraseña</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                <label for="inputPasswordConfirm">Confirma tu Contraseña</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" style="background: #1c1e21" type="submit">Registrar</button></div>
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

