function _(el){
    return document.getElementById(el);
}

// Función para abrir el modal dinámicamente
function reportesModal() {

    let titulo = "Reportes";
    let id = "modalNewUsr";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', id); // Agregar el atributo id
    modal.innerHTML = `
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="bi bi-journals me-2"></i>${titulo}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <div class="mb-4">
                            <label class="form-label" id="basic-addon1">Nombre completo:</label>
                            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1" id="nombreNew" placeholder="Nombre Completo">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" id="basic-addon1">Usuario:</label>
                            <input type="text" class="form-control" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1" id="usrNew">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" id="basic-addon1">Contraseña:</label>
                            <input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="pwdNew1">
                        </div>
                        <div class="input-group mb-3 justify-content-end">
                            <input class="form-check-input" type="checkbox" role="switch" id="mostrarPwd1" onchange="mostrarPwd1()">
                            <span class="input-group-btn ms-2">Mostrar password</i></span>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label" id="basic-addon1">Tipo de Usuario:</label>
                                <select class="form-select" aria-label="Default select example" id="tipoUsrNew">
                                    <option selected>Tipo de usuario ...</option>
                                    <option value="3">Usuario A</option>
                                    <option value="2">Usuario B</option>
                                    <option value="1">Administrador</option>
                                </select>
                            </div>
                            <div class="col-6 mb-3"> 
                                <label class="form-label" id="basic-addon1">Estatus:</label>
                                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                    <input type="radio" class="btn-check" value="1" name="btnradio" id="estatus1">
                                    <label class="btn btn-outline-success" for="estatus1"><i class="bi bi-check-lg"></i> Activo</label>
                                    <input type="radio" class="btn-check" value="2" name="btnradio" id="estatus2">
                                    <label class="btn btn-outline-danger" for="estatus2"><i class="bi bi-x-lg"></i> Inactivo</label>
                                </div>
                            </div>
                            <!-- <div class="col-6 mb-3">
                                <label class="form-label" id="basic-addon1">Estatus:</label>
                                <select class="form-select" aria-label="Default select example" id="estatusNew">
                                    <option value="" selected>Estatus de usuario ...</option>
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>
                                </select>
                            </div> -->
                        </div>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarUsr()">Guardar</button>
                </div>
            </div>
        </div>
        
    `;

    // Agregar el modal al body del documento
    document.body.appendChild(modal);

    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();

    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
        modal.remove();
    });
}

