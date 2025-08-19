<?php
session_start();

    $idUsr = $_SESSION['idUsr'];
    $user = $_SESSION['username'];
    $nombre = $_SESSION['nombre'];
    $estatusCorte = $_SESSION['estatusCorte'];
	$tipo_usr = $_SESSION['tipo_usr'];

    if(empty($user) || empty($nombre)){
        echo "<script type=\"text/javascript\">location.href='prcd/sort.php';</script>";
    }
?>

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


    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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

        /* Nuevos estilos para el footer fijo */
        html, body {
            height: 100%;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1 0 auto; /* Ocupa el espacio disponible */
        }
        footer {
            flex-shrink: 0; /* Evita que el footer se encoja */
        }
    </style>
</head>
<body onload="datosTecnicosModalB();datosTecnicoCortes();">
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
                        <a class="nav-link" href="#"><i class="bi bi-calendar-x-fill"></i> Cortes</a>
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
                    <i class="bi bi-exclamation-triangle me-2"></i>Incidencias
                    </h5>
                    <div id="accordionCortes">
                        </div>
                    </div>
                    <!-- Segundo bloque de accordions -->
                    <div class="col-12 col-lg-6 mb-4">
                        <h5 class="mb-3">
                    <i class="bi bi-calendar-x-fill"></i> Cortes
                </h5>
                <div id="tecnicosCortes"></div>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/tecnicos.js"></script>
</body>
</html>

<!-- Modal Incidencias-->
<div class="modal fade" id="modalIncidencias" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Incidencias</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Cerrar ticket</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Cortes-->
<div class="modal fade" id="modalCortes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Cortes</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Cerrar ticket</button>
      </div>
    </div>
  </div>
</div>