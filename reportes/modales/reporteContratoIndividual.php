<?php
    echo '
        <div class="modal fade" id="reporteContratoIndividual" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-info-circle me-2"  style="font-size: 25px;"></i>Información de Contrato</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body mb-2">
                    <form id="formSolicitudes2">   
                        <div class="row ">   
                            <div class="col-sm-4 mb-2 mb-2">
                                <label for="foliocontratoReporte" class="form-label"><h2>Folio:</h2></label>
                            
                                <input type="text" class="form-control" name="foliocontrato" id="folioContratoReporte" disabled>
                            </div>
                            <div class="col-sm-4 mb-2 mb-2">
                            </div>
                            <div class="col-sm-4 mb-2">
                                <label for="date" class="form-label">Fecha de Contratación:</label>
                                <input type="date" class="form-control" name="date" id="dateContratoReporte" placeholder="" disabled>
                            </div>
                        </div>
                        <h2>Datos del Cliente</h2>
                        <div class="col-sm-12 mb-2">
                            <label for="name" class="form-label">Nombre Completo:</label>
                            <input type="text" class="form-control" id="nombreCompletoReporte" name="name" placeholder="" disabled>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 mb-2">
                                <label for="calle" class="form-label">Domicilio:</label>
                                <input type="text" class="form-control" id="domicilioContratoReporte" name="calle" placeholder="" disabled>
                            </div>
                            <div class="col-sm-4 mb-2">
                                <label for="colonia" class="form-label">Comunidad:</label>
                                <select class="form-select" name="" id="catalogoComunidadesReporte" disabled></select>
                            </div>
                            <div class="col-sm-4 mb-2">
                                <label for="municipio" class="form-label">Municipio:</label>
                                <select class="form-select" name="" id="catalogoMunicipiosReporte" disabled></select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 mb-2">
                                <label for="estado" class="form-label">Estado:</label>
                                <select class="form-select" name="" id="catalogoEstadosReporte" disabled></select>
                            </div>
                            <div class="col-sm-4 mb-2">
                                <label for="cp" class="form-label">C.P.:</label>
                                <input type="text" class="form-control" id="cpContratoReporte" name="cp" placeholder="" disabled>
                            </div>
                            <div class="col-sm-4 mb-2">
                                <label for="telefono" class="form-label">Teléfono:</label>
                                <input type="text" class="form-control" id="telefonoContratoReporte" name="telefono" placeholder="" disabled>
                            </div>
                        </div>
                        <div class="col-sm-12 mb-2">
                            <label for="referencias" class="form-label">Referencias de la vivienda:</label>
                            <textarea type="text" class="form-control" rows="2" id="referenciasContratoReporte" name="referencias" placeholder="" disabled></textarea>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label for="comprobante" class="form-label">Identificación:</label>
                                <select class="form-select" id="identificacionContratoReporte" aria-label="comprobante" required disabled>
                                    <option selected>Selecciona...</option>
                                    <option value="INE">INE</option>
                                    <option value="INAPAM">INAPAM</option>
                                    <option value="Licencia">Licencia de Manejo</option>
                                </select>
                            </div>
                            <div class="col-sm-6 mb-2">
                                <label for="comprobante" class="form-label">Comprobante de Domicilio:</label>
                                <select class="form-select" id="comprobanteContratoReporte" aria-label="Default select example" required disabled>
                                    <option selected>Selecciona...</option>
                                    <option value="luz">Recibo de Luz Eléctrica</option>
                                    <option value="agua">Recibo del Agua</option>
                                    <option value="cable">Recibo de Servicio de Televisión</option>
                                    <option value="telefono">Teléfono fijo</option>
                                </select>
                            </div>
                        </div>
                        <h3>Servicio Contratado</h3>
                        <div class="col-sm-8 mb-2">
                            <label for="velocidad" class="form-label">Velocidad de Internet:</label>
                            <select class="form-select" id="catalogoPaquetesReporte" aria-label="velocidad" onclick="cuotaMensual(this)" required disabled></select>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label for="antena" class="form-label">MAC Antena:</label>
                                <input type="number" class="form-control" id="antenaContratoReporte" name="antena" placeholder="" disabled>
                            </div>
                            <div class="col-sm-6 mb-2">
                                <label for="ipAddressReporte" class="form-label">IP asignada:</label>
                                <input type="number" class="form-control" id="ipAddressContratoReporte" name="ipAddress" placeholder="" disabled>
                            </div>
                        </div>
                        <div class="col mb-2">
                            <h2>Cuota Mensual</h2>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-6 mb-2" id="mensualidadReporte">
                                <!-- <h2>$</h2>Carga los datos de la cuota mensual -->
                                <input type="text" class="form-control" id="inputCostoReporte" disabled>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 mb3" id="fechalimiteReporte">
                                <h3>Fecha Límite de Pago</h3>
                                <!-- <h3>DD/MMM</h3> -->
                                <input type="date" class="form-control" id="siguienteMesInputReporte" disabled>
                                <!-- Carga los datos de la cuota mensual -->
                            </div>
                            <div class="col-lg-6 mb-3" id="fechacorteReporte">
                                <h3>Fecha de Corte</h3>
                                <!-- <h3>DD/MMM</h3> -->
                                <input type="date" class="form-control" id="mesMasCincoDiasInputReporte" disabled>
                                <!-- Carga los datos de la cuota mensual -->
                            </div>
                        </div>
                    </div>
                </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="button" class="btn btn-warning"><i class="bi bi-arrow-clockwise me-2" style="font-size: 20px;"></i>Actualizar Datos</button>
                        <button type="submit" class="btn btn-primary"><i class="bi bi-floppy me-2" style="font-size: 20px;"></i>Guardar Cambios</button>
                        <!-- <button type="button" class="btn btn-primary"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Imprimir Contrato</button> -->
                    </div>
                </div>
            </div>
        </div>
    ';
?>