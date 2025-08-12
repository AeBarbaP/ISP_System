<?php
echo'

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
				<p><strong>Fecha y hora de pago:</strong> <span id="fechaPagoRealizado"></span></p>
				<p>
					<strong>Nombre:</strong> <span id="nombrePagoRealizado"></span><br>
					<strong>Comunidad:</strong> <span id="comunidadPagoRealizado"></span>
				</p>
				<p>
					<strong>Periodo pagado: </strong> <span id="periodoPagoRealizado"></span><br>
					<strong>Total: </strong> <span id="totalPagoRealizado"></span>
				</p>
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
		  <button type="button" class="btn btn-danger" id="btnListaPagosInv" data-bs-toggle="modal">Cerrar</button>
		</div>
	  </div>
	</div>
  </div>

';