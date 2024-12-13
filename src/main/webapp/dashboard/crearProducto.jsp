
<%@include file="componentesDashboard/header.jsp" %>

<%@include file="componentesDashboard/top.jsp" %>

<%@include file="componentesDashboard/barraNavegacion.jsp" %>

<div id="layoutSidenav_content" style="background-image: url(assetsDashboard/img/2.jpeg); background-repeat: no-repeat; background-size: cover" class="col-lg-auto">
        <main >
            <div class="container"  >
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-md-12 px-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5" style="background: transparent; backdrop-filter: blur(20px); border-radius: 10px; padding: 30px 40px; box-shadow: 0 0 10px rgba(0, 0, 0, .2);  border: 2px solid rgba(255, 255, 255, .2);">
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Registro de Inventario</h3></div>
                            
                            <div class="card-body">
                                <form action="../SVInventario" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3" >
                                            <div class="form-floating ">
                                                <input class="form-control" name="inputNombre" type="text" placeholder="Ingrese el nombre del objeto" required />
                                                <label for="inputNombre">Nombre del objeto</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputCodigo" type="number" placeholder="Ingrese el codigo patrimonial" required />
                                                <label for="inputCodigo">Codigo patrimonial</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3" >
                                            <div class="form-floating ">
                                                <input class="form-control" name="inputMarca" type="text" placeholder="Ingrese el nombre del objeto" required />
                                                <label for="inputMarca">Marca del objeto</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputModelo" type="text" placeholder="Ingrese el modelo" required />
                                                <label for="inputModelo">Modelo del objeto</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3" >
                                            <div class="form-floating ">
                                                <input class="form-control" name="inputFecha" type="date" placeholder="Ingrese la fecha de alta" min="1999-01-01" max="2050-12-31" required />
                                                <label for="inputFecha">Fecha de alta</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <select class="form-control" name="inputTipo" aria-label="Grado" required>
                                                    <option value="" disabled selected>Seleccione el Grado</option>
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
                                                <label for="inputTipo">Grado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6 mb-3">
                                            <div class="form-floating ">
                                                <select class="form-control" name="inputCentroCostos" aria-label="Centro de Costos" required>
                                                    <option value="" disabled selected>Seleccione el Centro de costos</option>
                                                    <option value="1653096 - 30064 - INICIAL">1653096 - 30064 - INICIAL</option>
                                                    <option value="0375188 - 30064 - PRIMARIA">0375188 - 30064 - PRIMARIA</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                                <label for="inputCentroCostos">Centro de Costos</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating ">
                                                <select class="form-control" name="inputUbicacion" aria-label="Ubicacion Fisica" required>
                                                    <option value="" disabled selected>Seleccione la ubicacion fisica</option>
                                                    <option value="INICIAL-30064">INICIAL-30064</option>
                                                    <option value="PRIMARIA-30064">PRIMARIA-30064</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                                <label for="inputUbicacion">Ubicacion Fisica</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating ">
                                                <input class="form-control" name="inputEstado" type="text" placeholder="Ingrese el estado del objeto" required />
                                                <label for="inputEstado">Estado</label>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                   
                                   
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" style="background: #1c1e21" type="submit">Registrar Objeto</button></div>
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
