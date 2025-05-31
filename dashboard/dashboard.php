<?php
    session_start();

    $user = $_SESSION['username'];
    $nombre = $_SESSION['nombre'];
    $estatusCorte = $_SESSION['estatusCorte'];

    if(empty($user) || empty($nombre)){
        echo "<script type=\"text/javascript\">location.href='prcd/sort.php';</script>";
    }
?>

<!DOCTYPE html>
<html lang="es">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>CONECTWI | Inicio</title>
		<!-- base:css -->
		<link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
		<!-- endinject -->
		<!-- plugin css for this page -->
		<!-- End plugin css for this page -->
		<!-- inject:css -->
		<link rel="stylesheet" href="css/style.css">
		<!-- endinject -->
		<link rel="shortcut icon" href="../images/logoantenaISP.ico"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		
	</head>
	<!-- área de scripts -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

	 <script src="js/scripts.js"></script>
	 <script src="js/pagos.js"></script>
	 <script src="js/registroPago.js"></script>
	 <script src="js/menusLaterales.js"></script>
	 <script src="js/laterales/promociones.js"></script>
	 <script src="js/laterales/paquetes.js"></script>
	 <script src="js/laterales/corteDiario.js"></script>
	<!-- área de scripts -->
	<body onload="queryDashboard1();revisarCorte();">
		
    <div class="container-scroller">
		<!-- partial:partials/_horizontal-navbar.html -->
    <div class="horizontal-menu">
      <nav class="navbar top-navbar col-lg-12 col-12 p-0">
        <div class="container-fluid">
          <div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
            <ul class="navbar-nav navbar-nav-left">
              <li class="nav-item ms-0 me-3 d-lg-flex d-none">
                <a href="#" class="nav-link horizontal-nav-left-menu" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"><i class="mdi mdi-format-list-bulleted bg-primary rounded pt-2 pe-2 ps-2"></i></a>
              </li>
             
            </ul>
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="index.html"><img src="../images/logo_conectwi_wide-removebg-preview.png" height="30px" alt="logo"/></a>
                <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
                    <span class="nav-profile-name">Usuario</span>
                    <span class="online-status"></span>
                    <img src="images/faces/face28.png" alt="profile"/>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
						<p class="mb-0 font-weight-medium float-left dropdown-header">Mi cuenta</p>
						<a class="dropdown-item" href="#" onclick="editarDatosUsr()">
							<i class="mdi mdi-settings text-primary"></i>
							Editar mis datos
						</a>
						<a href="prcd/sort.php" class="dropdown-item">
							<i class="mdi mdi-logout text-primary" ></i>
							Cerrar Sesión
						</a>
                  </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="horizontal-menu-toggle">
              <span class="mdi mdi-menu"></span>
            </button>
          </div>
        </div>
      </nav>
      <nav class="bottom-navbar">
		  <div class="container">
			<script src="https://cdn.lordicon.com/lordicon.js"></script>
            <ul class="nav page-navigation">
              	<li class="nav-item">
					<a class="nav-link" href="index.html">
					<!-- <i class="mdi mdi-file-document-box menu-icon"></i> -->
					<lord-icon
						src="https://cdn.lordicon.com/cnpvyndp.json"
						trigger="hover"
						colors="primary:#0ddbb9"
						style="width:40px;height:40px"
						class="menu-icon">
					</lord-icon>
					<span class="menu-title">Inicio</span>
					</a>
              	</li>
			  	<li class="nav-item">
					<a onclick="contratoNew()" class="nav-link">
						<!-- <i class="mdi mdi-file-document-box-outline menu-icon"></i> -->
						<lord-icon
						src="https://cdn.lordicon.com/rbbnmpcf.json"
						trigger="hover"
						colors="primary:#0ddbb9"
						style="width:40px;height:40px"
						class="menu-icon2 mb-2">
					</lord-icon>
					<span class="menu-title">Contrato Nuevo</span></a>
				</li>
				<li class="nav-item">
					<a onclick="pagoNew()" class="nav-link">
					<!-- <i class="mdi mdi-square-inc-cash menu-icon"></i> -->
					<lord-icon
						src="https://cdn.lordicon.com/ciawvzjk.json"
						trigger="hover"
						colors="primary:#0ddbb9"
						style="width:40px;height:40px"
						class="menu-icon2 mb-2">
					</lord-icon>
					<span class="menu-title">Registrar Pago</span>
					<i class="menu-arrow"></i>
					</a>
				</li>
				<li class="nav-item">
					<a onclick="altaIncidencia()" class="nav-link" >
					<lord-icon
						src="https://cdn.lordicon.com/ygvjgdmk.json"
						trigger="hover"
						colors="primary:#0ddbb9"
						style="width:40px;height:40px;"
						class="menu-icon2 mb-2">
					</lord-icon>
					<!-- <i class="mdi mdi-finance menu-icon"></i> -->
					<span class="menu-title">Reportar Falla</span>
					<i class="menu-arrow"></i>
					</a>
				</li>
				<li class="nav-item">
					<a onclick="altaCorte()" class="nav-link" >
						<lord-icon
						src="https://cdn.lordicon.com/xmuplryc.json"
						trigger="hover"
						colors="primary:#0ddbb9"
						style="width:40px;height:40px"
						class="menu-icon2 mb-2">
					</lord-icon>
					<!-- <i class="mdi mdi-finance menu-icon"></i> -->
					<span class="menu-title">Orden de Corte</span>
					<i class="menu-arrow"></i>
					</a>
				</li>
				<li class="nav-item">
					<a href="../reportes/index.php" class="nav-link">
						<lord-icon
							src="https://cdn.lordicon.com/zrtfxghu.json"
							trigger="hover"
							colors="primary:#16c79e"
							style="width:40px;height:40px"
							class="menu-icon2 mb-2">
						</lord-icon>
						<span class="menu-title">Reportes</span>
						<i class="menu-arrow"></i>
					</a>
				</li>
            </ul>
        </div>
    	</nav>
    </div>
    <!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-6 mb-4 mb-xl-0">
							<div class="d-lg-flex align-items-center">
								<div>
									<h3 class="text-dark font-weight-bold mb-2">Bienvenid@ (Usuario)!</h3>
									<h6 class="font-weight-normal mb-2">Su último login fue hace 8 horas.</h6>
								</div>
								<div class="ms-lg-5 d-lg-flex d-none">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="d-flex align-items-center justify-content-md-end">
								<div class="pe-1 mb-3 mb-xl-0">
									<button type="button" class="btn bg-white btn-icon">
										<i class="mdi mdi-view-grid text-success"></i>
									</button>
									<button type="button" class="btn bg-white btn-icon ms-2">
										<i class="mdi mdi-format-list-bulleted font-weight-bold text-primary"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-lg-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Últimos Pagos Registrados</h4>
									<div class="row">
										<div class="table-responsive">
											<table class="table table-striped table-hover">
												
												<thead style="background-color: aliceblue;">
													<tr class="text-center">
														<th class="scope" style="font-weight: bold;">
															Contrato
														</th>
														<th class="scope" style="font-weight: bold;">
															# pago
														</th>
														<th class="scope" style="font-weight: bold;">
															Nombre del Cliente
														</th>
														<th class="scope" style="font-weight: bold;">
															Monto
														</th>
														<th class="scope" style="font-weight: bold;">
															Fecha de Pago
														</th>
													</tr>
												</thead>
												<tbody id="dashboard1">
													
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 mb-3 mb-lg-0">
							<div class="card congratulation-bg random-card text-center">
								<div class="card-body pb-0">
								
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card overflow-auto">
									<div class="card-body">
										<h4 class="card-title">Próximos a Vencer</h4>
										<!-- <p class="card-description">
										Add class <code>.table-striped</code>
										</p> -->
										<ul class="list-group list-group-horizontal mb-4">
											<li class="list-group-item">
												1 - 2 días para vencer
												<div class="btn btn-sm btn-danger btn-rounded ms-2"></div>
											</li>
											<!-- <li><span class="bg-warning"></span></li> -->
											<li class="list-group-item">
												3 - 4 días para vencer
												<div class="btn btn-sm btn-warning btn-rounded ms-2"></div>
											</li>
											<li class="list-group-item">
												5 - 6 días para vencer
												<div class="btn btn-sm btn-success btn-rounded ms-2"></div>
											</li>
										</ul>
										<div class="table-responsive">
											<table class="table table-hover text-center">
												<caption>de 1 a 6 días antes de la fecha límite de pago.</caption>
												<thead style="background-color: aliceblue;" class="text-dark">
													<tr>
														<th class="scope" style="font-weight: bold;">
															Contrato
														</th>
														<th class="scope" style="font-weight: bold;">
															Nombre del Cliente
														</th>
														<th class="scope" style="font-weight: bold;">
															Progreso de Vencimiento
														</th>
														<th class="scope" style="font-weight: bold;">
															Monto
														</th>
														<th class="scope" style="font-weight: bold;">
															Fecha Límite de Pago
														</th>
													</tr>
												</thead>
												<tbody id="tablaProximos">
													
												</tbody>
											</table>
										</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 grid-margin stretch-card">
								<!-- <div class="card"> -->
									<div class="card overflow-auto">
										<div class="card-body">
										<h4 class="card-title">Servicios Vencidos</h4>
										<!-- <p class="card-description">
											Add class <code>.table-striped</code>
										</p> -->
										<div class="table-responsive">
											<table class="table table-hover text-center">
												<thead style="background-color: aliceblue;" class="text-dark">
													<tr>
														<th class="scope" style="font-weight: bold;">
															Contrato
														</th>
														<th class="scope" style="font-weight: bold;">
															Nombre
														</th>
														<th class="scope" style="font-weight: bold;">
															Monto
														</th>
														<th class="scope" style="font-weight: bold;">
															Fecha límite de pago
														</th>
														<th class="scope" style="font-weight: bold;">
															Estatus
														</th>
														<th class="scope" style="font-weight: bold;">
															Actualizar
														</th>
													</tr>
												</thead>
												<tbody id="tablaProximos2">
													<tr>
														<td class="py-1">
															C-0356
														</td>
														<td>
															Germán Rivas
														</td>
														<!-- <td>
															<div class="progress">
															<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$ 77.99
														</td>
														<td>
															May 15, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													<tr>
														<td class="py-1">
															C-0329
														</td>
														<td>
															Marco Pérez
														</td>
														<!-- <td>
															<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$245.30
														</td>
														<td>
															July 1, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													<tr>
														<td class="py-1">
															C-0544
														</td>
														<td>
															Juan Ricardo
														</td>
														<!-- <td>
															<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$138.00
														</td>
														<td>
															Apr 12, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													<tr>
														<td class="py-1">
															C-0436
														</td>
														<td>
															Pedro Méndez
														</td>
														<!-- <td>
															<div class="progress">
															<div class="progress-bar bg-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$ 77.99
														</td>
														<td>
															May 15, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													<tr>
														<td class="py-1">
															C-0582
														</td>
														<td>
															Eduardo Santana
														</td>
														<!-- <td>
															<div class="progress">
															<div class="progress-bar bg-danger" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$ 160.25
														</td>
														<td>
															May 03, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													<tr>
														<td class="py-1">
															C-0222
														</td>
														<td>
															Juan Díaz
														</td>
														<!--  <td>
															<div class="progress">
															<div class="progress-bar bg-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
															</div>
														</td> -->
														<td>
															$ 123.21
														</td>
														<td>
															April 05, 2025
														</td>
														<td>
															Asignado
														</td>
														<td class="align-items-center"><button class="btn btn-sm btn-info btn-rounded"><i class="mdi mdi-refresh mx-0 text-white"></i></button></td>
													</tr>
													
												</tbody>
											</table>
										</div>
									</div>
								<!-- </div> -->
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
          <div class="footer-wrap">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © <a href="http://www.smartevent.com.mx" target="_blank">SmartEvent </a>2025</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Desarrollo de sistemas <a href="https://www.bootstrapdash.com/" target="_blank"> SmartEvent </a> templates</span>
            </div>
          </div>
        </footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
    </div>
		<!-- container-scroller -->
    <!-- base:js -->
    <script src="vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="js/template.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <!-- End plugin js for this page -->
    <script src="vendors/chart.js/Chart.min.js"></script>
    <script src="vendors/progressbar.js/progressbar.min.js"></script>
		<script src="vendors/chartjs-plugin-datalabels/chartjs-plugin-datalabels.js"></script>
		<script src="vendors/justgage/raphael-2.1.4.min.js"></script>
		<script src="vendors/justgage/justgage.js"></script>
    <!-- <script src="js/jquery.cookie.js" type="text/javascript"></script> -->
    <!-- Custom js for this page-->
    <script src="js/dashboard.js"></script>
    <!-- End custom js for this page-->
	<script src="js/validaciones.js"></script>

