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
		<!-- <link rel="stylesheet" href="../scripts/bootstrap-icons.min.css"> -->
		
	</head>
	<!-- área de scripts -->
	<!-- <script src="../scripts/sweetalert2@11"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 	<script src="../scripts/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
-->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

	<script src="js/filtros.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/otrosGastos.js"></script>
	<script src="js/pagos.js"></script>
	<script src="js/contratos.js"></script>
	<script src="js/laterales/antenas.js"></script>
	<script src="js/registroPago.js"></script>
	<script src="js/menusLaterales.js"></script>
	<script src="js/laterales/promociones.js"></script>
	<script src="js/laterales/paquetes.js"></script>
	<script src="js/laterales/corteDiario.js"></script>
	<!-- área de scripts -->
	<body onload="queryDashboard1();revisarCorte();ultimoAcceso('<?php echo $user; ?>');">
		
    <div class="container-scroller">
		<!-- partial:partials/_horizontal-navbar.html -->
		<div class="horizontal-menu">
			<nav class="navbar top-navbar col-lg-12 col-12 p-0">
				<div class="container-fluid">
					<div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
						<ul class="navbar-nav navbar-nav-left">
						<li class="nav-item ms-0 me-3 d-lg-flex d-none">
							<a href="#" class="nav-link horizontal-nav-left-menu" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"><i class="mdi mdi-format-list-bulleted rounded pt-2 pe-2 ps-2" style="color:blue; border: 1px solid blue;"></i></a>
						</li>
						
					</ul>
					<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
						<a class="navbar-brand brand-logo" href="dashboard.php"><img src="../images/logo_conectwi_wide-removebg-preview.png" height="30px" alt="logo"/></a>
						<a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a>
					</div>
					<ul class="navbar-nav navbar-nav-right">
						<li class="nav-item nav-profile dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" id="profileDropdown">
								<span class="nav-profile-name"><?php echo $nombre ?></span>
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
				<script src="../scripts/lordicon.js"></script>
				<ul class="nav page-navigation">
					<li class="nav-item">
						<a class="nav-link" href="dashboard.php">
						<!-- <i class="mdi mdi-file-document-box menu-icon"></i> -->
						<lord-icon
							src="https://cdn.lordicon.com/cnpvyndp.json"
							trigger="hover"
							colors="primary:#0ddbb9"
							style="width:40px;height:40px"
							class="menu-icon coloresNav">
						</lord-icon>
						<span class="menu-title">Inicio</span>
						</a>
					</li>
					<li class="nav-item" disabled>
						<a onclick="contratoNew()" class="nav-link bloquearNav" disabled>
							<!-- <i class="mdi mdi-file-document-box-outline menu-icon"></i> -->
							<lord-icon
							src="https://cdn.lordicon.com/rbbnmpcf.json"
							trigger="hover"
							colors="primary:#0ddbb9"
							style="width:40px;height:40px"
							class="menu-icon2 mb-2 coloresNav">
						</lord-icon>
						<span class="menu-title">Contrato Nuevo</span></a>
					</li>
					<li class="nav-item">
						<a onclick="pagoNew()" class="nav-link bloquearNav">
						<!-- <i class="mdi mdi-square-inc-cash menu-icon"></i> -->
						<lord-icon
							src="https://cdn.lordicon.com/ciawvzjk.json"
							trigger="hover"
							colors="primary:#0ddbb9"
							style="width:40px;height:40px"
							class="menu-icon2 mb-2 coloresNav">
						</lord-icon>
						<span class="menu-title">Registrar Pago</span>
						<i class="menu-arrow"></i>
						</a>
					</li>
					<li class="nav-item">
						<a onclick="altaIncidencia()" class="nav-link bloquearNav">
						<lord-icon
							src="https://cdn.lordicon.com/ygvjgdmk.json"
							trigger="hover"
							colors="primary:#0ddbb9"
							style="width:40px;height:40px;"
							class="menu-icon2 mb-2 coloresNav">
						</lord-icon>
						<!-- <i class="mdi mdi-finance menu-icon"></i> -->
						<span class="menu-title">Reportar Falla</span>
						<i class="menu-arrow"></i>
						</a>
					</li>
					<li class="nav-item">
						<a onclick="altaCorte()" class="nav-link bloquearNav">
							<lord-icon
							src="https://cdn.lordicon.com/xmuplryc.json"
							trigger="hover"
							colors="primary:#0ddbb9"
							style="width:40px;height:40px"
							class="menu-icon2 mb-2 coloresNav">
						</lord-icon>
						<!-- <i class="mdi mdi-finance menu-icon"></i> -->
						<span class="menu-title">Orden de Corte</span>
						<i class="menu-arrow"></i>
						</a>
					</li>
					<?php 
						if($tipo_usr == 1){
							echo'
							<li class="nav-item">
							';
						}
						else{
							echo'
							<li class="nav-item" hidden>
							';
						}
					?>
						<a href="../reportes/index.php" class="nav-link bloquearNav">
							<lord-icon
								src="https://cdn.lordicon.com/zrtfxghu.json"
								trigger="hover"
								colors="primary:#16c79e"
								style="width:40px;height:40px"
								class="menu-icon2 mb-2 coloresNav">
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
					<div class="col-sm-12 ">
						<div class="alert alert-light border border-success" role="alert">
							<div>
								<h1 class="font-weight-bold mb-2" style="color:#0ddbb9">Bienvenid@ <small class="text-body-secondary"><?php echo $nombre ?>!</small></h1>
								<h6 class="font-weight-normal mb-2">Su último login fue <strong><span id="ultimoAcceso"></span></strong></h6>
							</div>
						</div>
						<!-- <div class="d-lg-flex align-items-center" hidden>
							<div>
								<h1 class="text-secondary font-weight-bold mb-2">Bienvenid@ <small class="text-body-secondary">(<?php echo $nombre ?>)!</small></h1>
								<h6 class="font-weight-normal mb-2">Su último login fue hace 8 horas.</h6>
							</div>
							<div class="ms-lg-5 d-lg-flex d-none">
							</div>
						</div> -->
					</div>
					<!-- <div class="col-sm-6">
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
					</div> -->
				</div>
				<div class="row mt-2">
					<!-- <div class="col-lg-8 grid-margin stretch-card">
						<div class="card">
							<div class="card-header pt-4">
								<h4 class="card-title">Últimos Pagos Registrados</h4>
							</div>
							<div class="card-body overflow-auto">
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
					</div> -->
				<div class="col-lg-8 grid-margin stretch-card">
				<div class="card">
					<div class="card-header pt-4">
						<h4 class="card-title"><i class="bi bi-calendar-check-fill"></i> Últimos Pagos Registrados en el mes</h4>
					</div>
					<div class="card-body overflow-auto">
						<div class="row">
							<div class="table-responsive" id="dashboard1">
								<!-- <table class="table table-striped table-hover">
									<thead style="background-color: aliceblue;">
										<tr class="text-center">
											<th class="scope" style="font-weight: bold;">Contrato</th>
											<th class="scope" style="font-weight: bold;"># pago</th>
											<th class="scope" style="font-weight: bold;">Nombre del Cliente</th>
											<th class="scope" style="font-weight: bold;">Monto</th>
											<th class="scope" style="font-weight: bold;">Fecha de Pago</th>
										</tr>
									</thead>
									<tbody id="dashboard1"> -->
										<!-- Los datos se cargarán aquí via AJAX -->
									<!-- </tbody>
								</table> -->
							</div>
						</div><!-- La paginación se insertará aquí automáticamente -->
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
							<div class="card-header pt-4">
								<h4 class="card-title">Próximos a Vencer</h4>
							</div>
							<div class="card-body">
								<ul class="list-group list-group-horizontal mb-4">
									<li class="list-group-item">
										1 - 2 días para vencer
										<div class="btn btn-sm btn-danger btn-rounded ms-2"></div>
									</li>
									<li class="list-group-item">
										3 - 4 días para vencer
										<div class="btn btn-sm btn-warning btn-rounded ms-2"></div>
									</li>
									<li class="list-group-item">
										5 - 6 días para vencer
										<div class="btn btn-sm btn-success btn-rounded ms-2"></div>
									</li>
								</ul>
								<div class="table-responsive" id="tablaProximos">
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 grid-margin stretch-card">
					<!-- <div class="card"> -->
					<div class="card overflow-auto">
						<div class="card-header pt-4">
							<h4 class="card-title">Servicios Vencidos</h4>
						</div>
						<div class="card-body">
						
						<div class="table-responsive" id="tablaProximos2">
							<!-- <table class="table table-hover text-center">
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
								<tbody >
									
								</tbody>
							</table> -->
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
	<script src="js/laterales/antenas.js"></script>
	<script src="js/contratos.js"></script>

