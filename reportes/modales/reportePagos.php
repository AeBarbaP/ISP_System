<?php
    echo '
        <div class="modal fade" id="reportePagos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-cash-coin me-2" style="font-size: 25px;"></i> Reporte de Pagos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="row">
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Periodo del reporte:</label> <!-- REMOVÍ id duplicado -->
                                    <div class="input-group mb-3">
                                        <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_pagosRep1" value="" name="fechainicio" onchange="buscarPagosRepFecha()" required>
                                        <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_inicio_pagosRep2" value="" name="fechafinal" onchange="buscarPagosRepFecha()" required>
                                    </div> <!-- ELIMINÉ la etiqueta </i></span> sobrante -->
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Filtrar:</label> <!-- REMOVÍ id duplicado -->
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i class="bi bi-search" style="font-size: 20px;"></i></span> <!-- REMOVÍ id duplicado -->
                                    <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscar_pagoREP" value="" name="nombre_buscar_pagoREP" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="table-responsive table-hover mt-3">
                            <table class="table p-1 text-center table-hover">
                                <thead class="table-dark text-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Folio</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Comunidad</th>
                                        <th scope="col">Fecha Pago</th>
                                        <th scope="col">Periodo Pago</th>
                                        <th scope="col">Total</th>
                                        <th scope="col"><i class="bi bi-eye"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="tablaPagosGRep"></tbody>
                            </table>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal()"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <a id="btnReportePagosRep" target="_blank" class="btn btn-primary"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</a> <!-- REMOVÍ type="button" -->
                    </div>
                </div>
            </div>
        </div>
    ';
?>