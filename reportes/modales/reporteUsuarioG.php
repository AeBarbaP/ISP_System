<?php
    echo '
        <div class="modal fade" id="reporteUsuarioG" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <i class="bi bi-people-fill me-2" style="font-size: 25px;"></i> Reporte de Usuarios Global
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label">Buscar:</label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                                    <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscar_pago" name="nombreUsuariosGlobalR" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Periodo del reporte:</label>
                                    <div class="input-group mb-3">
                                        <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_pagos" name="fechainicio" required>
                                        <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_pagos" name="fechafinal" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="table-responsive table-hover mt-3">
                            <table class="table p-1 text-center table-hover">
                                <thead class="table-dark text-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">Acción</th>
                                        <th scope="col">Estatus</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaUsuariosIndG"></tbody>
                            </table>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal()">
                            <i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar
                        </button>
                        <a href="#" class="btn btn-primary" id="reporteIndExcel">
                            <i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte
                        </a>
                    </div>
                </div>
            </div>
        </div>
    ';
?>