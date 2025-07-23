function _antenas(el){
  return document.getElementById(el);
}

// Inicia gestion de inventario de antenas

function altaAntena() {

    let titulo = "Agregar Antena";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'modalAltaAntena');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><i class="bi bi-broadcast-pin me-2"></i> ${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
              <form>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-check me-2"></i>Fecha</label>
                <input type="date" class="form-control" placeholder="" aria-label="Fecha de registro" id="fecha_alta_antena" aria-describedby="basic-addon1" disabled>
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-info-lg me-2"></i>Marca:</label>
                <input type="text" class="form-control" placeholder="Marca" aria-label="marca" id="marca_antena" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Modelo:</label>
                <input type="text" class="form-control" placeholder="Modelo" aria-label="modelo" id="modelo_antena" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-upc me-2"></i>Número de Serie</label>
                <input type="text" class="form-control" placeholder="Num. Serie" aria-label="numero de serie" id="numSerie_antena" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-code-square me-2"></i>MAC Address</label>
                <input type="text" class="form-control" placeholder="MAC Address" aria-label="MAC" id="macAdd_antena" aria-describedby="basic-addon1">
              </div>
              </form>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="nuevaAntena()">Guardar</button>
          </div>
        </div>
      </div>
    `;
  
    // Agregar el modal al body del documento
    document.body.appendChild(modal);
  
    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    _antenas("macAdd_antena").addEventListener('keyup', function() { 
      // remove non digits, break it into chunks of 2 and join with a colon
      this.value = 
        (this.value.toUpperCase()
        .replace(/[^\d|A-Z]/g, '')
        .match(/.{1,2}/g) || [])
        .join(".")
    });
    fechaRegistroAntena();

  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }
  
  function fechaRegistroAntena(){
    // Obtener los elementos input
    const inputFechaActual = document.getElementById('fecha_alta_antena');
    // Obtener la fecha actual
    const fechaActual = new Date();
  
    // Función para formatear la fecha en YYYY-MM-DD
    function formatearFecha(fecha) {
        const año = fecha.getFullYear();
        const mes = String(fecha.getMonth() + 1).padStart(2, '0'); // Meses van de 0 a 11
        const dia = String(fecha.getDate()).padStart(2, '0');
        return `${año}-${mes}-${dia}`;
    }
  
    // Formatear las fechas
    const fechaActualFormateada = formatearFecha(fechaActual);
  
    // Asignar las fechas a los inputs
    inputFechaActual.value = fechaActualFormateada;
  }
  
  function editarAntena(id) {
  
    let titulo = "Editar Antena";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'modalEditarAntena');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><i class="bi bi-broadcast-pin me-2"></i> ${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
            <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-check me-2"></i>Fecha</label>
                <input type="date" class="form-control" placeholder="" aria-label="Fecha de registro" id="fecha_alta_antenaEditar" aria-describedby="basic-addon1" disabled>
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-info-lg me-2"></i>Marca:</label>
                <input type="text" class="form-control" placeholder="Marca" aria-label="marca" id="marca_antenaEditar" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Modelo:</label>
                <input type="text" class="form-control" placeholder="Modelo" aria-label="modelo" id="modelo_antenaEditar" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-upc me-2"></i>Número de Serie</label>
                <input type="text" class="form-control" placeholder="Num. Serie" aria-label="numero de serie" id="numSerie_antenaEditar" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-code-square me-2"></i>MAC Address</label>
                <input type="text" class="form-control" placeholder="MAC Address" aria-label="MAC" id="macAdd_antenaEditar" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-wifi me-2"></i>IP Address</label>
                <input type="text" class="form-control" placeholder="IP Address" aria-label="IP" id="ipAdd_antenaEditar" aria-describedby="basic-addon1">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1"><i class="bi bi-sliders me-2"></i>Estatus</label>
                <select  class="form-select" aria-label="Estatus" id="estatus_antenaEditar">
                  <option value="1">Disponible</option>
                  <option value="2">Asignada</option>
                </select>
              </div>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="edicionAntena(${id})">Editar</button>
          </div>
        </div>
      </div>
    `;
  
    // Agregar el modal al body del documento
    document.body.appendChild(modal);
  
    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    _antenas("macAdd_antenaEditar").addEventListener('keyup', function() { 
      // remove non digits, break it into chunks of 2 and join with a colon
      this.value = 
        (this.value.toUpperCase()
        .replace(/[^\d|A-Z]/g, '')
        .match(/.{1,2}/g) || [])
        .join(".")
    });
    
    datosAntena(id);
  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }
  
  function gestionAntenas() {
    let titulo = "Gestión de Antenas";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.innerHTML = `
      <div class="modal-dialog modal-xl">>
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="bi bi-router-fill"></i> ${titulo}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input name="id" id="idHiddenAntenas" value="" hidden>
                <div class="row">
                  <div class="col-6">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscarAntenasGestion" name="buscarAntenasGestion">
                    </div>
                  </div>
                  <div class="col-5" mb-3>
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                      <input type="radio" class="btn-check" value="Disponible" name="btnradioAntenas" id="btnradio_antenaA">
                      <label class="btn btn-outline-success" for="btnradio_antenaA"><i class="bi bi-check-lg"></i> Disponibles</label>
                      
                      <input type="radio" class="btn-check" value="Asignada" name="btnradioAntenas" id="btnradio_antenaD">
                      <label class="btn btn-outline-danger" for="btnradio_antenaD"><i class="bi bi-x-lg"></i> Asignadas</label>
                  </div>
                </div>
                <div class="table-responsive mt-3">
                    <table class="table p-1 text-center table-striped table-bordered">
                        <thead class="table-dark text-center">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Num. Serie</th>
                                <th scope="col">MAC Address</th>
                                <th scope="col">Fecha Registro</th>
                                <th scope="col">Estatus</th>
                                <th scope="col"><i class="bi bi-people"></i></th>
                            </tr>
                        </thead>
                        <tbody id="tablaAntenas">
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger text-light" data-bs-dismiss="modal"><i class="bi bi-x-circle-fill"></i> Cerrar</button>
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
    cargarAntenas();

    $("#buscarAntenasGestion").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tablaAntenas tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  $(document).ready(function() {
    $('input[name="btnradioAntenas"]').on('change', function() {
        var value = $(this).val().toLowerCase();
        $("#tablaAntenas tr").each(function() {
            var rowText = $(this).text().toLowerCase();
            $(this).toggle(rowText.indexOf(value) > -1);
        });
    });
});
  
    // Eliminar el modal del DOM cuando se cierre
    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }

  function cargarAntenas(){
    $.ajax({
      url: 'query/query_antenas.php',
      type: 'POST',
      dataType: 'html',
      success: function (response) {
          $('#tablaAntenas').html(response);
      }
    });
  }
  
  function nuevaAntena(){
    let fecha_alta = _antenas('fecha_alta_antena').value;
    let marca = _antenas('marca_antena').value;
    let modelo = _antenas('modelo_antena').value;
    let serie = _antenas('numSerie_antena').value;
    let mac = _antenas('macAdd_antena').value;
    console.log(serie);
    if (fecha_alta === "" || marca === "" || modelo === "" || serie === "" || mac === "") {
      alert("Por favor, completa todos los campos de la antena.");
      return;
    }
    $.ajax({
      url: 'prcd/guardarAntena.php',
      type: 'POST',
      data: {
          fecha_alta: fecha_alta,
          marca: marca,
          modelo: modelo,
          serie: serie,
          mac: mac
      },
      success: function (response) {
          let data = JSON.parse(JSON.stringify(response));
          let success = data.success;
          if (success = 1) {
              alert("Antena guardado con éxito");
              $('#modalAltaAntena').modal('hide');
              // Recargar la tabla de paquetes
              cargarAntenas();
          }
          else {
              alert("Error al guardar el paquete");
              console.log(data.error);
          }
      }
    });

  }

  function datosAntena(id){
    $.ajax({
      url: 'query/query_datos_antenas.php',
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
          _antenas("marca_antenaEditar").value = datos.marca;
          _antenas("modelo_antenaEditar").value = datos.modelo;
          _antenas("numSerie_antenaEditar").value = datos.num_serie;
          _antenas("macAdd_antenaEditar").value = datos.mac;
          _antenas("fecha_alta_antenaEditar").value = datos.fecha_alta;
          _antenas("estatus_antenaEditar").value = estatus;
          _antenas("ipAdd_antenaEditar").value = datos.ipaddress;
          
          // if(estatus == 1){
          //   _('estatusEditarPaquete1').checked = true;
          // }
          // else{
          //   _('estatusEditarPaquete2').checked = true;
  
          // }
        }
        else{
            console.log(datos.error)
        }
      }
    });
  }

function eliminarAntena(id){
$.ajax({
        type: "POST",
        url: "../reportes/prcd/prcd_eliminar_antena.php", 
        data: {
            id: id
        },
        dataType: "json",
        success: function(response) {
          let data = JSON.parse(JSON.stringify(response));
            var success = data.success;
            if (success = 1) {
                alert("Antena eliminada correctamente.");
                cargarAntenas();
            }
            else {
                alert("Error al eliminar la Antena");
                console.log(data.error);
            }
        }
    });
}

  function edicionAntena(id){
    let fecha_alta = _antenas('fecha_alta_antenaEditar').value;
    let marca = _antenas('marca_antenaEditar').value;
    let modelo = _antenas('modelo_antenaEditar').value;
    let serie = _antenas('numSerie_antenaEditar').value;
    let mac = _antenas('macAdd_antenaEditar').value;
    let estatus = _antenas('estatus_antenaEditar').value;
    let ipaddress = _antenas('ipAdd_antenaEditar').value;

    if (fecha_alta === "" || marca === "" || modelo === "" || serie === "" || mac === "" || estatus === "" || ipaddress === "") {
      alert("Por favor, completa todos los campos de la antena.");
      return;
    }
    $.ajax({
      url: 'prcd/prcd_editar_antena.php',
      type: 'POST',
      data: {
          id: id,
          fecha_alta: fecha_alta,
          marca: marca,
          modelo: modelo,
          serie: serie,
          mac: mac,
          estatus: estatus,
          ipaddress: ipaddress
      },
      success: function (response) {
          let data = JSON.parse(JSON.stringify(response));
          let success = data.success;
          if (success = 1) {
              alert("Antena editada con éxito");
              $('#modalEditarAntena').modal('hide');
              // Recargar la tabla de paquetes
              cargarAntenas();
          }
          else {
              alert("Error al guardar el paquete");
              console.log(data.error);
          }
      }
    });

  }
  //Termina gestión de Antenas