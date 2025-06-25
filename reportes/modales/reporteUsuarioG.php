<?php
    echo '
        <div class="modal fade" id="reporteUsuarioG" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                        
                        <i class="bi bi-people-fill" me-2"  style="font-size: 25px;"></i> Reporte de Usuarios Global</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label" id="basic-addon1">Buscar:</label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                                    <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscar_pago" value="" aria-describedby="basic-addon1" name="nombre" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label" id="basic-addon1">Periodo del reporte:</label>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-arrow-bar-right" style="font-size: 20px;"></i></span>
                                        <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_pagos" value="" aria-describedby="basic-addon1" name="fechainicio" required>
                                        <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_pagos" value="" aria-describedby="basic-addon1" name="fechafinal" required>
                                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-arrow-bar-left" style="font-size: 20px;"></i></span>
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
                                <tbody id="tablaUsuariosIndG">
                                    
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <a href="#" type="button" class="btn btn-primary" id="reporteIndExcel"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte </a>
                    </div>
                </div>
            </div>
        </div>
    ';
?>