</body>
</html>

<!-- Inicia Modal para contrato nuevo -->

<div class="modal fade" id="contrato" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-secondary text-light">
                <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-plus-circle-dotted"></i> Contrato nuevo</h1>
                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formSolicitudes">   
                <div class="row g-3">   
                    <div class="col-sm-4">
                        <label for="foliocontrato" class="form-label"><h2>Folio:</h2></label>
                    <div>
						<input type="text" class="form-control" name="foliocontrato" id="folioLabelContrato" disabled></input>
					</div>
                    </div>
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4">
                        <label for="date" class="form-label mt-3">Fecha de Contratación:</label>
                        <input type="date" class="form-control" name="date" id="dateContratoNew" onchange="cambiarFecha()" placeholder="">
                    </div>
					<h2>Datos del Cliente</h2>
                    <div class="col-sm-12">
                        <label for="name" class="form-label">Nombre Completo:</label>
                        <input type="text" class="form-control" id="nombreCompleto" name="name" placeholder="">
                    </div>
                    <div class="col-sm-4">
                        <label for="calle" class="form-label">Domicilio:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="domicilioContrato" name="calle" placeholder="">
						</div>
                    </div>
                    <div class="col-sm-4">
                        <label for="colonia" class="form-label">Comunidad:</label>
                        <select class="form-select" name="" id="catalogoComunidades"></select>
                    </div>
                    
                    <div class="col-sm-4">
                        <label for="municipio" class="form-label">Municipio:</label>
                        <select class="form-select" name="" id="catalogoMunicipios"></select>
                    </div>
                    <div class="col-sm-4">
                        <label for="estado" class="form-label">Estado:</label>
                        <select class="form-select" name="" id="catalogoEstados"></select>
                    </div>
                    <div class="col-sm-4">
                        <label for="cp" class="form-label">C.P.:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="cpContrato" name="cp" placeholder="">
						</div>
                    </div>
                    <div class="col-sm-4">
                        <label for="telefono" class="form-label">Teléfono:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="telefonoContrato" name="telefono" placeholder="">
						</div>
                    </div>
                    <div class="col-sm-12">
                        <label for="referencias" class="form-label">Referencias de la vivienda:</label>
                        <textarea type="text" class="form-control" rows="2" id="referenciasContrato" name="referencias" placeholder=""></textarea>
                    </div>
                    
                    <div class="col-sm-6">
						<label for="comprobante" class="form-label">Identificación:</label>
						<select class="form-select" id="identificacionContrato" aria-label="comprobante" required>
							<option selected>Selecciona...</option>
							<option value="INE">INE</option>
							<option value="INAPAM">INAPAM</option>
							<option value="Licencia">Licencia de Manejo</option>
						</select>
                    </div>
                    
					<div class="col-sm-6">
						<label for="comprobante" class="form-label">Comprobante de Domicilio:</label>
						<select class="form-select" id="comprobanteContrato" aria-label="Default select example" required>
							<option selected>Selecciona...</option>
							<option value="luz">Recibo de Luz Eléctrica</option>
							<option value="agua">Recibo del Agua</option>
							<option value="cable">Recibo de Servicio de Televisión</option>
							<option value="telefono">Teléfono fijo</option>
						</select>
                    </div>
					
					<h3>Servicio Contratado</h3>
					<div class="col-sm-4">
						<label for="velocidad" class="form-label">Velocidad de Internet:</label>
						<select class="form-select" id="catalogoPaquetes" aria-label="velocidad" onclick="cuotaMensual(this)" required></select>
                    </div>
					
					<div class="col-sm-4">
                        <label for="colonia" class="form-label">Asignar antena:</label>
                        <select class="form-select" name="" id="antenaContrato"></select>
                    </div>
					<div class="col-sm-4">
						<label for="ipAddress" class="form-label">IP asignada:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="ipAddressContrato" name="ipAddress" placeholder="">
						</div>
                    </div>
					<div class="col-lg-12">
						<h2>Cuota Mensual</h2>
					</div>
					<div class="col-lg-12" id="mensualidad">
						<!-- <h2>$</h2>Carga los datos de la cuota mensual -->
						<input type="text" class="form-control" id="inputCosto" disabled>
					</div>
					<div class="col-lg-6 mb-3" id="fechalimite">
						<h3>Fecha Límite de Pago</h3>
						<!-- <h3>DD/MMM</h3> -->
						<input type="date" class="form-control" id="siguienteMesInput" disabled>
						<!-- Carga los datos de la cuota mensual -->
					</div>
					<div class="col-lg-6 mb-3" id="fechacorte">
						<h3>Fecha de Corte</h3>
						<!-- <h3>DD/MMM</h3> -->
						<input type="date" class="form-control" id="mesMasCincoDiasInput" disabled>
						<!-- Carga los datos de la cuota mensual -->
					</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="guardarbtn" onclick="guardarContrato()" >Guardar</button> <!-- Guarda registro de cliente nuevo y manda a modal de pago automáticamente -->
                    <button type="button" class="btn btn-success" id="imprimircbtn" data-bs-toggle="modal" data-bs-target="#pago" >Imprimir Contrato</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Termina Modal para contrato nuevo -->

