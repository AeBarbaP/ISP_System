//Inicia Gestión de Paquetes

function nuevoPaquete() {

    let titulo = "Nuevo Paquete";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'nuevoPaquete');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><i class="bi bi-box-seam me-2"></i> ${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
            
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Nombe del Paquete</label>
              <input type="text" class="form-control" placeholder="Nombre del paquete" aria-label="nombre paquete" id="nombre_paquete" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-speedometer2 me-2"></i>Velocidad</label>
              <input type="number" class="form-control" placeholder="Velocidad" aria-label="velocidad" id="velocidad_paquete" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cash-coin me-2"></i>Precio mensual</label>
              <div class="input-group">
              <input type="text" class="form-control" placeholder="Precio mensual" aria-label="precio" id="precio_paquete" aria-describedby="basic-addon1">
              <span class="input-group-text" id="basic-addon1">.00</span>
              </div>
            </div>
            <div class="mb-3"> 
              <label class="form-label" id="basic-addon1">Estatus:</label>
              <br>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" value="1" name="btnradio" id="estatus1">
                <label class="btn btn-outline-success" for="estatus1"><i class="bi bi-check-lg"></i> Activo</label>
                <input type="radio" class="btn-check" value="0" name="btnradio" id="estatus2">
                <label class="btn btn-outline-danger" for="estatus2"><i class="bi bi-x-lg"></i> Inactivo</label>
              </div>
            </div>
            <!-- <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-toggles me-2"></i>Estatus</label>
              <select class="form-select" aria-label="Default select example" id="estatus_paquete">
                  <option value="" selected>Estatus...</option>
                  <option value="1">Activo</option>
                  <option value="0">Inactivo</option>
              </select>
            </div> -->
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="guardarPaquete()">Guardar</button>
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
  
  
  function editarPaquete(id) {
  
    let titulo = "Editar Paquete";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'editarPaquete');
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
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i></label>
              <input type="text" class="form-control" placeholder="Nombre del paquete" aria-label="nombre paquete" id="nombre_paqueteEditar" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-speedometer2 me-2"></i></label>
              <input type="number" class="form-control" placeholder="Velocidad" aria-label="velocidad" id="velocidad_paqueteEditar" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cash-coin me-2"></i></label>
              <input type="text" class="form-control" placeholder="Precio mensual" aria-label="precio" id="precio_paqueteEditar" aria-describedby="basic-addon1">
              <span class="input-group-text" id="basic-addon1">.00</span>
            </div>
            <div class="mb-3"> 
              <label class="form-label" id="basic-addon1">Estatus:</label>
              <br>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" value="1" name="btnradioEditarPaquete" id="estatusEditarPaquete1">
                <label class="btn btn-outline-success" for="estatusEditarPaquete1"><i class="bi bi-check-lg"></i> Activo</label>
                <input type="radio" class="btn-check" value="0" name="btnradioEditarPaquete" id="estatusEditarPaquete2">
                <label class="btn btn-outline-danger" for="estatusEditarPaquete2"><i class="bi bi-x-lg"></i> Inactivo</label>
              </div>
            </div>
            <!-- <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-toggles"></i></span>
              <select class="form-select" aria-label="Default select example" id="estatus_paquete">
                  <option value="" selected>Estatus...</option>
                  <option value="1">Activo</option>
                  <option value="0">Inactivo</option>
              </select>
            </div> -->
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="editarDatosPaquete(${id})">Guardar</button>
          </div>
        </div>
      </div>
    `;
  
    // Agregar el modal al body del documento
    document.body.appendChild(modal);
  
    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    datosPaquete(id);
  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }
  
  function gestionPaquetes() {
    let titulo = "Gestión de Paquetes";
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
                          <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscarPaqueteEditar" name="buscar">
                      </div>
                  </div>
                  <div class="col-md-6">
                      <div class="input-group mb-3">
                          <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                              <input type="radio" class="btn-check" value="
                              Activo" name="btnradioPaquetes" id="btnradio_paqA">
                              <label class="btn btn-outline-success" for="btnradio_paqA"><i class="bi bi-check-lg"></i> Activo</label>
                          
                              <input type="radio" class="btn-check" value="Inactivo" name="btnradioPaquetes" id="btnradio_paqI">
                              <label class="btn btn-outline-danger" for="btnradio_paqI"><i class="bi bi-x-lg"></i> Inactivo</label>
                          </div>
                      </div>
                  </div>
                <div class="table-responsive mt-3">
                    <table class="table p-1 table-hover table-striped table-bordered text-center">
                        <thead class="table-dark text-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre Paquete</th>
                                <th scope="col">Velocidad</th>
                                <th scope="col">Mensualidad</th>
                                <th scope="col">Estatus</th>
                                <th scope="col"><i class="bi bi-people"></i></th>
                            </tr>
                        </thead>
                        <tbody id="tablaPaquetes">
                            
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
    cargarPaquetes();

    $("#buscarPaqueteEditar").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#tablaPaquetes tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    // var buscarPaqueteEditar = $('input[name="btnradioPaquetes"]:checked').val() || "";
    // buscarPaqueteEditar.on("change", function () {
    //     // var value = $(this).val().toLowerCase();
    //     $("#tablaPaquetes tr").filter(function () {
    //         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    //     });
    // });
  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }

function guardarPaquete() {
    let nombre = document.getElementById('nombre_paquete').value;
    let velocidad = document.getElementById('velocidad_paquete').value;
    let precio = document.getElementById('precio_paquete').value;
    let estatus = document.querySelector('input[name="btnradio"]:checked').value;

    // Validar los campos
    if (nombre === "" || velocidad === "" || precio === "" || estatus === "") {
        alert("Por favor, completa todos los campos.");
        return;
    }
    // Crear el objeto de datos

    $.ajax({
        url: 'prcd/guardarPaquete.php',
        type: 'POST',
        data: {
            nombre: nombre,
            velocidad: velocidad,
            precio: precio,
            estatus: estatus
        },
        success: function (response) {
            let data = JSON.parse(JSON.stringify(response));
            var success = data.success;
            if (success = 1) {
                alert("Paquete guardado con éxito");
                $('#nuevoPaquete').modal('hide');
                // Recargar la tabla de paquetes
                cargarPaquetes();
            }
            else {
                alert("Error al guardar el paquete");
                console.log(data.error);
            }
        }
    });
    // Limpiar los campos
    document.getElementById('nombre_paquete').value = "";
    document.getElementById('velocidad_paquete').value = "";
    document.getElementById('precio_paquete').value = "";
    document.querySelector('input[name="btnradio"]:checked').checked = false;
}
function cargarPaquetes() {
    $.ajax({
        url: 'query/query_tablaPaquetes.php',
        type: 'POST',
        dataType: 'html',
        success: function (response) {
            $('#tablaPaquetes').html(response);
        }
    });
}

// datos para editar técnico

function datosPaquete(id){
    $.ajax({
      url: 'query/queryPaquete.php',
      type: 'POST',
      data:{
        id:id
      },
      dataType: 'json',
      success: function(data) {
        var datos = JSON.parse(JSON.stringify(data));
        var success = datos.success;
        var estatus = datos.estatus;
  
        if (success == 1) {
          _("nombre_paqueteEditar").value = datos.nombre;
          _("velocidad_paqueteEditar").value = datos.velocidad;
          _("precio_paqueteEditar").value = datos.costo;
          // _("estatus_tecnico_editar").value = datos.estatus;
          if(estatus == 1){
            _('estatusEditarPaquete1').checked = true;
          }
          else{
            _('estatusEditarPaquete2').checked = true;
  
          }
        }
        else{
            console.log(datos.error)
        }
      }
    });
  }
  
  function editarDatosPaquete(id){
    // let id = _('idEditarTecnico').value;
    let nombre = _('nombre_paqueteEditar').value;
    let velocidad = _('velocidad_paqueteEditar').value;
    let precio = _('precio_paqueteEditar').value;
    var estatus;
    
    let radioSeleccionado = document.querySelector('input[name="btnradioEditarPaquete"]:checked');
  
    if (radioSeleccionado) {
      estatus = radioSeleccionado.value; // "1" (Activo) o "0" (Inactivo)
      console.log("Valor seleccionado:", estatus);
    } else {
        console.log("Ningún radio button seleccionado");
    }
  
    if(nombre == "" || estatus ==""){
      alert("Debes llenar todos los campos");
      return;
    }
    $.ajax({
      url: 'prcd/prcd_editar_paquete.php',
      type: 'POST',
      data:{
        id:id,
        nombre:nombre,
        velocidad:velocidad,
        precio:precio,
        estatus:estatus
      },
      dataType: 'json',
      success: function(data) {
        var datos = JSON.parse(JSON.stringify(data));
        var success = datos.success;
  
        if (success == 1) {
         alert('Datos editados correctamente');
         cargarPaquetes();
         $('#editarPaquete').modal('hide');
        }
        else{
            console.log(datos.error)
        }
      }
    });
  
  }


  // Termina gestión de paquetes