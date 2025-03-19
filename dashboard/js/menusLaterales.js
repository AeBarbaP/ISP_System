// ---------------- buscadores de datos -------------

// $(document).ready(function () {
//   $("#buscarNameUser").on("keyup", function () {
//       var value = $(this).val().toLowerCase();
//       $("#tablaUsuariosG tr").filter(function () {
//           $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//       });
//   });
// });

// ---------------- función _(el) -------------

function _(el){
  return document.getElementById(el);
}

// Función para abrir el modal dinámicamente
function nuevoUsuario() {

  let titulo = "Nuevo usuario";
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
          <h5 class="modal-title">${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          <div class="input-group mb-4">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1" id="nombreNew" placeholder="Nombre Completo">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1" id="usrNew">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-regex"></i></span>
            <input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="pwdNew1">
          </div>
          <div class="input-group mb-3 justify-content-end">
            <input class="form-check-input" type="checkbox" role="switch" id="mostrarPwd1" onchange="mostrarPwd1()">
            <span class="input-group-btn ms-2">Mostrar password</i></span>
          </div>
          <div class="row">
            <div class="input-group col-6 mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
              <select class="form-select" aria-label="Default select example" id="tipoUsrNew">
                  <option selected>Tipo de usuario ...</option>
                  <option value="3">Usuario A</option>
                  <option value="2">Usuario B</option>
                  <option value="1">Administrador</option>
              </select>
            </div>
            <div class="input-group col-6 mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
              <select class="form-select" aria-label="Default select example" id="estatusNew">
                  <option value="" selected>Estatus de usuario ...</option>
                  <option value="1">Activo</option>
                  <option value="0">Inactivo</option>
              </select>
            </div>
          </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarUsr(`+id+`)">Guardar</button>
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

function guardarUsr(){
  let usrNew = _("usrNew").value;
  let pwdNew = _("pwdNew").value;
  let nombreNew = _("nombreNew").value;
  let tipoUsrNew = _("tipoUsrNew").value;
  let estatusNew = _("estatusNew").value;

  $.ajax({
    url: 'prcd/guardarUsr.php',
    type: 'POST',
    data:{
      usrNew:usrNew,
      pwdNew:pwdNew,
      nombreNew,nombreNew,
      tipoUsrNew:tipoUsrNew,
      estatusNew:estatusNew
    },
    dataType: 'json',
    success: function(data) {
      var datos = JSON.parse(JSON.stringify(data));
    
            var success = datos.success;
    
            if (success == 1) {
              alert("Usuario guardado");
              $("#modalNewUsr").modal("hide");
              // Cerrar el modal usando la instancia guardada
              $("#modalNewUsr").on("hidden.bs.modal", function () {
                $(this).remove(); // Elimina el modal del DOM
              });
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            }
    }
  });

}

// ----------------------------------------------

function queryGestionUsr(){
  $.ajax({
    type: "POST",
    url: "query/gestionUsr.php",
    dataType: "html",
    success: function(data){
        $('#tablaUsuariosG').html(data);  
    }
});
}

// ----------------------------------------------


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
              <input type="text" class="form-control border-secondary" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
              <input type="text" class="form-control border-secondary" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1">
            </div>
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-regex"></i></span>
              <input type="password" class="form-control border-secondary" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="pwdNewUsr">
            </div>
            <div class="input-group mb-3 justify-content-end">
              <input class="form-check-input" type="checkbox" role="switch" id="mostrarPwd" onchange="mostrarPwd2()">
              <span class="input-group-btn ms-2">Mostrar password</i></span>
            </div>
            
            <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
              <select class="form-select" aria-label="Default select example">
                <option selected>Tipo de usuario ...</option>
                <option value="3">Usuario A</option>
                <option value="2">Usuario B</option>
                <option value="1">Administrador</option>
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

function gestionUsuarios(){
  let titulo = "Gestión de Usuarios";
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
                <input name="id" id="idHidden" value="" hidden>
                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscarNameUser">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01">Perfil</span>
                            <select class="form-select" id="buscarPerfilUser" value="" selected="selected" name="perfilselect">
                            <option value="" selected>Selecciona el perfil ...</option>
                                <option value="Administrador">Administrador</option>
                                <option value="Usuario A">Usuario A</option>
                                <option value="Usuario B">Usuario B</option>
                            </select>
                            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio1">
                                <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                            
                                <input type="radio" class="btn-check" value="2" name="btnradio" id="btnradio2">
                                <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                            </div>
                        </div>
                    </div>
                
                <!-- <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button> -->
                <div class="table-responsive mt-3">
                    <table class="table table-hover p-1">
                        <thead>
                            <tr class="text-center">
                                <th scope="col"></th>
                                <th scope="col">Perfil</th>
                                <th scope="col">Fecha de creación</th>
                                <th scope="col">Último logIn</th>
                                <th scope="col">Estatus</th>
                                <th scope="col">Nombre completo</th>
                                <th scope="col">Usuario</th>
                                <th scope="col" class=""><i class="bi bi-people"></i></th>
                            </tr>
                        </thead>
                        <tbody id="tablaUsuariosG">
                            
                        </tbody>
                    </table>
                </div>
                <!-- <input type="checkbox" > Mostrar Password  -->
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
  queryGestionUsr();

  $("#buscarNameUser").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $("#tablaUsuariosG tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  $("#buscarPerfilUser").on("change", function () {
    var value = $(this).val().toLowerCase();
    $("#tablaUsuariosG tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function queryTablaUsuario() {
  $.ajax({
    url: 'query/queryTabla.php',
    type: 'POST',
    dataType: 'HTML',
    success: function(response) {
      $('#tablaUsuariosG').html(response);
    }
  });
}


function nuevoTecnico() {

  let titulo = "Nuevo Técnico";
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
            <input type="date" class="form-control" placeholder="" aria-label="Fecha de creacion" id="fecha_creacion_tecnico" aria-describedby="basic-addon1" disabled>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_tecnico" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example" id="estatus_tecnico">
                <option value="" selected>Estatus...</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
          </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarTecnico()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaTecnico();

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaTecnico(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_creacion_tecnico');
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

function guardarTecnico(){
  let fecha = document.getElementById('fecha_creacion_tecnico').value;
  let nombre = document.getElementById('nombre_tecnico').value;
  let estatus_tecnico = document.getElementById('estatus_tecnico').value;

  $.ajax({
    url: 'prcd/guardarTecnico.php',
    type: 'POST',
    data:{
      fecha:fecha,
      nombre:nombre,
      estatus_tecnico,estatus_tecnico
    },
    dataType: 'json',
    success: function(data) {
      var datos = JSON.parse(JSON.stringify(data));
      var success = datos.success;

      if (success == 1) {
        alert("Técnico creado");
        
      }
      else{
          alert("No se guardó");
          console.log(datos.error)
      }
    }
  })
}

function gestionTecnicos() {
  let titulo = "Gestión de Técnicos";
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
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_tecnicoA">
                            <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                        
                            <input type="radio" class="btn-check" value="0" name="btnradio" id="btnradio_techicoI">
                            <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                        </div>
                    </div>
                </div>
              <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus"></i> Guardar Cambios</button>
              <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Fecha de creación</th>
                              <th scope="col">Nombre completo</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                          </tr>
                      </thead>
                      <tbody id="tablaTecnicos">
                          
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

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function editarTecnico() {

  let titulo = "Editar Técnico";
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
            <input type="date" class="form-control" placeholder="" aria-label="Fecha de creacion" id="fecha_creacion_tecnicoEditar" aria-describedby="basic-addon1" disabled>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_tecnico_editar" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example" id="estatus_tecnico_editar">
                <option value="" selected>Estatus...</option>
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
  fechaTecnico();

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

//Inicia Gestión de Paquetes

function nuevoPaquete() {

  let titulo = "Nuevo Paquete";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
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
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-cursor-text"></i></span>
            <input type="text" class="form-control" placeholder="Nombre del paquete" aria-label="nombre paquete" id="nombre_paquete" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-speedometer2"></i></span>
            <input type="number" class="form-control" placeholder="Velocidad" aria-label="velocidad" id="velocidad_paquete" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-cash-coin"></i></span>
            <input type="text" class="form-control" placeholder="Precio mensual" aria-label="precio" id="precio_paquete" aria-describedby="basic-addon1">
            <span class="input-group-text" id="basic-addon1">.00</span>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-toggles"></i></span>
            <select class="form-select" aria-label="Default select example" id="estatus_paquete">
                <option value="" selected>Estatus...</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
          </div>
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


function editarPaquete() {

  let titulo = "Editar Paquete";
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
            <input type="date" class="form-control" placeholder="" aria-label="Fecha de creacion" id="fecha_creacion_tecnicoEditar" aria-describedby="basic-addon1" disabled>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_tecnico_editar" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
            <select class="form-select" aria-label="Default select example" id="estatus_tecnico_editar">
                <option value="" selected>Estatus...</option>
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
  fechaTecnico();

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}
