    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Administración
                        </a>
                        
                        <div class="sb-sidenav-menu-heading">Vista</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Usuarios
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="mostrarUsuarios.jsp">Mostrar Usuarios</a>
                                <a class="nav-link" href="crearUsuarios.jsp">Crear Usuarios</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMaestroLayouts" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            Maestros
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseMaestroLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="mostrarMaestros.jsp">Mostrar Maestros</a>
                                <a class="nav-link" href="crearMaestros.jsp">Crear Maestros</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEstudianteLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Estudiantes
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEstudianteLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.jsp">Mostrar Estudiantes</a>
                                <a class="nav-link" href="layout-sidenav-light.jsp">Matricula</a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">Inventario</div>
                        <a class="nav-link" href="charts.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            Crear Productos
                        </a>
                        <a class="nav-link" href="tables.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Mostrar Productos
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>