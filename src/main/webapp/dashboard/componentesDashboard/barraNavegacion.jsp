    <%@page import="Logica.Usuario"%>
<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Inicio
                        </a>
                        
                        <div class="sb-sidenav-menu-heading">Vista</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Usuarios
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../SVUsuarios">Mostrar Usuarios</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMaestroLayouts" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            Maestros
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseMaestroLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../SVDocente">Mostrar Maestros</a>
                                <a class="nav-link" href="crearMaestros.jsp">Crear Maestros</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstudianteLayouts" aria-expanded="false" aria-controls="collapseLayouts" disabled>
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Estudiantes
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEstudianteLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../SVEstudiante">Mostrar Estudiantes</a>
                                <a class="nav-link" href="matricula.jsp">Matricula</a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">Inventario</div>
                        <a class="nav-link" href="crearProducto.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Registrar Producto
                        </a>
                        <a class="nav-link" href="../SVInventario">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Mostrar Productos
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Sesion de usuario como:</div>
                    <%
                        Usuario user= (Usuario) request.getSession().getAttribute("usuarioLogeado");
                        
                    %>
                    <%= user.getNombreUsuario() %>
                </div>
            </nav>
        </div>