<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConectWi</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        @media (min-width: 992px) {
            .navbar-nav-centered {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }
        }
        /* Color para los accordions cerrados */
        .accordion-button.collapsed {
            background-color: #031633 !important;
            color: #fff !important;
        }
        .accordion-button:not(.collapsed) {
            color: #031633;
        }
        /* Navbar personalizado */
        .navbar-custom {
            background-color: #212529 !important;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link,
        .navbar-custom .btn,
        .navbar-custom .navbar-toggler {
            color: #f8f9fa !important;
        }
        .navbar-custom .nav-link.active,
        .navbar-custom .nav-link:focus,
        .navbar-custom .nav-link:hover {
            color: #0d6efd !important;
        }
        .navbar-custom .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        .navbar-custom .navbar-toggler {
            border-color: #f8f9fa;
        }
        .navbar-custom .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28248,249,250, 1%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
    </style>
</head>
<body>
    <!-- Navbar responsive con logo, links centrados y botón a la derecha -->
    <nav class="navbar navbar-expand-lg navbar-custom position-relative">
        <div class="container position-relative">
            <!-- Logo a la izquierda -->
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo-shadow.png" alt="Logo" width="32" height="32" class="d-inline-block align-text-top me-2">
                ConectWi
            </a>
            <!-- Botón hamburguesa para móviles -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCentered" aria-controls="navbarCentered" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Links centrados y botón derecho -->
            <div class="collapse navbar-collapse" id="navbarCentered">
                <ul class="navbar-nav navbar-nav-centered mx-lg-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-exclamation-triangle me-1"></i>Incidencias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-scissors me-1"></i>Cortes</a>
                    </li>
                </ul>
                <div class="d-flex ms-lg-auto justify-content-lg-end justify-content-center mt-3 mt-lg-0">
                    <a href="#" class="btn btn-primary">Dashboard</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <!-- Primer bloque de accordions -->
        <div class="row">
            <div class="col-12 col-lg-6 mb-4">
                <h5 class="mb-3">
                    <i class="bi bi-scissors me-2"></i>Cortes
                </h5>
                <div class="accordion" id="accordionCortes">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingC1">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseC1" aria-expanded="false" aria-controls="collapseC1">
                                Juan Pérez
                            </button>
                        </h2>
                        <div id="collapseC1" class="accordion-collapse collapse" aria-labelledby="headingC1" data-bs-parent="#accordionCortes">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-1234<br>
                                <strong>Email:</strong> juan.perez@email.com<br>
                                <strong>Dirección:</strong> Calle Norte 123
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingC2">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseC2" aria-expanded="false" aria-controls="collapseC2">
                                María López
                            </button>
                        </h2>
                        <div id="collapseC2" class="accordion-collapse collapse" aria-labelledby="headingC2" data-bs-parent="#accordionCortes">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-5678<br>
                                <strong>Email:</strong> maria.lopez@email.com<br>
                                <strong>Dirección:</strong> Calle Norte 456
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingC3">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseC3" aria-expanded="false" aria-controls="collapseC3">
                                Carlos Ramírez
                            </button>
                        </h2>
                        <div id="collapseC3" class="accordion-collapse collapse" aria-labelledby="headingC3" data-bs-parent="#accordionCortes">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-9012<br>
                                <strong>Email:</strong> carlos.ramirez@email.com<br>
                                <strong>Dirección:</strong> Calle Norte 789
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingC4">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseC4" aria-expanded="false" aria-controls="collapseC4">
                                Ana Torres
                            </button>
                        </h2>
                        <div id="collapseC4" class="accordion-collapse collapse" aria-labelledby="headingC4" data-bs-parent="#accordionCortes">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-3456<br>
                                <strong>Email:</strong> ana.torres@email.com<br>
                                <strong>Dirección:</strong> Calle Norte 321
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingC5">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseC5" aria-expanded="false" aria-controls="collapseC5">
                                Luis Gómez
                            </button>
                        </h2>
                        <div id="collapseC5" class="accordion-collapse collapse" aria-labelledby="headingC5" data-bs-parent="#accordionCortes">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-7890<br>
                                <strong>Email:</strong> luis.gomez@email.com<br>
                                <strong>Dirección:</strong> Calle Norte 654
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Segundo bloque de accordions -->
            <div class="col-12 col-lg-6 mb-4">
                <h5 class="mb-3">
                    <i class="bi bi-exclamation-triangle me-2"></i>Incidencias
                </h5>
                <div class="accordion" id="accordionIncidencias">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingI1">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI1" aria-expanded="false" aria-controls="collapseI1">
                                Pedro Sánchez
                            </button>
                        </h2>
                        <div id="collapseI1" class="accordion-collapse collapse" aria-labelledby="headingI1" data-bs-parent="#accordionIncidencias">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-1122<br>
                                <strong>Email:</strong> pedro.sanchez@email.com<br>
                                <strong>Dirección:</strong> Calle Sur 123
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingI2">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI2" aria-expanded="false" aria-controls="collapseI2">
                                Laura Fernández
                            </button>
                        </h2>
                        <div id="collapseI2" class="accordion-collapse collapse" aria-labelledby="headingI2" data-bs-parent="#accordionIncidencias">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-3344<br>
                                <strong>Email:</strong> laura.fernandez@email.com<br>
                                <strong>Dirección:</strong> Calle Sur 456
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingI3">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI3" aria-expanded="false" aria-controls="collapseI3">
                                Diego Castro
                            </button>
                        </h2>
                        <div id="collapseI3" class="accordion-collapse collapse" aria-labelledby="headingI3" data-bs-parent="#accordionIncidencias">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-5566<br>
                                <strong>Email:</strong> diego.castro@email.com<br>
                                <strong>Dirección:</strong> Calle Sur 789
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingI4">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI4" aria-expanded="false" aria-controls="collapseI4">
                                Sofía Morales
                            </button>
                        </h2>
                        <div id="collapseI4" class="accordion-collapse collapse" aria-labelledby="headingI4" data-bs-parent="#accordionIncidencias">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-7788<br>
                                <strong>Email:</strong> sofia.morales@email.com<br>
                                <strong>Dirección:</strong> Calle Sur 321
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingI5">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseI5" aria-expanded="false" aria-controls="collapseI5">
                                Andrés Ruiz
                            </button>
                        </h2>
                        <div id="collapseI5" class="accordion-collapse collapse" aria-labelledby="headingI5" data-bs-parent="#accordionIncidencias">
                            <div class="accordion-body">
                                <strong>Teléfono:</strong> 555-9900<br>
                                <strong>Email:</strong> andres.ruiz@email.com<br>
                                <strong>Dirección:</strong> Calle Sur 654
                            </div>
                            <div class="accordion-footer text-end p-3">
                                <button class="btn btn-danger">Corte</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer elegante -->
    <footer class="bg-dark text-light py-4 mt-auto">
        <div class="container text-center">
            <span>&copy; 2025 ConectWi. Todos los derechos reservados.</span>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>