<!-- Inicia Modal para registrar pago -->

<div class="modal fade" id="pago" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-secondary text-light">
                <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-credit-card"></i> Registro de pago</h1>
                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formSolicitudes">   
                <div class="row g-3">   
                    <div class="col-sm-4">
                        <label for="foliopago" class="form-label">Folio de pago: </label>
						<input class="form-control" id="folioLabelpago" disabled>
                    </div>
                    <div class="col-lg-4">
                    </div>
                    <div class="col-lg-4">
                        <label for="datos_usr" class="form-label"><i class="bi bi-person"></i> Fecha:</label>
                        <input type="date" class="form-control" id="fechaSolicitud" name="datos_usr" placeholder="" disabled>
                    </div>
                    <!-- <div class="col-lg-6" id="foliosearch" hidden>
						<label for="buscafolio" class="form-label">Buscar Folio</label>
						<input class="form-control" list="datalistOptions" id="buscafolio" oninput=""placeholder="Type to search...">
						<datalist id="datalistOptions">
							falta función para consulta de folios de clientes para llenar este datalist
						</datalist>
                    </div> -->
					<div class="col-12 mb-2">
						<label for="buscanombre" class="form-label">Buscar Nombre</label>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
							<input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" id="buscanombre" oninput="queryClientesPago(this.value)" aria-describedby="basic-addon1" id="buscarCortes" name="buscar">
						</div>
						<select class="form-select" onchange="queryClientes(this.value)" id="nombresClientes" size="3" aria-label="folio corte">
							<!-- <option selected>Selecciona...</option> -->
							<!-- Muestra los folios de las ordenes de corte que aún no han sido resueltas para cambiar los datos -->
						</select>
					</div>
                    <!-- <div class="col-lg-12" id="nombresearch">
						<input class="form-control" list="nombresClientes" id="buscanombre" oninput="queryClientes(this.value)" placeholder="Ingresa el nombre del cliente...">
						<datalist id="nombresClientes"> 

						</datalist>
                    </div> -->
                    <!-- <div class="col-lg-6" id="domiciliosearch" hidden>
						<label for="buscadomicilio" class="form-label">Buscar Domicilio</label>
						<input class="form-control" list="domicilios" id="buscadomicilio" oninput=""placeholder="Type to search...">
						<datalist id="domicilios">
							Falta función de consulta para busqueda por domicilio y que llene el datalist
						</datalist>
                    </div> -->
					<div class="col-lg-4 ms-5 my-auto">
						<!-- <div class="form-check m-0">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="1" checked onclick="hideInput(this.value)">
							<label class="form-check-label" for="exampleRadios1">
								Buscar por Folio
							</label>
						</div> -->
						<!-- <div class="form-check m-0" > -->
							<!-- <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="2" onclick="hideInput(this.value)" checked> -->
							<!-- <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="2" checked>
							<label class="form-check-label" for="exampleRadios2">
								Buscar por Nombre
							</label>
						</div> -->
						<!-- <div class="form-check m-0">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="3" onclick="hideInput(this.value)">
							<label class="form-check-label" for="exampleRadios3">
								Buscar por Domicilio
							</label>
						</div> -->
                    </div>
					<div class="col-lg-12" id="datoscliente" hidden>
						<div id="datosGenerales">
							
						</div>
					</div>
					<hr>
					<div class="container">
						<div class="input-group mb-1">
							<span class="input-group-text" id="basic-addon1"><i class="bi bi-bookmarks"></i></span>

							<select class="form-select" aria-label="Default select example" id="catalogoConceptos">
								<optgroup label="Mensualidad" id="mensualidad">
								</optgroup>
							</select>

							<button class="btn btn-primary" onclick="tablaGrid()"><i class="bi bi-plus-circle"></i></button>
						</div>
						<div class="form-text" id="basic-addon4">Selecciona el concepto.</div>
					</div>
					<hr>
					<div class="col-sm-12">
						<label for="datos_usr" class="form-label"><i class="bi bi-person"></i> Descripción:</label>
						<!-- <div id="NuevaSolicitud"></div> -->
						<div class="table-responsive" id="tablaSolicitud">
							<table class="table table-hover text-center" id="tablaPre">
								<thead class="bg-dark text-light">
									<tr>
										<th>Mes</th>
										<th>Concepto</th>
										<th>Periodo</th>
										<th>Monto</th>
										<th>Eliminar</th>
									</tr>
								</thead>
								<tbody class="text-dark" id="NuevaSolicitud" >
									
								</tbody>
								<tfoot>
									<tr class="table-success">
										<td colspan="3" class="text-end"><strong>Total:</strong></td>
										<td>
											<span id="total-costo">0.00</span>
										</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="col-lg-6 mb-2" id="pagodiv" >
						<label for="tipopago" class="form-label">Tipo de Pago:</label>
						<select class="form-select" id="tipopago" aria-label="Default select example" onchange="baucher()" required>
							<option value="1" selected>Efectivo</option>
							<option value="2">Tarjeta Débito</option>
							<option value="3">Tarjeta Crédito</option>
							<option value="4">Transferencia</option>
						</select>
					</div>
					<div class="col-lg-4 mb-2" id="pagodiv2" hidden>
						<label for="tipopago" class="form-label"># Baucher:</label>
						<div class="input-group input-group-sm">
							<input class="form-control input-sm" type="text" id="tipopagoBaucher" placeholder="Num. baucher">
						</div>
					</div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="pagoreg" onclick="swalpago()">Pagar</button>
                    <a type="button" class="btn btn-success" id="printticket" onclick="cerrarpago()" data-bs-toggle="modal" data-bs-target="#ticket" hidden >Imprimir Ticket</a>
                    <button type="button" class="btn btn-success" id="cerrarpago1" data-bs-dismiss="modal" hidden >Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="ticket" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-secondary" id="header" style="background-image: url('images/Recurso1.png'); background-size: cover; ">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body mb-2">
				<div >
					<img class="ms-2" src="../images/logo_conectwi_wide-removebg-preview.png" style="height: 4rem;" alt="">
					<h3 class="text-center mt-5" style="font-size: 1.5rem; font-weight: bold;">RECIBO DE PAGO</h3>
				</div>
				<div class="row mt-5">
					<div class="col-4">
						<p>Fecha:<br><span id="ticketFecha"></span></p>
					</div>
					<div class="col-4">
					</div>
					<div class="col-4">
						<p>Folio:<br><span id="ticketFolio"></span></p>
					</div>
				</div>
				<article class="mt-2 mb-2">
					<div class="row">
						<div class="col-7" id="ticketDatosCliente">
							<label>Cliente:</label>
						</div>
						<div class="col-5" id="ticketNoCliente">
							<label>Contrato:</label>
						</div>
					</div>
				</article>
				<article>
					<table>
						<thead>
							<tr>
								<td>Descripción</td>
								<td>Monto</td>
							</tr>
						</thead>
						<tbody id="ticketTabla">

						</tbody>
					</table>
				</article>
				<article>
					<div class="col-8 text-end">
						<p>Subtotal</p>
					</div>
					<div class="col-4" id="ticketSubtotal">

					</div>
				</article>
				<article>
					<div class="col-8 text-end">
						<p>Descuento</p>
					</div>
					<div class="col-4 text-end" id="ticketDcto">

					</div>
				</article>
				<article>
					<div class="col-8 text-end">
						<p>Total</p>
					</div>
					<div class="col-4 text-end" id="ticketTotal">

					</div>
				</article>
				<article>
					<div class="text-center mt-5 mb-5">
						<p style="font-size: 1.5rem;"><b>GRACIAS POR SU PREFERENCIA</b></p>
						<p style="font-size: 1.2rem;"><b>CONSERVE SU TICKET</b></p><p style='font-size: 1rem;'>Únicamente presentando éste ticket pordrá acreditar su pago.<br>http://www.conectwi.com</p><p style='font-size: 1rem;'>CONECTWI | 2025</p>
					</div>
				</article>
			</div>
			<div class="modal-footer bg-secondary" id="footer" style="background-image: url('images/Recurso5.png'); background-size: cover;">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
				<button type="button" id="printticket1" class="btn btn-primary">Imprimir</button>
			</div>
		</div>
	</div>
