<?php
    echo '
        <div class="modal fade" id="reporteFallasInd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                        <i class="bi bi-exclamation-triangle me-2" style="font-size: 25px; "></i>
                        
                        Reporte de Fallas</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                <table class="table">
                    <thead class="table-dark text-center">
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">Folio falla</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Técnico</th>
                        <th scope="col">Fecha reporte</th>
                        <th scope="col">Fecha resolución</th>
                        <th scope="col">Estatus</th>
                        </tr>
                    </thead>
                    <tbody id="reporteFallas">
                        
                    </tbody>
                </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="button" class="btn btn-primary" onclick="generarReporteIndClientes()"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>