</body>
</html>

<?php
	include("modals/reporteContratos.php");
	include("modals/reporteContratoIndividual.php");
	include("modals/editarContratos.php");
?>

<!-- Inicia Modal para contrato nuevo -->

<div class="modal fade" id="contrato" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-secondary text-light">
                <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-person-fill-add"></i> Contrato nuevo</h1>
                <button type="button" class="btn-close bg-light" onclick="limpiarModal()" data-bs-dismiss="modal" aria-label="Close"></button>
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
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="catalogoComunidades" name="comunidad" placeholder="">
						</div>
                        
                    </div>
                    
                    <div class="col-sm-4">
                        <label for="municipio" class="form-label">Municipio:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="catalogoMunicipios" name="municipio" placeholder="">
						</div>
                        
                    </div>
                    <div class="col-sm-4">
                        <label for="estado" class="form-label">Estado:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="catalogoEstados" name="estado" placeholder="">
						</div>
                        
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
							<option value="Pasaporte">Pasaporte</option>
							<option value="Licencia">Licencia de Manejo</option>
						</select>
                    </div>
                    
					<div class="col-sm-6">
						<label for="comprobante" class="form-label">Comprobante de Domicilio:</label>
						<select class="form-select" id="comprobanteContrato" aria-label="Default select example" required>
							<option selected>Selecciona...</option>
							<option value="Agua">Recibo del Agua</option>
							<option value="Luz">Recibo de Luz Eléctrica</option>
							<option value="Telefono">Teléfono fijo</option>
							<option value="Cable">Recibo de Servicio de Televisión</option>
						</select>
                    </div>
					
					<h3>Servicio Contratado</h3>
					<div class="col-sm-4">
						<label for="velocidad" class="form-label">Velocidad de Internet:</label>
						<select class="form-select" id="catalogoPaquetes" aria-label="velocidad" onclick="cuotaMensual(this)" required></select>
                    </div>
					
					<div class="col-sm-4">
                        <label for="antena" class="form-label">MAC antena asignada:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" name="antena" id="antenaContrato">
						</div>
                    </div>
					<div class="col-sm-4">
						<label for="ipAddress" class="form-label">IP asignada:</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="ipAddressContrato" name="ipAddress" placeholder="">
						</div>
                    </div>
					<div class="col-sm-4">
						<label for="ipAP" class="form-label">IP Access Point (AP):</label>
						<div class="input-group input-group-sm mb-3">
                        	<input type="text" class="form-control" id="ipAP" name="ipAP" placeholder="">
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
						<input type="date" class="form-control" id="siguienteMesInput">
						<!-- Carga los datos de la cuota mensual -->
					</div>
					<div class="col-lg-6 mb-3" id="fechacorte">
						<h3>Fecha de Corte</h3>
						<!-- <h3>DD/MMM</h3> -->
						<input type="date" class="form-control" id="mesMasCincoDiasInput">
						<!-- Carga los datos de la cuota mensual -->
					</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="limpiarModal()">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="guardarbtn" onclick="guardarContrato()" >Guardar</button> <!-- Guarda registro de cliente nuevo y manda a modal de pago automáticamente -->
                    <button type="button" class="btn btn-success" id="imprimircbtn" onclick="contratoNuevo()">Imprimir Contrato</button>
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
                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="limpiarModal();limpiar1modal()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formPagos">   
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
                    
					<div class="col-12 mb-2">
						<label for="buscanombre" class="form-label">Buscar Nombre</label>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
							<input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" id="buscanombre" oninput="queryClientesPago(this.value)" aria-describedby="basic-addon1" id="buscarCortes" name="buscar">
						</div>

						<select class="form-select" onchange="queryClientes(this.value);catalogoInstalaciones()" id="nombresClientes" size="2" aria-label="folio corte">

						</select>
					</div>
					<div class="col-lg-4 ms-5 my-auto">
						
                    </div>
					<div class="col-lg-12" id="datoscliente" hidden>
						<div id="datosGenerales">
							
						</div>
						<div class="col-lg-12 ">
							<div class="d-grid gap-2">
								<button class="btn btn-outline-primary" type="button" onclick="pago_anticipado()">Registrar Pago Anticipado</button>
								<button class="btn btn-outline-primary" type="button" onclick="cargo_adicional()">Cargo Adicional</button>
							</div>
						</div>
						<div class="col-lg-12 mt-2">
							<!-- Example single danger button -->
							<div class="dropdown-center" style="width: 100%;">
								
								<a type="button" class="btn btn-outline-primary dropdown-toggle w-100" data-bs-toggle="dropdown" aria-expanded="false">
									Agregar costo de Instalación:
								</a>
								<ul class="dropdown-menu" id="instalacionesPagos">
									
									

								</ul>
							</div>
							
						</div>
						
						</div>
						<hr>
					</div>
					<div class="col-sm-12 mb-2">
						<label for="datos_usr" class="form-label"><i class="bi bi-person"></i> Descripción:</label>
						
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
								<tbody class="text-dark" id="NuevaSolicitud">
									
								</tbody>
								<tfoot>
									<tr class="table-success" id="totalFilas">
										<td colspan="3" class="text-end" ><strong>Total:</strong></td>
										<td>
											<span id="total-costo">0.00</span>
										</td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<hr>
					<label>Aplicar Descuentos y Promociones</label>
					<div class="container mt-2 ms-3">
						<div class="row">
							<div class="col-2">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" onclick="descuento_promo()" id="descuento">
									<label class="form-check-label" style="margin-left: -.1rem" for="descuento">Descuento:</label>
								</div>
							</div>
							<div class="col-4">
								<div class="input-group input-group-sm mt-1">
									<span class="input-group-text" id="basic-addon1">$</span>
									<input type="text" class="form-control input-number" placeholder="" aria-label="Monto" id="monto_desc" aria-describedby="basic-addon1" disabled>
									<span class="input-group-text" id="basic-addon1">.00</span>
									<button class="btn btn-outline-secondary" type="button" id="addbtndesc" onclick="agregarDescuento()" disabled><i class="bi bi-plus-circle"></i></button>
								</div>
							</div>
							<div class="col-2">
								<div class="form-check form-check-inline ms-3">
									<input class="form-check-input" type="checkbox" id="promocion" onclick="descuento_promo()">
									<label class="form-check-label" style="margin-left: -.1rem" for="promocion">Promoción:</label>
								</div>
							</div>
							<div class="col-4">
								<div class="input-group mb-3 mt-1" style="margin-left: -.2rem">
									<select class="form-select" id="promocionesPagos" onchange="agregarPromoTable()" disabled>
										
									</select>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-6 mt-2 mb-2" id="pagodiv" >
							<label for="tipopago" class="form-label">Tipo de Pago:</label>
							<select class="form-select" id="tipopago" aria-label="Default select example" onchange="baucher()" required>
								<option value="1" selected>Efectivo</option>
								<option value="2">Tarjeta Débito</option>
								<option value="3">Tarjeta Crédito</option>
								<option value="4">Transferencia</option>
							</select>
						</div>
						<div class="col-6 mt-2 mb-2" id="pagodiv2" hidden>
							<label for="tipopago" class="form-label"># Baucher:</label>
							<div class="input-group input-group-sm">
								<input class="form-control input-sm" type="text" id="tipopagoBaucher" placeholder="Num. baucher">
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="limpiarModal();limpiar1modal()">Cancelar</button>
				<button type="button" class="btn btn-primary" id="pagoreg" onclick="swalpago()">Pagar</button>
				<a type="button" class="btn btn-success" id="printticket" onclick="cerrarpago()" data-bs-toggle="modal" data-bs-target="#ticket" hidden >Imprimir Ticket</a>
				<button type="button" class="btn btn-success" id="cerrarpago1" data-bs-dismiss="modal" hidden >Cerrar</button>
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
					<div class="col-4" hidden>
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
				<h5 class="offcanvas-title mb-3" id="offcanvasNavbarLabel">
					<a class="navbar-brand brand-logo" href="dashboard.php"><img src="../images/logo_conectwi_wide-removebg-preview.png" height="60px" alt="logo"/></a>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li>
						<hr>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle bloquearNav" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-clipboard2-check me-2" style="font-size: 22px"></i>
							Contratos
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#reporteContratos" onclick="consultaContratosRep()">Editar Contrato</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle bloquearMenus" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-exclamation-circle me-2" style="font-size: 22px"></i>
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
						<a class="nav-link dropdown-toggle bloquearMenus" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-wifi-off me-2" style="font-size: 22px"></i>
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
						<a class="nav-link dropdown-toggle bloquearNav" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-broadcast-pin me-2" style="font-size: 22px"></i>
							Inventario de Antenas
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" onclick="altaAntena()">Agregar Antena</a></li>
							<li><a class="dropdown-item" href="#" onclick="gestionAntenas()">Editar Antenas</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<hr>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-receipt me-2" style="font-size: 22px;"></i>
							Corte de Caja
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item corteCaja" href="#" id="menuOtrosGastos" onclick="modalOtrosGastos()">Agregar otros gastos</a></li>
							<li><a class="dropdown-item corteCaja" href="#" id="reporteOtrosGastos" onclick="modalReporteOtrosGastos()">Reporte otros gastos</a></li>
							<hr class="">
							<li><a class="dropdown-item corteCaja" href="#" id="menuCorteCaja" onclick="corteCajaDiario()">Generar Corte de Caja</a></li>
							<li><a class="dropdown-item" href="prcd/reporte_corte.php" target="_blank">Imprimir Corte de Caja</a></li>
							<li><a class="dropdown-item" href="#" onclick="queryListadoCorte()">Listado de Corte de Caja</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<hr>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-circle me-2" style="font-size: 22px"></i>
							Mi Cuenta
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" onclick="editarDatosUsr()">Editar mis datos</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" aria-expanded="false" href="prcd/sort.php">
							<i class="bi bi-door-closed me-2" style="font-size: 22px"></i>
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
				<p><strong>Folio pago:</strong> <span id="folioPagoRealizado"></span></p>
				<p><strong>fecha pago:</strong> <span id="fechaPagoRealizado"></span></p>
				<p><strong>Nombre:</strong> <span id="nombrePagoRealizado"></span></p>
				<p><strong>Total: </strong> <span id="totalPagoRealizado"></span></p>
			</div>

		  <p>
			<table class="table text-center table-striped table-sm" id="reimprimirTabla">
				<thead class="bg-dark text-light">
					<tr>
						<th>#</th>
						<th>Concepto</th>
						<!-- <th>Folio</th> -->
						<th>Total</th>
					</tr>
				</thead>
				<tbody id="tablaPagosBody"></tbody>
			</table>
		  </p>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="reimpirimirPago()">Reimpimir pago</button>
		  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
		</div>
	  </div>
	</div>
  </div>

