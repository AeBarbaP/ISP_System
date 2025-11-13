<?php
echo '
    <div class="modal fade" id="contrato" data-bs-backdrop="static" data-bs-keyboard="false"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-plus-lg"></i>Contrato Nuevo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formSolicitudes">   
                    <div class="row g-3">   
                        <div class="col-sm-4">
                            <label for="foliocontrato" class="form-label"><h2>Folio:</h2></label>
                        <div id="folioLabel"></div>
                        </div>
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-4">
                            <label for="date" class="form-label">Fecha de Contratación:</label>
                            <input type="date" class="form-control" id="date" name="date" placeholder="" disabled>
                        </div>
                        <h2>Datos del Cliente</h2>
                        <div class="col-sm-12">
                            <label for="name" class="form-label">Nombre Completo:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="calle" class="form-label">Calle:</label>
                            <input type="text" class="form-control" id="calle" name="calle" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="colonia" class="form-label">Colonia:</label>
                            <input type="text" class="form-control" id="colonia" name="colonia" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="localidad" class="form-label">Localidad:</label>
                            <input type="text" class="form-control" id="localidad" name="localidad" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="municipio" class="form-label">Municipio:</label>
                            <input type="text" class="form-control" id="municipio" name="municipio" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="estado" class="form-label">Estado:</label>
                            <input type="text" class="form-control" id="estado" name="estado" placeholder="">
                        </div>
                        <div class="col-sm-4">
                            <label for="cp" class="form-label">C.P.:</label>
                            <input type="text" class="form-control" id="cp" name="cp" placeholder="">
                        </div>
                        <div class="col-sm-12">
                            <label for="referencias" class="form-label">Referencias de la vivienda:</label>
                            <textarea type="text" class="form-control" rows="2" id="referencias" name="referencias" placeholder=""></textarea>
                        </div>
                        <div class="col-sm-12">
                            <label for="horario" class="form-label">Horario de Instalación:</label>
                            <select class="form-select" id="horario" aria-label="horario" required>
                                <option selected>Selecciona...</option>
                                <option value="1">10:00 - 12:00 hr</option>
                                <option value="2">13:00 - 15:00 hr</option>
                                <option value="3">16:00 - 18:00 hr</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="comprobante" class="form-label">Identificación:</label>
                            <select class="form-select" id="identificacion" aria-label="comprobante" required>
                                <option selected>Selecciona...</option>
                                <option value="INE">INE</option>
                                <option value="INAPAM">INAPAM</option>
                                <option value="Pasaporte">Pasaporte</option>
                                <option value="Licencia">Licencia de Manejo</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="folioid" class="form-label">Folio de Identificación:</label>
                            <input type="text" class="form-control" id="folioid" name="folioid" placeholder="">
                        </div>
                        <div class="col-sm-6">
                            <label for="comprobante" class="form-label">Comprobante de Domicilio:</label>
                            <select class="form-select" id="comprobante" aria-label="Default select example" required>
                                <option selected>Selecciona...</option>
                                <option value="luz">Recibo de Luz Eléctrica</option>
                                <option value="agua">Recibo del Agua</option>
                                <option value="cable">Recibo de Servicio de Televisión</option>
                                <option value="telefono">Teléfono fijo</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="folio_comprobante" class="form-label">Folio Comprobante:</label>
                            <input type="text" class="form-control" id="folio_comprobante" name="folio_comprobante" placeholder="">
                        </div>
                        <h3>Servicio Contratado</h3>
                        <div class="col-sm-8">
                            <label for="velocidad" class="form-label">Paquete de Internet:</label>
                            <select class="form-select" id="velocidad" aria-label="velocidad" required>
                                <option value="" selected>Selecciona...</option>
                                <option value="80">80 GB</option>
                                <option value="160">160 GB</option>
                                <option value="320">320 GB</option>
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <label for="equipos" class="form-label">Número de equipos:</label>
                            <input type="number" class="form-control" id="equipos" name="equipos" placeholder="">
                        </div>
                        <div class="col-lg-12">
                            <h2>Cuota Mensual</h2>
                        </div>
                        <div class="col-lg-12" id="mensualidad">
                            <h2>$</h2><!-- Carga los datos de la cuota mensual -->
                        </div>
                        <div class="col-lg-6" id="fechalimite">
                            <h3>Fecha Límite de Pago</h3>
                            <h3>DD/MMM</h3>
                            <!-- Carga los datos de la cuota mensual -->
                        </div>
                        <div class="col-lg-6" id="fechacorte">
                            <h3>Fecha de Corte</h3>
                            <h3>DD/MMM</h3>
                            <!-- Carga los datos de la cuota mensual -->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="guardarbtn" onclick="" >Guardar</button>
                        <button type="button" class="btn btn-success" id="imprimircbtn" onclick="" >Imprimir Contrato</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
';
?>