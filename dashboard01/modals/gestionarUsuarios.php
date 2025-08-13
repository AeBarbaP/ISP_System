<?php
    echo '
    
    <div class="modal fade" id="gestionUsuarios" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">>
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-plus"></i> Gestión de Usuarios</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="id" id="idHidden" value="" hidden>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                                <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01">Perfil</span>
                                <select class="form-select" id="inputGroupSelect01" value="" selected="selected" name="perfilselect">
                                    <option value="1">Administrador</option>
                                    <option value="2">Usuario</option>
                                </select>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio1">
                                    <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                                
                                    <input type="radio" class="btn-check" value="2" name="btnradio" id="btnradio2">
                                    <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                                </div>
                            </div>
                        </div>
                    
                    <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button>
                    <div class="table-responsive mt-3">
                        <table class="table p-1">
                            <thead>
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">Perfil</th>
                                    <th scope="col">Fecha de creación</th>
                                    <th scope="col">Último logIn</th>
                                    <th scope="col">Estatus</th>
                                    <th scope="col">Nombre completo</th>
                                    <th scope="col">Usuario</th>
                                    <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                                </tr>
                            </thead>
                            <tbody id="tablaUsuariosG">
                                
                            </tbody>
                        </table>
                    </div>
                    <!-- <input type="checkbox" > Mostrar Password  -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cancelar</button>
                    <!-- <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button> -->
                </div>
            </div>
        </div>
    </div>
    
    ';
?>