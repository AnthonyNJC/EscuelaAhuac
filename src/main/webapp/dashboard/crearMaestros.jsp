<!--<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="cssDashboard/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>-->
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>

<div id="layoutSidenav_content" style="background-image: url(assetsDashboard/img/2.jpeg); background-repeat: no-repeat; background-size: cover; width: 100%;" class="col-lg-auto">
    <div id="layoutSidenav_content" style="width: 100%">
        <main >
            <div class="container"  >
                <div style="padding: 20px 0 0 30px">
                    <h1 style="color: #000000; -webkit-text-stroke: 1px #FFFFFF; font-weight: bold">Registro de Maestros</h1>
                    <p style="font-size:20px; color: #FFFFFF; -webkit-text-stroke: .8px #000000; font-weight: bold">Este apartado es para registrar maestros con sus respectivas cuentas de usuario.</p> 
                </div>
                <div class="row justify-content-between">
                    <div class="col-lg-10">
                        <div class="card shadow-lg border-0 rounded-lg mt-5" style="background: transparent; backdrop-filter: blur(20px); border-radius: 10px; padding: 30px 40px; box-shadow: 0 0 10px rgba(0, 0, 0, .2);  border: 2px solid rgba(255, 255, 255, .2);">
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Datos del Maestros</h3></div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputNombre" type="text" placeholder="Ingrese sus nombres" />
                                                <label for="inputNombre">Nombres</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputApellido" type="text" placeholder="Ingrese sus apellidos" />
                                                <label for="inputApellido">Apellidos</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputDNI" type="text" placeholder="Ingrese su DNI" />
                                                <label for="inputDNI">DNI</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" id="inputNacimiento" type="date" placeholder="Ingrese su fecha de nacimiento" />
                                                <label for="inputNacimiento">fecha de Nacimiento</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputTelefono" type="tel" placeholder="Ingrese su Telefono" pattern="[0-9]{9}" title="Debe ingresar un número de 9 dígitos" />
                                                <label for="inputTelefono">Teléfono/celular</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputGrado" type="text" placeholder="Ingrese su Grado" />
                                                <label for="inputGrado">Grado a cargo</label>
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
                                                <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" />
                                                <label for="inputEmail">Direccion de Correo</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputUsuario" type="password" placeholder="cree su usuario" />
                                                <label for="inputUsuario">Usuario</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputPassword" type="password" placeholder="Crea una contraseña" />
                                                <label for="inputPassword">Contraseña</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                <label for="inputPasswordConfirm">Confirma tu Contraseña</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="login.html">Crear Cuenta</a></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script> 

<link rel="stylesheet" href="cssDashboard/estiloFondo.css}"/>

<%@include file="componentesDashboard/footer.jsp" %>

