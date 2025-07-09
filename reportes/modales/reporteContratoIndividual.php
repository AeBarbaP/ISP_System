<?php
    echo '
        <div class="modal fade" id="reporteContratoIndividual" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-info-circle me-2" style="font-size: 25px;"></i>Información de Contrato</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="formSolicitudes2">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-4 mb-2">
                                    <label for="foliocontratoReporte" class="form-label"><h2>Folio:</h2></label>
                                    <input type="text" class="form-control" name="foliocontrato" id="folioContratoReporte" disabled>
                                </div>
                                <div class="col-sm-4 mb-2"></div>
                                <div class="col-sm-4 mb-2">
                                    <label for="date" class="form-label">Fecha de Contratación:</label>
                                    <input type="date" class="form-control" name="date" id="dateContratoReporte" placeholder="" disabled>
                                </div>
                            </div>

                            <!-- ... (resto del contenido del modal-body SIN cambios) ... -->

                        </div> <!-- Cierre de modal-body -->
                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                                <i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar
                            </button>
                            <button type="button" class="btn btn-warning">
                                <i class="bi bi-arrow-clockwise me-2" style="font-size: 20px;"></i>Actualizar Datos
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-floppy me-2" style="font-size: 20px;"></i>Guardar Cambios
                            </button>
                        </div>
                    </form> <!-- FORM ahora envuelve TODO el contenido -->
                </div>
            </div>
        </div>
    ';
?>