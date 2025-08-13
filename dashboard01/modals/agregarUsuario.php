<?php
    echo '
    
    <div class="modal fade" id="agregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-plus"></i> Agregar Usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" placeholder="Nombre completo" aria-label="Nombre" aria-describedby="basic-addon1" id="nombre" name="nombre" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-workspace"></i></span>
                        <input type="text" class="form-control" placeholder="Usuario" aria-label="usuario" aria-describedby="basic-addon1"  name="username" id="username" required>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01">Perfil</span>
                        <select class="form-select" id="perfil" name="perfil" required>
                            <option selected>Elige...</option>
                            <option value="1">Administrador</option>
                            <option value="2">Usuario</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-shield-lock-fill"></i></span>
                        <input type="text" class="form-control" placeholder="Contraseña" aria-label="contraseña" aria-describedby="basic-addon1"  name="pwd" id="pwd" required>
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-palette"></i></span>
                        <input type="color" class="form-control form-control-color" placeholder="Asignar color" aria-describedby="basic-addon1"  name="color" id="colorUser" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cancelar</button>
                    <button class="btn btn-primary" onclick="guardarUser()"><i class="bi bi-person-plus"></i> Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
    
    ';
?>