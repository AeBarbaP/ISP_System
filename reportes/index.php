<?php
session_start();


if (isset($_SESSION['perfil'])){
    echo "
        <script type=\"text/javascript>
            alert('Acceso correcto');
        </script>
        ;
    ";
}
else {
    echo "
        <script type=\"text/javascript>
            alert('Acceso denegado');
            window.location.href='login.html';
        </script>
        ;
    ";
}

?>

<!doctype html>

<html lang="es" data-bs-theme="auto">
    <head>
        <script src="assets/js/color-modes.js"></script>
        <link rel="icon" type="image/png" href="assets/img/inclusion.ico"/>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.122.0">
        <title>Dashboard SUIDEV · Inc v1.2</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/navbars-offcanvas/">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

        <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/dist/css/timeline.css" rel="stylesheet">

        <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- js de gráficos -->
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script> -->
        
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- js de carga -->
        <script src="assets/js/query_onload.js"></script>
        <script src="assets/js/userUpdate.js"></script>
        <script src="assets/js/agregarUser.js"></script>
        <script src="assets/js/reportes.js"></script>
        <script src="assets/js/gestionUsers.js"></script>

        <!-- js jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

        
        
        <style>
            * {
                font-family: 'Comfortaa', sans-serif;
            }
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .b-example-divider {
                width: 100%;
                height: 3rem;
                background-color: rgba(0, 0, 0, .1);
                border: solid rgba(0, 0, 0, .15);
                border-width: 1px 0;
                box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            }

            .b-example-vr {
                flex-shrink: 0;
                width: 1.5rem;
                height: 100vh;
            }

            .bi {
                vertical-align: -.125em;
                fill: currentColor;
            }

            .nav-scroller {
                position: relative;
                z-index: 2;
                height: 2.75rem;
                overflow-y: hidden;
            }

            .nav-scroller .nav {
                display: flex;
                flex-wrap: nowrap;
                padding-bottom: 1rem;
                margin-top: -1px;
                overflow-x: auto;
                text-align: center;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }

            .btn-bd-primary {
                /* --bd-violet-bg: #712cf9; */
                --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

                --bs-btn-font-weight: 600;
                /* --bs-btn-color: var(--bs-white);
                --bs-btn-bg: var(--bd-violet-bg); */
                /* --bs-btn-border-color: var(--bd-violet-bg); */
                /* --bs-btn-hover-color: var(--bs-white); */
                /* --bs-btn-hover-bg: #6528e0;
                --bs-btn-hover-border-color: #6528e0;
                --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb); */
                --bs-btn-active-color: var(--bs-btn-hover-color);
                /* --bs-btn-active-bg: #5a23c8;
                --bs-btn-active-border-color: #5a23c8; */
            }

            .bd-mode-toggle {
                z-index: 1500;
            }

            .bd-mode-toggle .dropdown-menu .active .bi {
                display: block !important;
            }

            .form-switch .form-check-input:focus {
                border-color: rgba(0, 0, 0, 0.25);
                outline: 0;
                box-shadow: 0 0 0 0 rgba(0, 0, 0, 0);
            }
            .form-switch .form-check-input:checked {
                background-color: #30D158;
                border-color: #30D158;
                border: none;
            }
            .form-switch .form-check-input {
                background-color: #d13030;
                border-color: #d13030;
                border: none;
                background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='rgba(255,255,255,1.0)'/></svg>");
            }
            

        </style>

        <!-- Custom styles for this template -->
        <link href="navbars-offcanvas.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body class="bg-body-secondary" onload="usuariosQueryLogs(); usuariosQuery(); conteoGeneral(); conteoGeneralCards()">
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <symbol id="check2" viewBox="0 0 16 16">
                <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
            </symbol>
            <symbol id="circle-half" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
            </symbol>
            <symbol id="moon-stars-fill" viewBox="0 0 16 16">
                <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
                <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
            </symbol>
            <symbol id="sun-fill" viewBox="0 0 16 16">
                <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
            </symbol>
            <symbol id="menu" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
            </symbol>
            <symbol id="ojoCerrado" viewBox="0 0 256 256">
                <path d="M230.8877,162.8125a7.99959,7.99959,0,1,1-13.85547,8L198.6499,138.97412a123.56028,123.56028,0,0,1-35.28808,16.27832l5.813,32.96436a8.00173,8.00173,0,0,1-6.48925,9.26855,8.13106,8.13106,0,0,1-1.39942.12207,8.00278,8.00278,0,0,1-7.86914-6.61133l-5.71826-32.42724a136.26072,136.26072,0,0,1-39.4873-.01367l-5.71729,32.42724a8.00272,8.00272,0,0,1-7.86914,6.61231,8.12,8.12,0,0,1-1.39844-.12207,8.00124,8.00124,0,0,1-6.49023-9.26758l5.81445-32.978A123.57956,123.57956,0,0,1,57.3064,138.94531l-18.49,32.02539a7.99959,7.99959,0,1,1-13.85547-8l19.49731-33.77a147.761,147.761,0,0,1-18.68188-19.29834A7.99972,7.99972,0,1,1,38.22168,99.84766a128.70627,128.70627,0,0,0,21.24561,20.92285c.06274.04492.12011.09424.18115.14062A109.59068,109.59068,0,0,0,128,144a109.58952,109.58952,0,0,0,68.3374-23.07861c.05225-.03955.10156-.08155.15528-.11963a128.72532,128.72532,0,0,0,21.28466-20.9541,7.99973,7.99973,0,0,1,12.44532,10.05468,147.78919,147.78919,0,0,1-18.72144,19.333Z"/>
            </symbol>
        </svg>

        <nav class="navbar bg-light" aria-label="Light offcanvas navbar">
            <div class="container-fluid">
                <a data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbarLight" aria-controls="offcanvasNavbarLight" aria-label="Toggle navigation">
                    <svg class="bi me-2 mt-1 " width="1.5em" height="1.5em"><use href="#menu"></use></svg>
                </a>
                <div class="dropdown ms-2">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="assets/img/avatar.jpg" alt="" width="35" height="35" class="rounded-circle me-2">
                    </a>
                    <ul class="dropdown-menu dropdown-menu text-small shadow text-end">
                        <li><a class="dropdown-item" href="#">Editar mi perfil <i class="bi bi-gear ms-2" style="font-size: 25px;"></i></a></li>
                        <!-- <li><a class="dropdown-item" href="#">Profile</a></li> -->
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Cerrar Sesión <i class="bi bi-box-arrow-in-right ms-2" style="font-size: 25px;"></i></a></li>
                    </ul>
                </div>
                <div class="vr"></div>
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbarLight" aria-labelledby="offcanvasNavbarLightLabel">
                    <div class="offcanvas-header">
                        <img src="assets/img/LogoIncBio.png" class="ms-2" style="height: 4rem;" alt="">
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="container">
                        <h5 class="offcanvas-title mt-3" id="offcanvasNavbarLightLabel">Administrador</h5>
                    </div>

                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-start flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">SUIDEV - Padrón PCD</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Últimas Actividades registradas
                                </a>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="timeline p-4 blockt mb-4">
                                            <div class="tl-item active">
                                                <div class="tl-dot b-warning"></div>
                                                <div class="tl-content">
                                                    <div class="">@twitter thanks for you appreciation and @google thanks for you appreciation</div>
                                                    <div class="tl-date text-muted mt-1">13 june 18</div>
                                                </div>
                                            </div>
                                            <div class="tl-item">
                                                <div class="tl-dot b-primary"></div>
                                                <div class="tl-content">
                                                    <div class="">Do you know how Google search works.</div>
                                                    <div class="tl-date text-muted mt-1">45 minutes ago</div>
                                                </div>
                                            </div>
                                            <div class="tl-item">
                                                <div class="tl-dot b-danger"></div>
                                                <div class="tl-content">
                                                    <div class="">Thanks to <a href="#" data-abc="true">@apple</a>, for iphone 7</div>
                                                    <div class="tl-date text-muted mt-1">1 day ago</div>
                                                </div>
                                            </div>
                                            <div class="tl-item">
                                                <div class="tl-dot b-danger"></div>
                                                <div class="tl-content">
                                                    <div class="">Order placed <a href="#" data-abc="true">@eBay</a> you will get your products</div>
                                                    <div class="tl-date text-muted mt-1">1 Week ago</div>
                                                </div>
                                            </div>
                                            <div class="tl-item">
                                                <div class="tl-dot b-warning"></div>
                                                <div class="tl-content">
                                                    <div class="">Learn how to use <a href="#" data-abc="true">Google Analytics</a> to discover vital information about your readers.</div>
                                                    <div class="tl-date text-muted mt-1">3 days ago</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="dropdown bottom-0 end-0 ">
                    <button class="btn btn-bd-primary dropdown-toggle d-flex align-items-center"
                            id="bd-theme"
                            type="button"
                            aria-expanded="false"
                            data-bs-toggle="dropdown"
                            aria-label="Toggle theme (auto)">
                        <svg class="bi my-1 theme-icon-active text-dark" width="1em" height="1em"><use href="#circle-half"></use></svg>
                        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-start shadow" aria-labelledby="bd-theme-text">
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
                            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#sun-fill"></use></svg>
                            Light
                            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
                            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#moon-stars-fill"></use></svg>
                            Dark
                            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                            </button>
                        </li>
                        <li>
                            <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
                            <svg class="bi me-2 opacity-50" width="1em" height="1em"><use href="#circle-half"></use></svg>
                            Auto
                            <svg class="bi ms-auto d-none" width="1em" height="1em"><use href="#check2"></use></svg>
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="vr"></div>
                <!-- <a class="navbar-brand" href="#">Light offcanvas navbar</a> -->
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle  ms-3 me-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Beneficiarios 
                        <i class="bi bi-person-rolodex ms-2" style="font-size: 25px;"></i>
                    </a>
                    <ul class="dropdown-menu text-end">
                        <li><a class="dropdown-item" href="#">Reportes de Beneficiarios <i class="bi bi-folder2-open ms-2" style="font-size: 25px;"></i></a></li>
                        <li><a class="dropdown-item" href="#">Reportes de Apoyos <i class="bi bi-clipboard2-check ms-2" style="font-size: 25px;"></i></a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Reporte de Tarjetones <i class="bi bi-person-badge ms-2" style="font-size: 25px;"></i></a></li>
                        <li><a class="dropdown-item" href="#">Reporte de Credenciales <i class="bi bi-person-vcard ms-2" style="font-size: 25px;"></i></a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Gráficas <i class="bi bi-graph-up-arrow ms-2" style="font-size: 20px;"></i></a></li>
                    </ul>
                </div>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle ms-2 me-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Usuarios
                        <i class="bi bi-people-fill ms-2" style="font-size: 25px;"></i>
                    </a>
                    <ul class="dropdown-menu text-end">
                        <li><a class="dropdown-item" href="#">Reporte Individual <img src="assets/img/grafico-de-lineas.png" class="ms-2" style="height: 2em; width: auto;" alt=""></a></li>
                        <li><a class="dropdown-item" href="#">Reporte General <img src="assets/img/reporte.png"  style="height: 2.5em; width: auto;" alt=""></a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#agregar" href="">Agregar Usuario<i class="bi bi-person-plus ms-2" style="font-size: 30px;"></i></a></li>
                        <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#gestionUsuarios" onclick="usuariosQueryG()" href="#">Gestión de Usuarios <i class="bi bi-person-gear ms-2" style="font-size: 30px;"></i></a></li>
                    </ul>
                </div>
                

                <span class="navbar-text ms-auto">
                <h4 class="mt-1 me-1">Administrador</h4>  
                </span>
                <!-- esto no sera el fin apenas es el inicio -->
                <!-- <form class="d-flex justify-content-end align-items-end" style="justify-content: end;" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form> -->

            </div>
        </nav>
        <div class="container text-end align-items-end justify-content-end"><!-- inicio container principal-->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Administrador</li>
                </ol>
            </nav>
            <div class="row">
                <div class="col-8">
                    <div class="card mb-3" style="width: 100%; height: 100%;">
                        <div class="card-body">
                            <h5 class="card-title">Avance de capturas de expedientes</h5>
                            <p class="text-muted small text-secondary mt-0">Junio 1 de 2024 - Diciembre 31 de 2024</p>
                            <!-- gráfico -->
                            <canvas id="myChart" style="width:100%;"></canvas>
                            <!-- gráfico -->
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-12 mb-4">
                            <div class="card mb-3" style="width: 100%; height: 100%;">
                                <div class="card-body mt-3">
                                    <h5 class="card-title strong">Captura de expedientes</h5>
                                    <p class="card-text text-muted">Expedientes capturados durante la semana</p>
                                    <div class="row">
                                        <div class="col-6">
                                            <h1 class="text-start p-3">
                                                <i class="bi bi-clipboard-plus-fill border p-2 rounded" style="background-color: #cbe5ff; color: #4ea0f2;"></i>
                                            </h1>
                                        </div>
                                        <div class="col-6">
                                            <h1 class="p-3" style="color: #4ea0f2;"><span id="expNews2"></span></h1>
                                            <p><small class="text-success pe-2">(<i class="bi bi-arrow-up"></i> 17.2%)</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card mb-2" style="width: 100%; height: 100%;">
                                <div class="card-body mt-2">
                                    <h5 class="card-title">Tarjetones entregados</h5>
                                    <div class="row mt-5">
                                        <div class="col-6 text-start h1"><i class="bi bi-person-badge border p-2 rounded" style="background-color: #cbe5ff; color: #4ea0f2;"></i></div>
                                        <div class="col-6">
                                            <p class="card-text h3 pe-2" style="color: #4ea0f2;"><span id="filasTar"></span></p>
                                            <p class=""><small class="text-success">(<i class="bi bi-arrow-up"></i> 33.3%)</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card mb-2" style="width: 100%; height: 100%;">
                                <div class="card-body mt-2">
                                    <h5 class="card-title">Credenciales entregadas</h5>
                                    <div class="row mt-5">
                                        <div class="col-6 text-start h1"><i class="bi bi-credit-card-2-front-fill border p-2 rounded" style="background-color: #cbe5ff; color: #4ea0f2;"></i></div>
                                        <div class="col-6">
                                            <p class="card-text h3 pe-2" style="color: #4ea0f2;"><span id="credEnt"></span></p>
                                            <p class=""><small class="text-success">(<i class="bi bi-arrow-up"></i> 54.3%)</small></p>
                                        </div>
                                        <div class="col-12 justify-content-center">
                                            <p class=""><small class="text-secondary"><i class="bi bi-list-columns-reverse me-2"></i> Reportes</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-3">
                    <div class="row">
                        <div class="col-12">
                            <div class="card mb-3" style="max-width: 20rem; background-color: rgba(78, 160, 242);">
                                <!-- <div class="card-header text-white" style="font-size: larger;"><strong>TITULO</strong></div> -->
                                <div class="card-body">
                                    <h5 class="card-title text-white">Empleado más Eficiente</h5>
                                    <p class="card-text text-white">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="card mb-3" style="max-width: 20rem; background-color: rgba(245, 205, 45);">
                                <div class="card-header text-white" style="font-size: larger;"><strong>HEADER</strong></div>
                                <div class="card-body">
                                    <h5 class="card-title text-white">Warning card title</h5>
                                    <p class="card-text text-white">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="card" style="max-width: 20rem; background-color: rgba(225, 85, 127);">
                                <div class="card-header text-white">Header</div>
                                <div class="card-body">
                                    <h5 class="card-title text-white">Danger card title</h5>
                                    <p class="card-text text-white">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-9">
                    <div class="row h-100">
                        <div class="col-12">
                            <div class="card mb-3" style="width: 100%; height: 100%;">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-3 text-start">
                                            <a class="btn btn-secondary btn-sm mt-2 text-white" type="btn" href="query/excel_usuarioslog.php" style="color: #bfc7d1;" >Exportar<i class="bi bi-download ms-2 me-1"></i></a>
                                        </div>
                                        <div class="col-9 text-end">
                                            <h4 class="card-title">Actividad Reciente</h4>
                                            <p class="text-muted small text-secondary mt-0">de Junio 1 de 2024 - Diciembre 31 de 2024</p>
                                        </div>
                                    </div>
                                    <!-- tabla -->
                                    <table class="table p-1">
                                        <thead>
                                            <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Actividad</th>
                                            <th scope="col">Avance</th>
                                            <th scope="col">Departamento</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody id="usuariosTabla">
                                            
                                        </tbody>
                                    </table>
                                    <!-- tabla -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card mb-3" style="width: 100%; height: 100%;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-3 text-start">
                                    <button class="btn btn-secondary btn-sm text-white" style="color: #bfc7d1;" data-bs-toggle="modal" data-bs-target="#agregar"><span class="mt-3">Agregar nuevo</span><i class="bi bi-person-plus my-auto ms-2 mb-2"></i></button>
                                </div>
                                <div class="col-9 text-end">
                                    <h5 class="card-title">Usuarios Registrados</h5>
                                    <p class="text-muted small text-secondary mt-0"></p>
                                </div>
                            </div>
                            <!-- tabla -->
                            <table class="table p-1">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Perfil</th>
                                        <th scope="col">Fecha de creación</th>
                                        <th scope="col">Último logIn</th>
                                        <th scope="col">Estatus</th>
                                        <th scope="col">Nombre completo</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="tablaUsuarios">
                                    
                                </tbody>
                            </table>
                            <!-- tabla -->
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- fin container principal-->
    </body><!--aqui-->
</html>
    
<script src="assets/js/graficos.js"></script>

<?php
    include("modales/agregarUsuario.php");
    include("modales/editarUsuario.php");
    include("modales/gestionarUsuarios.php");
?>