<!-- Modal otros gastos -->
<div class="modal fade" id="modalOtrosGastos" tabindex="-1" aria-labelledby="modalOtrosGastosLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
		<div class="modal-header bg-secondary text-light">
		  <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-cash-coin"></i> Otros gastos</h1>
		  <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="limpiarModal();" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form id="formOtrosGastos">
				<div class=" mb-3">
					<label class="form-label" for="fechaOtrosGastos"><i class="bi bi-calendar4-event me-2"></i>Fecha:</label>
					<input type="date" class="form-control" aria-label="Fecha" aria-describedby="basic-addon1" id="fechaOtrosGastos">
				</div>
				<div class=" mb-3">
					<label class="form-label"><i class="bi bi-chat-square-quote-fill me-2"></i>Concepto de pago:</label>
					<input type="text" class="form-control" placeholder="Concepto" aria-label="Concepto" aria-describedby="basic-addon1" id="conceptoOtrosGastos">
				</div>
				<div class=" mb-3">
					<label class="form-label"><i class="bi bi-currency-dollar me-2"></i>Monto:</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">$</span>
						<input type="text" class="form-control" placeholder="Cantidad" aria-label="Cantidad" aria-describedby="basic-addon1" id="cantidadOtrosGastos" onkeypress="return soloNumeros(event)">
						<span class="input-group-text" id="basic-addon1">.00</span>
					</div>
				</div>
				<input type="text" id="idOtrosGastos" value="<?php echo $user ?>" hidden>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal();">Cerrar</button>
			<button type="button" class="btn btn-primary" onclick="guardarOtrosGastos()">Guardar</button>
		</div>
	  </div>
	</div>
  </div>

