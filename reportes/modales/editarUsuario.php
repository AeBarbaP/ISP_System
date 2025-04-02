<?php
    echo '
    
    <div class="modal fade" id="editar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-plus"></i> Editar Usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="id" id="idHidden" value="" hidden>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombreEditar" value="" aria-describedby="basic-addon1" name="nombre" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-workspace"></i></span>
                        <input type="text" class="form-control" placeholder="Usuario" aria-label="usuario" value="" id="userEditar" aria-describedby="basic-addon1"  name="username" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01">Perfil</span>

                        <select class="form-select" id="perfilEditar" value="" selected="selected" name="perfilselect">
                            <option value="1">Administrador</option>
                            <option value="2">Usuario</option>
                        </select>
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="estatus1">
                            <label class="btn btn-outline-success" for="estatus1"><i class="bi bi-check-lg"></i> Activo</label>
                            <input type="radio" class="btn-check" value="2" name="btnradio" id="estatus2">
                            <label class="btn btn-outline-danger" for="estatus2"><i class="bi bi-x-lg"></i> Inactivo</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-shield-lock-fill"></i></span>
                        <input type="password" class="form-control" placeholder="Contraseña" aria-label="contraseña" value="" aria-describedby="basic-addon1" name="pwd" id="passW">
                        <button class="btn btn-primary" type="button" id="btnShowPwd" onclick="myFunction()">
                            <svg class="bi" width="1.5em" height="1.5em" id="ojocerradoIcon"><use href="#ojoCerrado"></use></svg>
                            <i class="bi bi-eye" id="ojoabiertoIcon" hidden></i>
                        </button>
                    </div>
                    <!-- <input type="checkbox" > Mostrar Password  -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cancelar</button>
                    <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
    
    ';
?>