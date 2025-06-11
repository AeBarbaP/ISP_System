<?php
    echo '
        <div class="modal fade" id="reporteIndividualTecnico" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-vcard me-2"  style="font-size: 25px;"></i> Reporte de Técnicos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- <input name="id" id="idHidden" value="" hidden> -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscarTec" value="" aria-describedby="basic-addon1" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <select class="form-select" id="tec_reporteInd" size="4" aria-label="reporte tecnicoInd">
                                <option selected>Selecciona...</option>
                                 <!-- todos los tecnicos activos -->
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Periodo del reporte:</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text"><i class="bi bi-arrow-bar-right" style="font-size: 20px;"></i></span>
                                <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_reportetec" value="" aria-describedby="basic-addon1" name="fechainicio" required>
                                <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_reportetec" value="" aria-describedby="basic-addon1" name="fechafinal" required>
                                <span class="input-group-text""><i class="bi bi-arrow-bar-left" style="font-size: 20px;"></i></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="tipoReporteUser" class="form-label">Tipo Reporte:</label>
                            <select class="form-select" id="tipoReporteTec" aria-label="Tipo reporte" required>
                                <option selected>Selecciona...</option>
                                <option value="1">Global</option>
                                <!--<option value="2">Detallado</option>-->
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="generarReporteTecnicos()"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>