<!-- Modal reporte otros gastos -->
<div class="modal fade" id="modalReporteOtrosGastos" tabindex="-1" aria-labelledby="modalOtrosGastosLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
	  <div class="modal-content">
		<div class="modal-header bg-secondary text-light">
		  <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-cash-coin"></i> Reporte Otros gastos</h1>
		  <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<h3 class="mb-3">Capturado por: <?php echo $nombre ?></h3>
			<div class="row">
				<div class="col-10 d-flex align-items-center">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1"><i class="bi bi-calendar-check-fill"></i></span>
						<input type="date" class="form-control" placeholder="Fecha" aria-label="Fecha" aria-describedby="basic-addon1" id="fechaOtrosPagosDate" onchange="cambioFechaOtrosGastos()">
					</div>
				</div>
				<div class="col-2 d-flex justify-content-center mb-3">
					<button type="button" class="btn btn-primary" onclick="modalOtrosGastos()">Agregar +</button>
				</div>
			</div>
			
			<table class="table mt-3 text-center" id="reporteOtrosGastos">
				<thead class="table-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Concepto</th>
						<th scope="col">Fecha</th>
						<th scope="col">Cantidad</th>
					</tr>
				</thead>
				<tbody id="tablaOtrosGastos">
					
				</tbody>
			</table>


			<input type="text" id="idReporteTablaOtrosGastos" value="<?php echo $user ?>" hidden>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
			<a href="query/excel_query_otros_gastos.php?usr=<?php echo $user ?>" target="_blank" type="button" class="btn btn-primary" id="btnReporteTablaOtrosGastos">Excel</a>
			
		</div>
	  </div>
	</div>
  </div>

