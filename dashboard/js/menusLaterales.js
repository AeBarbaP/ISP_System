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
  let pwdNew = _("pwdNew1").value;
  let nombreNew = _("nombreNew").value;
  let tipoUsrNew = _("tipoUsrNew").value;
  // let estatusNew = _("estatusNew").value;
  let radioSeleccionado = document.querySelector('input[name="btnradio"]:checked');
  let estatusNew = radioSeleccionado.value;

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


function editarUsuario(id) {
    let titulo = "Editar usuario";
    // Crear el elemento del modal
    const modal = document.createElement('div');
    modal.classList.add('modal', 'fade');
    modal.setAttribute('tabindex', '-1');
    modal.setAttribute('id', 'modalEditarUsr');
    modal.innerHTML = `
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">${titulo}</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
          <input id="editarId" hidden>
            <p>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1">Usuario:</label>
                <input type="text" class="form-control border-secondary" placeholder="Usuario" aria-label="Usuario" aria-describedby="basic-addon1" id="editarUsr" disabled>
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1">Nombre Completo:</label>
                <input type="text" class="form-control border-secondary" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1"
                id="editarnombreUsr">
              </div>
              <div class="mb-3">
                <label class="form-label" id="basic-addon1">Contraseña:</label>
                <input type="password" class="form-control border-secondary" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="editarcontraseniaUsr">
              </div>
              <div class="input-group mb-3 justify-content-end">
                <input class="form-check-input" type="checkbox" role="switch" id="mostrarPwd" onchange="mostrarPwd2()">
                <span class="input-group-btn ms-2">Mostrar password</i></span>
              </div>
              <div class="row">
                <div class="col-6 mb-3">
                  <label class="form-label" id="basic-addon1">Tipo de Usuario:</label>
                  <select class="form-select" aria-label="Default select example" id="tipoUsrEditar">
                    <option selected>Tipo de usuario ...</option>
                    <option value="3">Usuario A</option>
                    <option value="2">Usuario B</option>
                    <option value="1">Administrador</option>
                  </select>
                </div>
                <div class="col-6 mb-3"> 
                  <label class="form-label" id="basic-addon1">Estatus:</label>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" value="1" name="btnradio" id="estatusEditarUsr1">
                    <label class="btn btn-outline-success" for="estatusEditarUsr1"><i class="bi bi-check-lg"></i> Activo</label>
                    <input type="radio" class="btn-check" value="2" name="btnradio" id="estatusEditarUsr2">
                    <label class="btn btn-outline-danger" for="estatusEditarUsr2"><i class="bi bi-x-lg"></i> Inactivo</label>
                  </div>
                </div>
              </div>
              <!-- <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-fill-add"></i></span>
                <select class="form-select" aria-label="Default select example">
                  <option value="" selected>Estatus de usuario ...</option>
                  <option value="1">Activo</option>
                  <option value="0">Inactivo</option>
                </select>
              </div> -->

            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary" onclick="editarUsuarioFinal()">Editar</button>
          </div>
        </div>
      </div>
    `;

    // Agregar el modal al body del documento
    document.body.appendChild(modal);

    // Mostrar el modal usando Bootstrap's JavaScript API
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
    // Llamar a la función para llenar los datos del usuario
    datosEdicionUsr(id);

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
                    <div class="col-md-6 mt-1">
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
                        <thead class="text-center bg-dark text-light">
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

function datosEdicionUsr(id) {
  $.ajax({
    url: 'query/queryEdicionUsuario.php',
    type: 'POST',
    data: {
      id: id
    },
    dataType: 'JSON',
    success: function(response) {
      // Llenar los campos del formulario con los datos del usuario
      let datos = JSON.parse(JSON.stringify(response));
      let success = datos.success;
      if (success == 1) {
        _("editarId").value = datos.id;
        _("editarUsr").value = datos.username;
        _("editarnombreUsr").value = datos.nombre;
        _("editarcontraseniaUsr").value = datos.pwd;
        _("tipoUsrEditar").value = datos.tipo_usr;

        if(datos.estatus == 1){
          _('estatusEditarUsr1').checked = true;
        }
        else{
          _('estatusEditarUsr2').checked = true;
        }

      }
    }
  });
}

function editarUsuarioFinal(){
  let id = _("editarId").value;
  let username = _("editarUsr").value;
  let nombre = _("editarnombreUsr").value;
  let pwd = _("editarcontraseniaUsr").value;
  let tipo_usr = _("tipoUsrEditar").value;
  
  let estatus;
  if(_('estatusEditarUsr1').checked){
    estatus = 1;
  }
  else{
    estatus = 2;
  }
  $.ajax({
    url: 'prcd/prcd_editar_usuario.php',
    type: 'POST',
    data: {
      id: id,
      username: username,
      nombre: nombre,
      pwd: pwd,
      tipo_usr: tipo_usr,
      estatus: estatus
      },
    dataType: 'JSON',
    success: function(response) {
      let datos = JSON.parse(JSON.stringify(response));
      let success = datos.success;
      if (success == 1) {
        alert('Usuario editado correctamente');
        // Cerrar el modal usando la instancia guardada
        $("#modalEditarUsr").modal('hide');
        queryGestionUsr();
      } 
    }
  });
  // Cerrar el modal
  $('#modalEditar').modal('hide');
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
          <h5 class="modal-title"><i class="bi bi-person-fill-add"> </i>${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          <div class="mb-3">
            <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-plus me-2"></i> Fecha:</label>
            <input type="date" class="form-control" placeholder="" aria-label="Fecha de creacion" id="fecha_creacion_tecnico" aria-describedby="basic-addon1" disabled>
          </div>
          <div class="mb-3">
            <label class="form-label" id="basic-addon1"><i class="bi bi-person-fill-add me-2"></i>Nombre completo:</label>
            <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_tecnico" aria-describedby="basic-addon1">
          </div>
          <div class="mb-3"> 
            <label class="form-label" id="basic-addon1">Estatus:</label>
            <br>
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
              <input type="radio" class="btn-check" value="1" name="btnradio" id="estatus1">
              <label class="btn btn-outline-success" for="estatus1"><i class="bi bi-check-lg"></i> Activo</label>
              <input type="radio" class="btn-check" value="2" name="btnradio" id="estatus2">
              <label class="btn btn-outline-danger" for="estatus2"><i class="bi bi-x-lg"></i> Inactivo</label>
            </div>
          </div>
          <!-- <div class="mb-3">
            <label class="form-label" id="basic-addon1"></label>
            <select class="form-select" aria-label="Default select example" id="estatus_tecnico">
                <option value="" selected>Estatus...</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
          </div> -->
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

function fechaTecnicoE(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_creacion_tecnicoEditar');
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
              <div class="table-responsive mt-3">
                  <table class="table table-hover p-1">
                      <thead class="text-center bg-dark text-light">
                          <tr>
                              <th scope="col">#</th>
                              <th scope="col">Fecha de creación</th>
                              <th scope="col">Nombre completo</th>
                              <th scope="col">Estatus</th>
                              <th scope="col">Editar</th>
                          </tr>
                      </thead>
                      <tbody id="tablaTecnicos" class="text-center">
                          
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

  queryTecnicos();

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function queryTecnicos(){
  $.ajax({
    url: 'query/queryTecnicos.php',
    type: 'POST',
    dataType: 'html',
    success: function(data) {
      $('#tablaTecnicos').html(data);
    }
  })
}

function cambioEstatus(i,id){
  if (confirm("¿Desea cambiar el estatus?")){
    $.ajax({
      url: 'prcd/cambioEstatus.php',
      type: 'POST',
      data:{
        i:i,
        id:id
      },
      dataType: 'json',
      success: function(data) {
        var datos = JSON.parse(JSON.stringify(data));
        var success = datos.success;

        if (success == 1) {
          alert("Estatus modificado");
          queryTecnicos();
          
        }
        else{
            alert("No se modificó");
            console.log(datos.error)
        }
      }
    })
  }
}

function editarTecnico(id) {

  let titulo = "Editar Técnico";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.setAttribute('id', 'modalEditarTecnico');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-pencil-square me-2"></i>${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <input id="idEditarTecnico" value="${id}" hidden>
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de creacion" id="fecha_creacion_tecnicoEditar" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-circle me-2"></i>Nombre Completo</label>
              <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" id="nombre_tecnico_editar" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3"> 
              <label class="form-label" id="basic-addon1">Estatus:</label>
              <br>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" value="1" name="btnradioEditarTecnico" id="estatusEditarTecnico1">
                <label class="btn btn-outline-success" for="estatusEditarTecnico1"><i class="bi bi-check-lg"></i> Activo</label>
                <input type="radio" class="btn-check" value="0" name="btnradioEditarTecnico" id="estatusEditarTecnico2">
                <label class="btn btn-outline-danger" for="estatusEditarTecnico2"><i class="bi bi-x-lg"></i> Inactivo</label>
              </div>
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="editarDatosTecnico()"><i class="bi bi-pencil-square"></i> Editar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaTecnicoE();
  datosTecnico(id);

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

// datos para editar técnico

function datosTecnico(id){
  $.ajax({
    url: 'query/queryTecnicos2.php',
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
        _("nombre_tecnico_editar").value = datos.nombre;
        // _("estatus_tecnico_editar").value = datos.estatus;
        if(estatus == 1){
          _('estatusEditarTecnico1').checked = true;
        }
        else{
          _('estatusEditarTecnico2').checked = true;

        }
      }
      else{
          console.log(datos.error)
      }
    }
  });
}

function editarDatosTecnico(){
  let id = _('idEditarTecnico').value;
  let fecha = _('fecha_creacion_tecnicoEditar').value;
  let nombre = _('nombre_tecnico_editar').value;
  let estatus;
  
  const radioSeleccionado = document.querySelector('input[name="btnradioEditarTecnico"]:checked');

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
    url: 'prcd/prcd_editar_tecnico.php',
    type: 'POST',
    data:{
      id:id,
      fecha:fecha,
      nombre:nombre,
      estatus:estatus
    },
    dataType: 'json',
    success: function(data) {
      var datos = JSON.parse(JSON.stringify(data));
      var success = datos.success;

      if (success == 1) {
       alert('Datos editados correctamente');
       queryTecnicos();
       $('#modalEditarTecnico').modal('hide');
      }
      else{
          console.log(datos.error)
      }
    }
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
              <input type="radio" class="btn-check" value="2" name="btnradio" id="estatus2">
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
          <h5 class="modal-title"><i class="bi bi-box-seam"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          
          <div class="input-group mb-3">
            <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i></label>
            <input type="text" class="form-control" placeholder="Nombre del paquete" aria-label="nombre paquete" id="nombre_paquete" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <label class="form-label" id="basic-addon1"><i class="bi bi-speedometer2 me-2"></i></label>
            <input type="number" class="form-control" placeholder="Velocidad" aria-label="velocidad" id="velocidad_paquete" aria-describedby="basic-addon1">
          </div>
          <div class="input-group mb-3">
            <label class="form-label" id="basic-addon1"><i class="bi bi-cash-coin me-2"></i></label>
            <input type="text" class="form-control" placeholder="Precio mensual" aria-label="precio" id="precio_paquete" aria-describedby="basic-addon1">
            <span class="input-group-text" id="basic-addon1">.00</span>
          </div>
          <div class="mb-3"> 
            <label class="form-label" id="basic-addon1">Estatus:</label>
            <br>
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
              <input type="radio" class="btn-check" value="1" name="btnradio" id="estatus1">
              <label class="btn btn-outline-success" for="estatus1"><i class="bi bi-check-lg"></i> Activo</label>
              <input type="radio" class="btn-check" value="2" name="btnradio" id="estatus2">
              <label class="btn btn-outline-danger" for="estatus2"><i class="bi bi-x-lg"></i> Inactivo</label>
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
                        <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group mb-3">
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_paqA">
                            <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Activo</label>
                        
                            <input type="radio" class="btn-check" value="0" name="btnradio" id="btnradio_paqI">
                            <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Inactivo</label>
                        </div>
                    </div>
                </div>
              <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Nombre Paquete</th>
                              <th scope="col">Velocidad</th>
                              <th scope="col">Mensualidad</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
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

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}
// Termina gestión de paquetes

// Inicia gestión de promos

function nuevaPromo() {

  let titulo = "Nueva Promoción";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
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
          <button type="button" class="btn btn-primary" onclick="guardarPromocion()">Guardar</button>
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
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Nombre Promoción</th>
                              <th scope="col">Tipo</th>
                              <th scope="col">Descuento</th>
                              <th scope="col">Inicio</th>
                              <th scope="col">Final</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-pencil-square"></i></th>
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

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

// Termina gestión de promociones

//Inicia gestión de Municipios

function nuevoMunicipio() {

  let titulo = "Nuevo Municipio";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-plus-circle me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Municipio:</label>
              <input type="text" class="form-control" placeholder="Nombre del Municipio" aria-label="nombre municipio" id="nombre_municipio" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-card-checklist me-2"></i>Estado</label>
              <select class="form-select" aria-label="estado" id="estado">
                  <option value="" selected>Selecciona...</option>
                  <option value="Zacatecas">Zacatecas</option>
                  <option value="Jalisco">Jalisco</option>
                  <option value="Aguascalientes">Aguascalientes</option>
              </select>
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarMunicipio()">Guardar</button>
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


function editarMunicipio() {

  let titulo = "Editar Municipio";
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
          <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i></label>
              <input type="text" class="form-control" placeholder="Nombre del Municipio" aria-label="nombre municipio" id="nombre_municipio" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-card-checklist me-2"></i></label>
              <select class="form-select" aria-label="estado" id="estado">
                  <option value="" selected>Selecciona...</option>
                  <option value="Zacatecas">Zacatecas</option>
                  <option value="Jalisco">Jalisco</option>
                  <option value="Aguascalientes">Aguascalientes</option>
              </select>
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateMpio()">Guardar</button>
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

function gestionMunicipios() {
  let titulo = "Gestión de Municipios";
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
              <input name="id" id="idHiddenMun" value="" hidden>
              <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                    </div>
                </div>
                <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Nombre Municipio</th>
                              <th scope="col">Estado</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                          </tr>
                      </thead>
                      <tbody id="tablaMunicipios">
                          
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

//Termina gestión de Municipios

//Inicia gestión de Comunidades

function nuevaComunidad() {

  let titulo = "Nueva Comunidad";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-plus-circle me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Comunidad:</label>
              <input type="text" class="form-control" placeholder="Nombre de la Comunidad" aria-label="nombre comunidad" id="nombre_comunidad" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-geo-alt me-2"></i>Municipio</label>
              <select class="form-select" aria-label="municipio" id="municipio">
                  <option value="" selected>Selecciona Municipio...</option>
                  <!-- aquí se llena con la tabla de municipios -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-map me-2"></i>Estado:</label>
              <select class="form-select" aria-label="estado" id="estado">
                  <option value="" selected>Selecciona Estado...</option>
                  <option value="Zacatecas">Zacatecas</option>
                  <option value="Jalisco">Jalisco</option>
                  <option value="Aguascalientes">Aguascalientes</option>
              </select>
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarComunidad()">Guardar</button>
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


function editarComunidad() {

  let titulo = "Editar Comunidad";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-plus-circle me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
          <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Comunidad:</label>
              <input type="text" class="form-control" placeholder="Nombre de la Comunidad" aria-label="nombre comunidad" id="nombre_comunidad" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-geo-alt me-2"></i>Municipio:</label>
              <select class="form-select" aria-label="municipio" id="municipio">
                  <option value="" selected>Selecciona Municipio...</option>
                  <!-- aquí se llena con la tabla de municipios -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-map me-2"></i>Estado:</label>
              <select class="form-select" aria-label="estado" id="estado">
                  <option value="" selected>Selecciona Estado...</option>
                  <option value="Zacatecas">Zacatecas</option>
                  <option value="Jalisco">Jalisco</option>
                  <option value="Aguascalientes">Aguascalientes</option>
              </select>
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateComunidad()">Guardar</button>
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

function gestionComunidades() {
  let titulo = "Gestión de Comunidades";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog modal-xl">>
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title"><i class="bi bi-card-list me-2"></i>${titulo}</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <input name="id" id="idHiddenCom" value="" hidden>
              <div class="row">
                <div class="col-md-6">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                    </div>
                </div>
                <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Nombre Comunidad</th>
                              <th scope="col">Municipio</th>
                              <th scope="col">Estado</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                          </tr>
                      </thead>
                      <tbody id="tablaComunidades">
                          
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

//Termina gestión de comunidades

//Inicia gestión de Incidencias

function altaIncidencia() {

  let titulo = "Nuevo Reporte de Incidencia";
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
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidencia" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-hash me-2"></i>Folio Incidencia</label>
              <input type="text" class="form-control" placeholder="" aria-label="Folio" id="folio_incidencia" aria-describedby="basic-addon1" disabled>
            </div>
            <label for="buscanombre" class="form-label"><i class="bi bi-person-vcard me-2"></i>Cliente:</label>
            <div class="input-group mb-3" id="nombresearch">
              <input class="form-control" list="nombresClientes" id="buscanombre" oninput="queryClientes(this.value)" placeholder="Type to search...">
              <datalist id="nombresClientes"> 

              </datalist>
            </div>
            <div class="col-lg-12" id="datoscliente" hidden>
              <div id="datosGenerales">
                
              </div>
            </div>
            <div class="mb-3">
              <label for="descripcion_incidencia" class="form-label"><i class="bi bi-cursor-text me-2"></i>Describe la incidencia:</label>
              <textarea class="form-control" rows="5" aria-label="descripcion incidencia" id="descripcion_incidencia"></textarea>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-raised-hand me-2"></i>Asignar a Técnico</label>
              <select class="form-select" aria-label="tecnico asignado" id="tecnico_incidencia">
                  <option value="" selected>Selecciona Técnico...</option>
                  <!-- aquí se llena con la tabla de Técnicos -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Atención:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidenciaAsignacion" aria-describedby="basic-addon1">
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarIncidencia()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroIncidencia()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaRegistroIncidencia(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_incidencia');
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

function editarIncidencia() {

  let titulo = "Nuevo Reporte de Incidencia";
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
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Alta</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidenciaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-hash me-2"></i>Folio Incidencia</label>
              <select class="form-select" id="folio_incidencia_editar" size="4" aria-label="folio incidencia">
                <option selected>Selecciona...</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> <!-- Muestra los folios de las incidencias que aún no han sido resueltas para cambiar los datos -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-hash me-2"></i>Folio Incidencia</label>
              <input type="text" class="form-control" placeholder="" aria-label="Folio" id="folio_incidenciaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-vcard me-2"></i>Cliente:</label>
              <input type="text" class="form-control" placeholder="" aria-label="cliente" id="cliente_incidenciaU" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label for="descripcion_incidencia" class="form-label"><i class="bi bi-cursor-text me-2"></i>Descripción de la incidencia:</label>
              <textarea class="form-control" rows="5" aria-label="descripcion incidencia" id="descripcion_incidenciaU"></textarea>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-raised-hand me-2"></i>Asignar a Técnico</label>
              <select class="form-select" aria-label="tecnico asignado" id="tecnico_incidencia">
                  <option value="" selected>Selecciona Técnico...</option>
                  <!-- aquí se llena con la tabla de Técnicos -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Asignación:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidenciaAsignacion" aria-describedby="basic-addon1">
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateIncidencia()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroIncidencia()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function resolverIncidencia() {

  let titulo = "Reporte Técnico de Incidencia";
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
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Alta</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidenciaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-hash me-2"></i>Folio Incidencia</label>
              <input type="text" class="form-control" placeholder="" aria-label="Folio" id="folio_incidenciaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-vcard me-2"></i>Cliente:</label>
              <input type="text" class="form-control" placeholder="" aria-label="cliente" id="cliente_incidenciaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label for="descripcion_incidencia" class="form-label"><i class="bi bi-cursor-text me-2"></i>Descripción de la incidencia:</label>
              <textarea class="form-control" rows="5" aria-label="descripcion incidencia" id="descripcion_incidenciaU" disabled></textarea>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-exclamation-circle me-2"></i>Estatus</label>
              <select class="form-select" aria-label="estatus incidencia" id="estatus_incidenciaR">
                  <option value="" selected>Selecciona...</option>
                  <option value="En proceso" >En proceso</option>
                  <option value="Resuelta" >Resuelta</option>
                  <option value="Cancelada" >Cancelada</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha Atención:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_incidenciaRT" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label for="comentario_incidencia" class="form-label"><i class="bi bi-cursor-text me-2"></i>Comentario Técnico:</label>
              <textarea class="form-control" rows="5" aria-label="comentario incidencia" id="comentario_incidenciaU"></textarea>
            </div>
            
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateIncidencia()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroIncidencia()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function gestionIncidencias() {
  let titulo = "Gestión de Incidencias";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog modal-xl">>
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title"><i class="bi bi-card-list me-2"></i>${titulo}</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <input name="id" id="idHiddenInc" value="" hidden>
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
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_paqA">
                            <label class="btn btn-outline-primary" for="btnradio1"><i class="bi bi-check-lg me-2"></i> Asignadas</label>
                            <input type="radio" class="btn-check" value="0" name="btnradio" id="btnradio_paqI">
                            <label class="btn btn-outline-secondary" for="btnradio2"><i class="bi bi-x-lg me-2"></i>No Asignadas</label>
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_paqP">
                            <label class="btn btn-outline-warning" for="btnradio1"><i class="bi bi-check-lg me-2"></i> En Proceso</label>
                            <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_paqAt">
                            <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg me-2"></i> Atendidas</label>
                        </div>
                    </div>
                </div>
                <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Folio</th>
                              <th scope="col">Fecha Alta</th>
                              <th scope="col">Cliente</th>
                              <th scope="col">Técnico Asignado</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                          </tr>
                      </thead>
                      <tbody id="tablaIncidencias">
                          
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


//Termina gestión de Incidencias


// Inicia gestion de inventario de antenas

function altaAntena() {

  let titulo = "Agregar Antena";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
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
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de registro" id="fecha_alta" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-info-lg me-2"></i>Marca:</label>
              <input type="text" class="form-control" placeholder="Marca" aria-label="marca" id="marca" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Modelo:</label>
              <input type="text" class="form-control" placeholder="Modelo" aria-label="modelo" id="modelo" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-upc me-2"></i>Número de Serie</label>
              <input type="text" class="form-control" placeholder="Num. Serie" aria-label="numero de serie" id="numSerie" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-code-square me-2"></i>MAC Addres</label>
              <input type="text" class="form-control" placeholder="MAC Address" aria-label="MAC" id="macAdd" aria-describedby="basic-addon1">
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarAntena()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroAntena()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaRegistroAntena(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_alta');
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

function editarAntena() {

  let titulo = "Editar Antena";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
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
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de registro" id="fecha_altaU" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-info-lg me-2"></i>Marca:</label>
              <input type="text" class="form-control" placeholder="Marca" aria-label="marca" id="marca" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-cursor-text me-2"></i>Modelo:</label>
              <input type="text" class="form-control" placeholder="Modelo" aria-label="modelo" id="modelo" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-upc me-2"></i>Número de Serie</label>
              <input type="text" class="form-control" placeholder="Num. Serie" aria-label="numero de serie" id="numSerie" aria-describedby="basic-addon1">
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-code-square me-2"></i>MAC Addres</label>
              <input type="text" class="form-control" placeholder="MAC Address" aria-label="MAC" id="macAdd" aria-describedby="basic-addon1">
            </div>
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateAntena()">Guardar</button>
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
              <h5 class="modal-title">${titulo}</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <input name="id" id="idHiddenAntenas" value="" hidden>
              <div class="row">
                <div class="col-6">
                  <div class="input-group mb-3">
                      <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                      <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscar" name="buscar">
                  </div>
                  <div class="col-6">
                    <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                      <input type="radio" class="btn-check" value="1" name="btnradio" id="btnradio_antenaA">
                      <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg"></i> Disponibles</label>
                  
                      <input type="radio" class="btn-check" value="0" name="btnradio" id="btnradio_antenaD">
                      <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg"></i> Asignadas</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="table-responsive mt-3">
                  <table class="table p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Marca</th>
                              <th scope="col">Modelo</th>
                              <th scope="col">Num. Serie</th>
                              <th scope="col">MAC Address</th>
                              <th scope="col">Fecha Registro</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-people"></i></th>
                          </tr>
                      </thead>
                      <tbody id="tablaAntenas">
                          
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

//Termina gestión de Antenas

//Inicia gestión de ordenes de corte

function altaCorte() {

  let titulo = "Editar Órden de Corte";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-wifi-off me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-check me-2"></i>Fecha</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de orden" id="fecha_orden" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-hash me-2"></i>Folio:</label>
              <input type="text" class="form-control" placeholder="" aria-label="Folio" id="folio_corte" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <select class="form-select" id="clientes_corte" size="4" aria-label="clientes para corte">
                <option selected>Selecciona...</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> <!-- Muestra los clientes que están en proceso de corte y al seleccionar muestra la info del domicilio como en el pago -->
              </select>
            </div>
            <div class="mb-3" id="datosDomicilio">
							<p> Aqui se imprime el domicilio del cliente <br>que se va a hacer el corte</p>
						</div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-raised-hand me-2"></i>Asignar a Técnico</label>
              <select class="form-select" aria-label="tecnico asignado" id="tecnico_corte">
                  <option value="" selected>Selecciona Técnico...</option>
                  <!-- aquí se llena con la tabla de Técnicos -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Corte:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_corteAsignacion" aria-describedby="basic-addon1">
            </div>
            
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="guardarCorte()">Guardar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroCorte()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaRegistroCorte(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_orden');
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

function editarCorte() {

  let titulo = "Editar Órden de Corte";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-wifi-off me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-check me-2"></i>Fecha</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de orden" id="fecha_orden_editar" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-list-ol me-2"></i>Folio de Corte:</label>
              <select class="form-select" id="folio_corte_editar" size="4" aria-label="folio corte">
                <option selected>Selecciona...</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> <!-- Muestra los folios de las ordenes de corte que aún no han sido resueltas para cambiar los datos -->
              </select>
            </div>
            <div class="mb-3" id="datosClienteyDomicilio">
							<p> Aqui se imprime la info de la orden de corte, <br>el domicilio y nombre del cliente <br>que se va a hacer el corte</p>
						</div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-person-raised-hand me-2"></i>Asignar a Técnico</label>
              <select class="form-select" aria-label="tecnico asignado" id="tecnico_corte_editar">
                  <option value="" selected>Selecciona Técnico...</option>
                  <!-- aquí se llena con la tabla de Técnicos y el selected es el que está asignado -->
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Corte:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_corteAsignacion_editar" aria-describedby="basic-addon1">
            </div>
            
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="editarCorte()">Actualizar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroCorteEditar()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaRegistroCorteEditar(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_orden_editar');
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

function gestionCortes() {
  let titulo = "Consulta de Cortes";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog modal-xl">>
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title"><i class="bi bi-wifi-off me-2"></i>${titulo}</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <input name="id" id="idHiddenCortes" value="" hidden>
              <div class="row">
                <div class="col-6">
                  <div class="input-group mb-3">
                      <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                      <input type="text" class="form-control" placeholder="Buscar..." aria-label="Buscar" aria-describedby="basic-addon1" id="buscarCortes" name="buscar">
                  </div>
                </div>
              </div>
              <div class="table-responsive mt-3">
                  <table class="table table-hover p-1">
                      <thead>
                          <tr>
                              <th scope="col">Id</th>
                              <th scope="col">Folio Corte</th>
                              <th scope="col">Cliente</th>
                              <th scope="col">Domicilio</th>
                              <th scope="col">Técnico Asignado</th>
                              <th scope="col">Fecha Registro</th>
                              <th scope="col">Estatus</th>
                              <th scope="col" class="text-end"><i class="bi bi-pencil-square me-2"></i><i class="bi bi-trash"></i> </th>
                          </tr>
                      </thead>
                      <tbody id="tablaCortes">
                          
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

function resolverCorte() {

  let titulo = "Órden de Corte - Reporte técnico";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-wifi-off me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar2-check me-2"></i>Fecha</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha de orden" id="fecha_orden_tecnico" aria-describedby="basic-addon1" disabled>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-list-ol me-2"></i>Folio de Corte:</label>
              <select class="form-select" id="folio_corte_tecnico" size="4" aria-label="folio corte">
                <option selected>Selecciona...</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option> <!-- Muestra los folios de las ordenes de corte que aún no han sido resueltas para cambiar los datos -->
              </select>
            </div>
            <div class="mb-3" id="datosClienteyDomicilio">
							<p> Aqui se imprime la info de la orden de corte, <br>el domicilio y nombre del cliente <br>que se va a hacer el corte</p>
						</div>
            <div class="mb-3">
              <label for="comentario_corte" class="form-label"><i class="bi bi-cursor-text me-2"></i>Comentario Técnico:</label>
              <textarea class="form-control" rows="5" aria-label="comentario tecnico corte" id="comentario_corte"></textarea>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-exclamation-circle me-2"></i>Estatus</label>
              <select class="form-select" aria-label="estatus corte" id="estatus_corteR">
                  <option value="" selected>Selecciona...</option>
                  <option value="En proceso" >En proceso</option>
                  <option value="Resuelta" >Resuelta</option>
                  <option value="Cancelada" >Cancelada</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label" id="basic-addon1"><i class="bi bi-calendar3 me-2"></i>Fecha de Corte:</label>
              <input type="date" class="form-control" placeholder="" aria-label="Fecha" id="fecha_corte_tecnico" aria-describedby="basic-addon1">
            </div>
            
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="editarCorte()">Actualizar</button>
        </div>
      </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  fechaRegistroCorteEditar()

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function fechaRegistroCorteEditar(){
  // Obtener los elementos input
  const inputFechaActual = document.getElementById('fecha_orden_editar');
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

// Termina gestión de ordenes de corte

// Inicia configuración de cuenta usr activo

function editarDatosUsr(){
  let titulo = "Editar Mis Datos";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.innerHTML = `
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><i class="bi bi-person-circle me-2"></i> ${titulo}</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <input name="id" value="'.$id.'" hidden>
          <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person"></i></span>
              <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" value="" aria-describedby="basic-addon1" name="nombre" required>
          </div>
          <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-person-workspace"></i></span>
              <input type="text" class="form-control" placeholder="Usuario" aria-label="usuario" value="" aria-describedby="basic-addon1" readonly>
          </div>
          <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1" for="inputGroupSelect01" readonly>Perfil</span>
              <select class="form-select" id="inputGroupSelect01" value="" selected="selected" disabled>
                  <option value="" selected>Usuario A</option>
                  <option value="" >Usuario B</option>
                  <option value="" >Administrador</option>
              </select>

              <div class="btn-group" role="group" aria-label="Basic radio toggle button group" disabled>
                  <input type="radio" class="btn-check" value="1" id="btnradio1"
                  disabled>
                  <label class="btn btn-outline-success" for="btnradio1"><i class="bi bi-check-lg me-2"></i> Activo</label>
                  <input type="radio" class="btn-check" value="2" id="btnradio2" disabled>
                  <label class="btn btn-outline-danger" for="btnradio2"><i class="bi bi-x-lg me-2"></i> Inactivo</label>
                  
              </div>
          </div>
          <div class="input-group mb-3">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-shield-lock-fill"></i></span>
              <input type="password" class="form-control" placeholder="Contraseña" aria-label="contraseña" value="" aria-describedby="basic-addon1" name="pwd" id="passW">
          </div>
          <input type="checkbox" onclick="myFunction()"> Mostrar Password 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="updateUser()">Actualizar</button>
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


// Termina configuración de cuenta usr activo