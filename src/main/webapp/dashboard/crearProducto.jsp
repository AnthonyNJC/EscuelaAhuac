
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
                            <div class="card-header" style="background: #1c1e21"><h3 class="text-center text-white font-weight-light my-4">Registro de Inventario</h3></div>
                            <div class="card-body">
                                <form action="../SVInventario" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6" >
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" name="inputNombre" type="text" placeholder="Ingrese el nombre del objeto" />
                                                <label for="inputNombre">Nombre del objeto</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input class="form-control" name="inputCantidad" type="number" placeholder="Ingrese la cantidad" />
                                                <label for="inputCantidad">Cantidad (Solo digite Numeros)</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                   
                                   
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" style="background: #1c1e21" type="submit">Registrar Bien</button></div>
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