<!-- Modal reporte corte caja -->
<div class="modal fade" id="modalCorteDiario" tabindex="-1" aria-labelledby="modalOtrosGastosLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
	  <div class="modal-content">
		<div class="modal-header bg-secondary text-light">
		  <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-cash-coin"></i> Listado de cortes de caja del mes</h1>
		  <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<h3>Capturado por: <?php echo $user ?></h3>

			<div class="input-group mb-3 mt-3">
				<span class="input-group-text" id="basic-addon1"><i class="bi bi-calendar-check-fill"></i></span>
				<input type="date" class="form-control" aria-describedby="basic-addon1" id="fechaCorteCajaDate" onchange="cambioFechaCortesCaja()">
			</div>
			
			<table class="table mt-3 text-center">
				<thead class="table-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Descripción</th>
						<th scope="col">Fecha</th>
						<th scope="col">Estatus</th>
						<th scope="col">Ver</th>
					</tr>
				</thead>
				<tbody id="tablaCortesCajaD">
					
				</tbody>
			</table>


			<input type="text" id="idReporteTablaCorteCaja" value="<?php echo $idUsr ?>" hidden>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
			<a href="query/excel_query_otros_gastos.php?usr=<?php echo $user ?>" target="_blank" type="button" class="btn btn-primary" id="btnReporteCortesCaja">Excel</a>
			
		</div>
	  </div>
	</div>
  </div>