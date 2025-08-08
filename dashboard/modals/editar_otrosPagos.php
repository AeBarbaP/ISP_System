<?php
echo'
<!-- Modal otros gastos -->
<div class="modal fade" id="modalEditarOtrosGastos" tabindex="-1" aria-labelledby="modalOtrosGastosLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
		<div class="modal-header bg-secondary text-light">
		  <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-cash-coin"></i> Editar Otros Gastos</h1>
		  <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" onclick="limpiarModal();" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form id="formOtrosGastos">
				<div class=" mb-3">
					<label class="form-label" for="fechaEditarOtrosGastos"><i class="bi bi-calendar4-event me-2"></i>Fecha:</label>
					<input type="date" class="form-control" aria-label="Fecha" aria-describedby="basic-addon1" id="fechaEditarOtrosGastos">
				</div>
				<div class=" mb-3">
					<label class="form-label"><i class="bi bi-chat-square-quote-fill me-2"></i>Concepto de pago:</label>
					<input type="text" class="form-control" placeholder="Concepto" aria-label="Concepto" aria-describedby="basic-addon1" id="conceptoEditarOtrosGastos">
				</div>
				<div class=" mb-3">
					<label class="form-label"><i class="bi bi-currency-dollar me-2"></i>Monto:</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">$</span>
						<input type="text" class="form-control" placeholder="Cantidad" aria-label="Cantidad" aria-describedby="basic-addon1" id="cantidadEditarOtrosGastos" onkeypress="return soloNumeros(event)">
						<span class="input-group-text" id="basic-addon1">.00</span>
					</div>
				</div>

				<input id="idRowEditarOtrosGastos" hidden>

			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal();">Cerrar</button>
			<button type="button" class="btn btn-primary" onclick="guardarEditarOtrosGastos()">Guardar</button>
		</div>
	  </div>
	</div>
  </div>
';