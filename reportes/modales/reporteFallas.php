<?php
    echo '
        <div class="modal fade" id="reporteIndividualInc" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-vcard me-2"  style="font-size: 25px;"></i> Reporte de Fallas/Incidencias</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formReporteInc">
                        <input name="id" id="idHiddenInc" value="" hidden>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscarusr" value="" aria-describedby="basic-addon1" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <select class="form-select" id="inc_reporte" size="4" aria-label="reporte fallas">
                                <option selected>Selecciona...</option>
                                 <!-- todos los usuarios activos -->
                            </select>
                        </div>
                        <!-- <div class="mb-3">
                            <label class="form-label">Periodo del reporte:</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text"><i class="bi bi-arrow-bar-right" style="font-size: 20px;"></i></span>
                                <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_reporteinc" value="" aria-describedby="basic-addon1" name="fechainicio" required>
                                <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_reporteinc" value="" aria-describedby="basic-addon1" name="fechafinal" required>
                                <span class="input-group-text""><i class="bi bi-arrow-bar-left" style="font-size: 20px;"></i></span>
                            </div>
                        </div> 
                        <div class="mb-3">
                            <label for="tipoReporteUser" class="form-label">Tipo Reporte:</label>
                            <select class="form-select" id="tipoReporteInc" aria-label="Tipo reporte" required>
                                <option selected>Selecciona...</option>
                                <option value="Global">Global</option>
                                <option value="Detallado">Detallado</option>
                            </select>
                        </div> -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="submit" class="btn btn-primary" onclick="reporteFallaInd()"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>