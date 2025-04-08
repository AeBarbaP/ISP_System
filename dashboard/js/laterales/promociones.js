// Inicia gestión de promos
  
  function nuevaPromo() {
  
    let titulo = "Nueva Promoción";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'modalPromo');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><i class="bi bi-box-seam me-2"></i> ${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
              <div class="row">
                <div class="col-6 mb-3">
                  <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-week me-2"></i>Fecha Inicio</label>
                  <input type="datetime-local" class="form-control" placeholder="" aria-label="Fecha de inicio" id="fecha_inicio" aria-describedby="basic-addon1">
                </div>
                <div class="col-6 mb-3">
                  <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-week me-2"></i>Fecha Final</label>
                  <input type="datetime-local" class="form-control" placeholder="" aria-label="Fecha de fin" id="fecha_fin" aria-describedby="basic-addon1">
                </div>
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Nombre de Promoción</label>
                <input type="text" class="form-control" placeholder="Nombre de la promoción" aria-label="nombre promocion" id="nombre_promocion" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-card-checklist me-2"></i>Tipo</label>
                <select class="form-select" aria-label="Default select example" id="tipo_promo">
                    <option value="" selected>Promoción en...</option>
                    <option value="Mensualidad">Mensualidad</option>
                    <option value="Instalación">Instalación</option>
                    <option value="Recargos">Recargos</option>
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-piggy-bank me-2"></i>Descuento</label>
                <input type="text" class="form-control" placeholder="Descuento" aria-label="descuento" id="descuento_promo" aria-describedby="basic-addon1">
              </div>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="registrarPromocion()">Guardar</button>
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
  
  
  function editarPromo() {
  
    let titulo = "Editar Paquete";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'editarPromo');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><i class="bi bi-box-seam"></i> ${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
            <div class="input-group mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-week me-2"></i>Fecha Inicio:</label>
                <input type="datetime-local" class="form-control" placeholder="" aria-label="Fecha de inicio" id="fecha_inicio" aria-describedby="basic-addon1">
              </div>
              <div class="input-group mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-week me-2"></i>Fecha Final:</label>
                <input type="datetime-local" class="form-control" placeholder="" aria-label="Fecha de fin" id="fecha_fin" aria-describedby="basic-addon1">
              </div>
              <div class="input-group mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Nombre de la promoción:</label>
                <input type="text" class="form-control" placeholder="Nombre de la promoción" aria-label="nombre promocion" id="nombre_promocion" aria-describedby="basic-addon1">
              </div>
              <div class="input-group mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-card-checklist me-2"></i>Tipo</label>
                <select class="form-select" aria-label="Default select example" id="tipo_promo">
                    <option value="" selected>Promoción en...</option>
                    <option value="Mensualidad">Mensualidad</option>
                    <option value="Instalación">Instalación</option>
                    <option value="Recargos">Recargos</option>
                </select>
              </div>
              <div class="input-group mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-piggy-bank me-2"></i>Descuento:</label>
                <input type="number" class="form-control" placeholder="Descuento" aria-label="descuento" id="descuento_promo" aria-describedby="basic-addon1">
              </div>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="guardarPromo()">Guardar</button>
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
  
  function gestionPromos() {
    let titulo = "Gestión de Promociones";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.innerHTML = `
      <div class="modal-dialog modal-xl">>
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${titulo}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input name="id" id="idHiddenPaq" value="" hidden>
                <div class="row">
                  <div class="col-md-6">
                      <div class="input-group mb-3">
                          <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                          <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                      </div>
                  </div>
                  <div class="col-md-6 mt-1">
                      <div class="input-group mb-3">
                          <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                              <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_promoA">
                              <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                          
                              <input type="radio" class="btn-check" value="0" name="btnradio" id="btnradio_promoI">
                              <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                          </div>
                      </div>
                  </div>
                <div class="table-responsive mt-3">
                    <table class="table p-1 text-center">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre Promoción</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Descuento</th>
                                <th scope="col">Inicio</th>
                                <th scope="col">Final</th>
                                <th scope="col">Estatus</th>
                                <th scope="col"><i class="bi bi-pencil-square"></i></th>
                            </tr>
                        </thead>
                        <tbody id="tablaPromos">
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger text-light" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cancelar</button>
                <!-- <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button> -->
            </div>
        </div>
      </div>
    `;
  
    // Agregar el modal al body del documento
    document.body.appendChild(modal);
  
    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    queryPromos();
  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }

  function queryPromos() {
    $.ajax({
        type: "POST",
        url: "query/query_promociones.php", 
        success: function(response) {
          $('#tablaPromos').html(response);
        },
      });
  }

  function registrarPromocion() {
    let fecha_inicio = document.getElementById("fecha_inicio").value;
    let fecha_fin = document.getElementById("fecha_fin").value;
    let nombre_promocion = document.getElementById("nombre_promocion").value;
    let tipo_promocion = document.getElementById("tipo_promo").value;
    let descuento_promo = document.getElementById("descuento_promo").value;

        $.ajax({
            type: "POST",
            url: "prcd/registrar_promocion.php", // Archivo PHP que registrará el pago
            data: { 
                fecha_inicio: fecha_inicio,
                fecha_fin: fecha_fin,
                nombre_promocion: nombre_promocion,
                tipo_promocion: tipo_promocion,
                descuento_promo: descuento_promo
            },
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    alert("Promoción registrada correctamente.");
                    $('#modalPromo').modal('hide');

                } else {
                    alert("Error al registrar promoción: " + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al registrar el pago.");
            }
        });
    
}
  
  // Termina gestión de promociones