</div>

<!-- Termina Modal para agregar solicitud -->

<nav class="navbar bg-body-tertiary fixed-top">
	<div class="container-fluid">
		<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
					<a class="navbar-brand brand-logo" href="index.html"><img src="../images/logo_conectwi_wide-removebg-preview.png" height="30px" alt="logo"/></a>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-receipt me-2" style="font-size: 20px;"></i>
							Corte de Caja
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" id="menuCorteCaja" onclick="corteCajaDiario()">Generar Corte de Caja</a></li>
							<li><a class="dropdown-item" href="#" onclick="reporteCorteCaja()">Imprimir Corte de Caja</a></li>
						</ul>
					</li>
					<li>
						<hr>
					</li>
				
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-exclamation-circle me-2"></i>
							Reportes de Fallas
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" onclick="altaIncidencia()">Agregar Reporte de Falla</a></li>
							<li><a class="dropdown-item" href="#" onclick="editarIncidencia()">Editar Reporte de Falla</a></li>
							<li><a class="dropdown-item" href="#" onclick="gestionIncidencias()">Estatus de Fallas</a></li>
							<li><a class="dropdown-item" href="#" onclick="resolverIncidencia()">Reporte Técnico</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-wifi-off me-2"></i>
							Orden de Corte de Servicio
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" onclick="altaCorte()">Generar corte de servicio</a></li>
							<li><a class="dropdown-item" href="#" onclick="editarCorte()">Editar corte de servicio</a></li>
							<li><a class="dropdown-item" href="#" onclick="gestionCortes()">Estatus de cortes de servicio</a></li>
							<!-- <li><a class="dropdown-item" href="#" onclick="resolverCorte()">Reporte Técnico</a></li> -->
						</ul>
					</li>
					<li class="nav-item dropdown">
						<hr>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-circle me-2"></i>
							Mi Cuenta
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" onclick="editarDatosUsr()">Editar mis datos</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" aria-expanded="false" href="prcd/sort.php">
							<i class="bi bi-door-closed me-2"></i>
							Cerrar Sesión
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>

<!-- Modal pagor individuales -->
<div class="modal fade" id="listaPagosInv" tabindex="-1" aria-labelledby="listaPagosInvLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
		<div class="modal-header bg-secondary text-light">
		  <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-cash-coin"></i> Pago realizado</h1>
		  <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<div class="alert alert-info" role="alert">
				<p><strong>Folio contrato:</strong> <span id="folioPagoRealizado"></span></p>
				<p><strong>fecha pago:</strong> <span id="fechaPagoRealizado"></span></p>
				<p><strong>Nombre:</strong> <span id="nombrePagoRealizado"></span></p>
				<p><strong>Total: </strong> <span id="totalPagoRealizado"></span></p>
			</div>

		  <p>
			<table class="table text-center table-striped table-sm">
				<thead class="bg-dark text-light">
					<tr>
						<th>#</th>
						<th>Concepto</th>
						<th>Folio</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody id="tablaPagosBody"></tbody>
			</table>
		  </p>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
		</div>
	  </div>
	</div>
  </div>