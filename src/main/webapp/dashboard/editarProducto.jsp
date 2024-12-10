
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Inventario"%>
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
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Modificar Registro de Inventario</h3></div>
                            <div class="card-body">
                                <%
                                    Inventario producto = (Inventario) request.getSession().getAttribute("producto");
                                %>
                                <form action="../SVEditarProducto" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputNombre" type="text" value="<%= producto.getNombreBien()%>" required />
                                                <label for="inputNombre">Nombre del objeto</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputCodigo" type="number" value="<%= producto.getCodigo()%>" required />
                                                <label for="inputCodigo">Codigo patrimonial</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputMarca" type="text" value="<%= producto.getMarca()%>" required />
                                                <label for="inputMarca">Marca del objeto</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputModelo" type="text" value="<%= producto.getModelo()%>" required />
                                                <label for="inputModelo">Modelo del objeto</label>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                        String fecha = formatter.format(producto.getFechaAlta());
                                    %>
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputFecha" type="date" value="<%= fecha%>" min="1999-01-01" max="2050-12-31" required />
                                                <label for="inputFecha">Fecha de alta</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" name="inputTipo" aria-label="Grado" required>
                                                    <option value="3 años" <%= "3 años".equals(producto.getTipoIngreso()) ? "selected" : ""%>>3 años</option>
                                                    <option value="4 años 'A'" <%= "4 años 'A'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>4 años 'A'</option>
                                                    <option value="4 años 'B'" <%= "4 años 'B'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>4 años 'B'</option>
                                                    <option value="5 años 'A'" <%= "5 años 'A'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>5 años 'A'</option>
                                                    <option value="5 años 'B'" <%= "5 años 'B'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>5 años 'B'</option>
                                                    <option value="1° 'U'" <%= "1° 'U'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>1° 'U'</option>
                                                    <option value="2° 'A'" <%= "2° 'A'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>2° 'A'</option>
                                                    <option value="2° 'B'" <%= "2° 'B'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>2° 'B'</option>
                                                    <option value="3° 'U'" <%= "3° 'U'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>3° 'U'</option>
                                                    <option value="4° 'A'" <%= "4° 'A'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>4° 'A'</option>
                                                    <option value="4° 'B'" <%= "4° 'B'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>4° 'B'</option>
                                                    <option value="5° 'U'" <%= "5° 'U'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>5° 'U'</option>
                                                    <option value="6° 'A'" <%= "6° 'A'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>6° 'A'</option>
                                                    <option value="6° 'B'" <%= "6° 'B'".equals(producto.getTipoIngreso()) ? "selected" : ""%>>6° 'B'</option>
                                                </select>
                                                <label for="inputTipo">Grado</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" name="inputCentroCostos" aria-label="Centro de Costos" required>
                                                    <option value="1653096 - 30064 - INICIAL" <%= "1653096 - 30064 - INICIAL".equals(producto.getCentroCosto()) ? "selected" : ""%>>1653096 - 30064 - INICIAL</option>
                                                    <option value="0375188 - 30064 - PRIMARIA" <%= "0375188 - 30064 - PRIMARIA".equals(producto.getCentroCosto()) ? "selected" : ""%>>0375188 - 30064 - PRIMARIA</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                                <label for="inputCentroCostos">Centro de Costos</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <select class="form-control" name="inputUbicacion" aria-label="Ubicacion Fisica" required>
                                                    <option value="INICIAL-30064" <%= "INICIAL-30064".equals(producto.getUbicacionFisica()) ? "selected" : ""%>>INICIAL-30064</option>
                                                    <option value="PRIMARIA-30064" <%= "PRIMARIA-30064".equals(producto.getUbicacionFisica()) ? "selected" : ""%>>PRIMARIA-30064</option>
                                                    <!-- Agrega más opciones según sea necesario -->
                                                </select>
                                                <label for="inputUbicacion">Ubicacion Fisica</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-12" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputEstado" type="text" value="<%= producto.getEstado()%>" required />
                                                <label for="inputEstado">Estado</label>
                                            </div>
                                        </div>

                                    </div>



                                    <div class="mt-4 mb-0 row">
                                        <div class="d-grid col-md-6"><a class="btn btn-primary btn-block" style="background: #1c1e21" href="mostrarInventario.jsp">Regresar</a></div>
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