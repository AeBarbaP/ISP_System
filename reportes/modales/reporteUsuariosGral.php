<?php
    echo '
        <div class="modal fade" id="reportegeneralUsr" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-clipboard2-check me-2"  style="font-size: 25px;"></i> Reporte de Usuarios</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="limpiarModal()" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label" id="basic-addon1">Buscar:</label>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-search" style="font-size: 20px;"></i></span>
                                    <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_buscar_usr_rep" value="" aria-describedby="basic-addon1" name="nombreReporteUserG" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label" id="basic-addon1">Periodo del reporte:</label>
                                    <div class="input-group mb-3">
                                    
                                        <input type="date" class="form-control" placeholder="Fecha inicio" aria-label="fecha inicio" id="fecha_inicio_usrs" value="" aria-describedby="basic-addon1" name="fechainicio" required>
                                        
                                        <input type="date" class="form-control" placeholder="Fecha final" aria-label="fecha final" id="fecha_final_usrs" value="" aria-describedby="basic-addon1" name="fechafinal" required>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                            </div>
                            <div class="col-6 text-end">
                                <div class="btn-group align-items-end" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" value="1" name="btnradioRepFallas" id="estatususrs1">
                                    <label class="btn btn-outline-success" for="estatususrs1"><i class="bi bi-check-lg"></i> Activo</label>

                                    <input type="radio" class="btn-check" value="2" name="btnradioRepFallas" id="estatususrs2">
                                    <label class="btn btn-outline-warning" for="estatususrs2"><i class="bi bi-x-lg"></i> Inactivo</label>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive table-hover mt-3">
                            <table class="table p-1 table-striped table-bordered text-center">
                                <thead class="table-dark text-light">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col">Tipo Usuario</th>
                                        <th scope="col">Estatus</th>
                                        <th scope="col"><i class="bi bi-pen"></i></th>
                                    </tr>
                                </thead>
                                <tbody id="usr_tablaGral">
                                    
                                </tbody>
                            </table>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="limpiarModal()"><i class="bi bi-x-circle-fill me-2" style="font-size: 20px;"></i> Cerrar</button>
                        <button type="submit" class="btn btn-primary"><i class="bi bi-filetype-pdf me-2" style="font-size: 20px;"></i>Generar Reporte</button>
                    </div>
                </div>
            </div>
        </div>
    ';
?>