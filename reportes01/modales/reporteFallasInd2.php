<?php
    echo '
        <div class="modal fade" id="reporteFallasInd2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                        <i class="bi bi-exclamation-triangle me-2 text-danger" style="font-size: 25px; "></i>
                        
                        Reporte de Fallas</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label" id="basic-addon1">Buscar:</label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                                    <input type="text" class="form-control" placeholder="Buscar" aria-label="Buscar" id="buscar_inc_rep" value="" aria-describedby="basic-addon1" name="buscar_inc_rep" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label" id="basic-addon1">Periodo del reporte:</label>
                                    <div class="input-group mb-3">
                                    
                                        <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_incgral" value="" aria-describedby="basic-addon1" name="fechainicio" required onchange="modalFallasIndDate()">

                                        <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_incgral" value="" aria-describedby="basic-addon1" name="fechafinal" required onchange="modalFallasIndDate()">
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                            </div>
                            <div class="col-6 text-end">
                                <div class="btn-group align-items-end" role="group" aria-label="Basic radio toggle button group">
                                    
                                    <input type="radio" class="btn-check" value="Activa" name="btnradioFallasR" id="estatusinc1">
                                    <label class="btn btn-outline-primary" for="estatusinc1"><i class="bi bi-check-lg"></i> Activo</label>
                                    
                                    <input type="radio" class="btn-check" value="Resuelta" name="btnradioFallasR" id="estatusinc3">
                                    <label class="btn btn-outline-success" for="estatusinc3"><i class="bi bi-check-lg"></i> Resueltas</label>
                                    
                                    <input type="radio" class="btn-check" value="Cancelada" name="btnradioFallasR" id="estatusinc2">
                                    <label class="btn btn-outline-danger" for="estatusinc2"><i class="bi bi-x-lg"></i> Canceladas</label>
                                </div>
                            </div>
                        </div>
                    
                        <div class="table-responsive table-hover mt-3">
                            <table class="table table-sm align-middle table-striped table-bordered" id="tablaReportesFallasExcel">
                                <thead class="text-center align-middle table-dark text-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Folio falla</th>
                                        <th scope="col">Cliente</th>
                                        <th scope="col">Técnico</th>
                                        <th scope="col">Fecha reporte</th>
                                        <th scope="col">Estatus</th>
                                        <th scope="col"><i class="bi bi-eye"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="reporteFallas" class="text-center">
                                    
                                </tbody>
                            </table>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal()"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="exportarExcelFallas()"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>