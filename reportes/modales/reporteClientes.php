<?php
    echo '
        <div class="modal fade" id="reporteClientes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-folder2-open me-2"  style="font-size: 25px;"></i> Reporte de Clientes</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <input name="id" id="idHidden" value="" hidden>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscar" aria-describedby="basic-addon1" name="nombre" oninput="consultaClientesRep(this.value)" required>
                        </div>
                        <div class="mb-3">
                            <select class="form-select" id="cliente_reporte_individual" size="4" aria-label="numero de cliente" onchange="datosClienteRepIN(this.value)">
                                <option selected>Selecciona...</option>
                                <!-- Muestra los folios de las incidencias que aún no han sido resueltas para cambiar los datos -->
                            </select>
                        </div>
                        <div class="alert alert-info" role="alert">
                            <strong>Información del cliente:</strong> 
                                <span id="nombreReporteCIND"></span>, <span id="domicilioReporteCIND"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" id="basic-addon1">Periodo del reporte:</label>
                            <div class="input-group mb-3">
                                
                                <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_reportec" value="" aria-describedby="basic-addon1" name="fechainicio" required>
                                <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_reportec" value="" aria-describedby="basic-addon1" name="fechafinal" required>
                                
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="tipoReporteCliente" class="form-label">Tipo Reporte:</label>
                            <select class="form-select" id="tipoReporteCliente" aria-label="Tipo reporte" required>
                                <option selected>Selecciona...</option>
                                <!-- <option value="1">Global</option> -->
                                <option value="2" selected>Detallado</option>
                            </select>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal()"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="generarReporteIndClientes()"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>