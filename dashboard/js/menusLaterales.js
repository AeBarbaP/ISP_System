// Función para abrir el modal dinámicamente
function nuevoUsuario() {

    let titulo = "Nuevo usuario";
    // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-regex"></i></span>
            <input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example">
                <option selected>Tipo de usuario ...</option>
                <option value="1">Usuario 1</option>
                <option value="2">Usuario 2</option>
                <option value="3">Usuario 3</option>
            </select>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example">
                <option value="" selected>Estatus de usuario ...</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
          </div>

          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary">Guardar</button>
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

function editarUsuario() {

    let titulo = "Editar usuario";
    // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control border-secondary" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-regex"></i></span>
            <input type="password" class="form-control border-secondary" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control border-secondary" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example">
                <option selected>Tipo de usuario ...</option>
                <option value="1">Usuario 1</option>
                <option value="2">Usuario 2</option>
                <option value="3">Usuario 3</option>
            </select>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example">
                <option value="" selected>Estatus de usuario ...</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
          </div>

          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary">Editar</button>
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