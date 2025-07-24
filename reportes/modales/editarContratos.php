<?php
echo'

<div class="modal fade" id="modalContratosEdit" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-pencil-square"></i> Editar contrato</h1>
                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editarContratoReportes">   
					<div class="row g-3">   
						<div class="col-sm-4">
							<label for="foliocontrato" class="form-label"><h2>Folio:</h2></label>
						<div>
							<input type="text" class="form-control" name="foliocontrato" id="folioLabelContratoEdit" disabled></input>
						</div>
						</div>
						<div class="col-sm-4">
						</div>
						<div class="col-sm-4">
							<label for="date" class="form-label mt-3">Fecha de Contratación:</label>
							<input type="date" class="form-control" name="date" id="dateContratoEdit" onchange="cambiarFecha()" placeholder="">
						</div>
						<h2>Datos del Cliente</h2>
						<div class="col-sm-12">
							<label for="name" class="form-label">Nombre Completo:</label>
							<input type="text" class="form-control" id="nombreCompletoEdit" name="name" placeholder="">
						</div>
						<div class="col-sm-4">
							<label for="calle" class="form-label">Domicilio:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="domicilioContratoEdit" name="calle" placeholder="">
							</div>
						</div>
						<div class="col-sm-4">
							<label for="colonia" class="form-label">Comunidad:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="catalogoComunidadesEdit" name="comunidad" placeholder="">
							</div>
							
						</div>
                    
						<div class="col-sm-4">
							<label for="municipio" class="form-label">Municipio:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="catalogoMunicipiosEdit" name="municipio" placeholder="">
							</div>
							
						</div>
						<div class="col-sm-4">
							<label for="estado" class="form-label">Estado:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="catalogoEstadosEdit" name="estado" placeholder="">
							</div>
							
						</div>
						<div class="col-sm-4">
							<label for="cp" class="form-label">C.P.:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="cpContratoEdit" name="cp" placeholder="">
							</div>
						</div>
						<div class="col-sm-4">
							<label for="telefono" class="form-label">Teléfono:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="telefonoContratoEdit" name="telefono" placeholder="">
							</div>
						</div>
						<div class="col-sm-12">
							<label for="referencias" class="form-label">Referencias de la vivienda:</label>
							<textarea type="text" class="form-control" rows="2" id="referenciasContratoEdit" name="referencias" placeholder=""></textarea>
						</div>
						
						<div class="col-sm-6">
							<label for="comprobante" class="form-label">Identificación:</label>
							<select class="form-select" id="identificacionContratoEdit" aria-label="comprobante" required>
								<option value="" selected>Selecciona...</option>
								<option value="INE">INE</option>
								<option value="INAPAM">INAPAM</option>
								<option value="Licencia">Licencia de Manejo</option>
							</select>
						</div>
						
						<div class="col-sm-6">
							<label for="comprobante" class="form-label">Comprobante de Domicilio:</label>
							<select class="form-select" id="comprobanteContratoEdit" aria-label="Default select example" required>
								<option value="" selected>Selecciona...</option>
								<option value="Luz">Recibo de Luz Eléctrica</option>
								<option value="Agua">Recibo del Agua</option>
								<option value="Cable">Recibo de Servicio de Televisión</option>
								<option value="Telefono">Teléfono fijo</option>
							</select>
						</div>
					
						<h3>Servicio Contratado</h3>
						<div class="col-sm-4">
							<label for="velocidad" class="form-label">Velocidad de Internet:</label>
							<select class="form-select" id="catalogoPaquetesEdit" aria-label="velocidad" onclick="cuotaMensual(this)" required></select>
						</div>
						
						<div class="col-sm-4">
							<label for="colonia" class="form-label">Asignar antena:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" name="antena" id="antenaContratoEdit">
							</div>

						</div>
						<div class="col-sm-4">
							<label for="ipAddress" class="form-label">IP asignada:</label>
							<div class="input-group input-group-sm mb-3">
								<input type="text" class="form-control" id="ipAddressContratoEdit" name="ipAddress" placeholder="">
							</div>
						</div>
						<div class="col-lg-12">
							<h2>Cuota Mensual</h2>
						</div>
						<div class="col-lg-12" id="mensualidad">
							<!-- <h2>$</h2>Carga los datos de la cuota mensual -->
							<input type="text" class="form-control" id="inputCostoEdit" disabled>
						</div>
						<div class="col-lg-6 mb-3" id="fechalimiteEdit">
							<h3>Fecha Límite de Pago</h3>
							<!-- <h3>DD/MMM</h3> -->
							<input type="date" class="form-control" id="siguienteMesInputEdit">
							<!-- Carga los datos de la cuota mensual -->
						</div>
						<div class="col-lg-6 mb-3" id="fechacorte">
							<h3>Fecha de Corte</h3>
							<!-- <h3>DD/MMM</h3> -->
							<input type="date" class="form-control" id="mesMasCincoDiasInputEdit">
							<!-- Carga los datos de la cuota mensual -->
						</div>
					</div>
				</form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="limpiarModal()">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="guardarbtn" onclick="guardarEditarContrato()" >Editar</button> <!-- Guarda registro de cliente nuevo y manda a modal de pago automáticamente -->
                    <button type="button" class="btn btn-success" id="imprimircbtn" onclick="contratoNuevo()">Imprimir Contrato</button>
                </div>
            </div>
        </div>
    </div>
</div>';
?>