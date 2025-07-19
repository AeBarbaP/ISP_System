<?php
    echo '
        <div class="modal fade" id="reporteCorteInd2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" style="z-index: 1061;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                        <i class="bi bi-exclamation-triangle me-2 text-danger" style="font-size: 25px; "></i>
                        
                        Reporte de corte individual</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <span id="cortes_detalle"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                       
                    </div>
                </div>
            </div>
        </div>
    ';
?>