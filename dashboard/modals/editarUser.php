<?php
echo '
<div class="modal fade" id="editarUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><i class="bi bi-person-plus"></i> Editar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="prcd/actualizaruseractivo.php" method="POST"><!--form-->
                <input name="id" value="'.$id.'" hidden>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-person"></i></span>
                    <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" value="'.$nombre.'" aria-describedby="basic-addon1" name="nombre" required>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-workspace"></i></span>
                    <input type="text" class="form-control" placeholder="Usuario" aria-label="usuario" value="'.$usuario.'" aria-describedby="basic-addon1" readonly>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01" readonly>Perfil</span>
                    <select class="form-select" id="inputGroupSelect01" value="'.$rowPerfil['perfil'].'" selected="selected" disabled>
                        <option value="'.$rowPerfil['id'].'" selected="selected" disabled>'.$rowPerfil['perfil'].'</option>
                    </select>

                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group" disabled>
                        <input type="radio" class="btn-check" value="1" id="btnradio1" ';
                        if($rowStatus['estatus'] ==  1){
                            echo 'checked="checked"';
                        } echo'
                        disabled>
                        <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                    
                        <input type="radio" class="btn-check" value="2" id="btnradio2"  
                        ';
                        if($rowStatus['estatus'] == 2){
                            echo 'checked="checked"';
                        }
                        echo'
                        disabled>
                        <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                        
                    </div>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-shield-lock-fill"></i></span>
                    <input type="password" class="form-control" placeholder="Contraseña" aria-label="contraseña" value="' . $rowStatus['pwd'] . '" aria-describedby="basic-addon1" name="pwd" id="passW">
                </div>
                <input type="checkbox" onclick="myFunction()"> Mostrar Password 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cancelar</button>
                <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button>
            </div>
            </form><!--form-->
        </div>
    </div>
</div>
';
?>