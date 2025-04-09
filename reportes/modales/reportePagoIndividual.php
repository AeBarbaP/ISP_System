<?php
    echo '
        <div class="modal fade" id="reportePagoIndividual" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-cash-coin me-2"  style="font-size: 25px;"></i> Reporte de Pagos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-info" role="alert">
                            Nombre del cliente:
                            Número de Contrato:
                            Domicilio:
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label" id="basic-addon1">Folio:</label>
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="" aria-label="folio pago" id="folio_pago_reportes" value="" aria-describedby="basic-addon1" name="folio" disabled>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label" id="basic-addon1">Fecha:</label>
                                <div class="input-group mb-3">
                                    <input type="date" class="form-control" placeholder="" aria-label="fecha pago" id="fecha_pago_reportes" value="" aria-describedby="basic-addon1" name="fecha" disabled>
                                </div>
                            </div>
                        </div>
                        
                        <div class="table-responsive table-hover mt-3 mb-3">
                            <table class="table p-1 text-center table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Concepto</th>
                                        <th scope="col">Periodo</th>
                                        <th scope="col">Monto</th>                 
                                    </tr>
                                </thead>
                                <tbody id="tablaPagoIndividualG">
                                    
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label" id="basic-addon1">Tipo de Pago:</label>
                                <input type="text" class="form-control" placeholder="" aria-label="tipo pago" id="tipo_pago_reportes" value="" aria-describedby="basic-addon1" name="tipo" disabled>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label" id="basic-addon1">Total Pagado:</label>
                                <input type="text" class="form-control" placeholder="" aria-label="total pago" id="total_pago_reportes" value="" aria-describedby="basic-addon1" name="total" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <!-- <button type="button" class="btn btn-primary"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button> -->
                    </div>
                </div>
            </div>
        </div>
    ';
?>