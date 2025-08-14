function obtenerFechaHoyMesAnnio() {
  const hoy = new Date();
  const anio = hoy.getFullYear();
  const mes = String(hoy.getMonth() + 1).padStart(2, '0'); // los meses van de 0 a 11
  const dia = String(hoy.getDate()).padStart(2, '0');
//   return `${anio}-${mes}-${dia}`;
  return `${anio}-${mes}`;
}

function queryClientesPago(cliente) {
    $.ajax({
        type: "POST",
        url: "query/query_clientes.php",
        data: { 
            cliente: cliente 
        },
        dataType: "json",
        success: function(data) {
            let options = '';
            data.forEach(function(item) {
                options += `<option value="${item.nombre}" data-folio="${item.folio}">${item.nombre}</option>`;
            });
            $('#nombresClientes').html(options);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

$(document).ready(function() {
    $('#nombresClientes').on('change', function() {
        const selectedValue = $(this).val();
        const selectedOption = $(`#nombresClientes option[value="${selectedValue}"]`);
        const folio = selectedOption.data('folio');

        if (folio) {
            ejecutarFuncionConFolio(folio);
        } else {
            console.error("No se encontró un folio válido para la selección.");
        }
    });
});

function FechaHoyHoras() {
  const hoy = new Date();
  const anio = hoy.getFullYear();
  const mes = String(hoy.getMonth() + 1).padStart(2, '0'); // los meses van de 0 a 11
  const dia = String(hoy.getDate()).padStart(2, '0');
  const horas = String(hoy.getHours()).padStart(2, '0');
  const minutos = String(hoy.getMinutes()).padStart(2, '0');
  return `${anio}-${mes}-${dia} ${horas}:${minutos}`;
}

function ejecutarFuncionConFolio(folio) {
    console.log("Folio seleccionado:", folio);
    _("datosGenerales").innerHTML = "";
    const fechaPago = FechaHoyHoras();

    // Aquí puedes hacer lo que necesites con el folio
    $.ajax({
        type: "POST",
        url: "query/query_datos_clientes.php",
        data: { 
            folio:folio 
        },
        dataType: "json",
        success: function(data) {
            document.getElementById("datoscliente").hidden = false;
            let datosGenerales = '';
            data.forEach(function(item) {
                if (item.pagos == 0){
                    // alert('Usuario nuevo, no hay pagos registrados');
                    datosGenerales += `
                    <div class="alert alert-info mb-2" role="alert">

                        <span id="nombrePagoTicket" class="fw-bold">${item.nombre}</span><br>
                        <span>Folio Contrato: </span><span id="folioContratoRegistro">${item.folio}</span><br>
                        <span>Domicilio: ${item.domicilio}</span>
                        <br>
                        <span id="comunidadClientePago">Comunidad: ${item.comunidad}</span>
                        <br>
                        <span>Teléfono: ${item.telefono}</span>
                        <br>
                        <span class="h3"><b>Paquete Contratado: ${item.paquete}</b></span>
                        <br>
                        <span class="h3">Último Pago Registrado: ${item.ultimopago} ${item.total}</span>
                        <input type="text" id="costoAdelantado" value="${item.cuota}" hidden>
                        <input type="datetime-local" id="fechaClientepagos" value="${fechaPago}" hidden>
                    </div>
                    `;
                }
                else{
                datosGenerales += `
                <div class="alert alert-info mb-2" role="alert">
                    <span id="nombrePagoTicket" class="fw-bold">${item.nombre}</span><br>
                    <span>Folio Contrato: </span><span id="folioContratoRegistro">${item.folio}</span><br>
                    <span>Domicilio: ${item.domicilio}</span>
                    <br>
                    <span id="comunidadClientePago">Comunidad: ${item.comunidad}</span>
                    <br>
                    <span>Teléfono: ${item.telefono}</span>
                    <br>
                    <span class="h3"><b>Paquete Contratado: ${item.paquete}</b></span>
                    <br>
                    <span class="h3">Último Pago Registrado: ${item.ultimopago} ${item.total}</span>
                    <input type="text" id="costoAdelantado" value="${item.cuota}" hidden>
                    <input type="datetime-local" id="fechaClientepagos" value="${fechaPago}" hidden>
                    </div>
                    `;}
            });
            $('#datosGenerales').html(datosGenerales);

             // Llamar a la función para generar la tabla de pagos
            //  generarTablaPagos(folio);
            queryConcepto(folio);
        }
    });
}

function pago_anticipado() {

  let titulo = "Pago Anticipado";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.setAttribute('id', 'pagoAnticipadoModal');
  modal.innerHTML = `
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="bi bi-person-fill-add"> </i>${titulo}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ms-5">
                <form id="pagoAnticipadoForm">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarEnero" name="meses[]" type="checkbox" value="1" id="enero">
                                <label class="form-check-label" for="enero">
                                    Enero
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarJulio" name="meses[]" type="checkbox" value="7" id="julio">
                                <label class="form-check-label" for="julio">
                                    Julio
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarFebrero" name="meses[]" type="checkbox" value="2" id="febrero">
                                <label class="form-check-label" for="febrero">
                                    Febrero
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarAgosto" name="meses[]" type="checkbox" value="8" id="agosto">
                                <label class="form-check-label" for="agosto">
                                    Agosto
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check revisarMarzo">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="3" id="marzo">
                                <label class="form-check-label" for="marzo">
                                    Marzo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarSeptiembre" name="meses[]" type="checkbox" value="9" id="septiembre">
                                <label class="form-check-label" for="septiembre">
                                    Septiembre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarAbril" name="meses[]" type="checkbox" value="4" id="abril">
                                <label class="form-check-label" for="abril">
                                    Abril
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarOctubre" name="meses[]" type="checkbox" value="10" id="octubre">
                                <label class="form-check-label" for="octubre">
                                    Octubre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarMayo" name="meses[]" type="checkbox" value="5" id="mayo">
                                <label class="form-check-label" for="mayo">
                                    Mayo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarNoviembre" name="meses[]" type="checkbox" value="11" id="noviembre">
                                <label class="form-check-label" for="noviembre">
                                    Noviembre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarJunio" name="meses[]" type="checkbox" value="6" id="junio">
                                <label class="form-check-label" for="junio">
                                    Junio
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input revisarDiciembre" name="meses[]" type="checkbox" value="12" id="diciembre">
                                <label class="form-check-label" for="diciembre">
                                    Diciembre
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="agregarPA()">Agregar</button>
            </div>
        </div>
    </div>
  `;

  // Agregar el modal al body del documento
  document.body.appendChild(modal);

  // Mostrar el modal usando Bootstrap's JavaScript API
  const bootstrapModal = new bootstrap.Modal(modal);
  bootstrapModal.show();
  revisarMeses();

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
  });
}

function queryAnticipados() {
    let folio = _('folioContratoRegistro').textContent;

    $.ajax({
        type: "POST",
        url: "query/query_pagos_anticipados2.php",
        data: { 
            folio: folio 
        },
        dataType: "html",
        success: function(data) {

        }
    });

}

function cargo_adicional() {

  let titulo = "Cargo Adicional";
  // Crear el elemento del modal
  const modal = document.createElement('div');
  modal.classList.add('modal', 'fade');
  modal.setAttribute('tabindex', '-1');
  modal.setAttribute('id', 'cargoAdicionalModal');
  modal.innerHTML = `
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="bi bi-person-fill-add"> </i>${titulo}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="cargoAdicionalForm">
                    <div class="mb-3">
                        <label class="form-label" id="basic-addon1">Descripción:</label>
                        <input type="text" class="form-control" placeholder="Descripción cargo adicional" aria-label="Descripción" id="descrip_adicional" aria-describedby="basic-addon1">
                    </div>
                    <div class="mb-3">
                        <label class="form-label" id="basic-addon1">Monto:</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">$</span>
                            <input type="text" class="form-control" placeholder="" id="montoAdicional" aria-label="Monto" aria-describedby="basic-addon1">
                            <span class="input-group-text" id="basic-addon1">.00</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="agregarMontoAdicional()">Agregar</button>
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

function generarTablaPagos(folio) {
    $.ajax({
        type: "POST",
        url: "query/query_pagos_cliente.php",
        data: { 
            folio: folio 
        },
        dataType: "json",
        success: function(data) {
            let nuevoFolio = folio;
            let folioPago = _("folioLabelpago").value;
            let tablaPagos = '';
            const meses = [
                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
            ];

            // Recorrer los pagos recibidos
            data.forEach((pago) => {
                const mesNumero = pago.mes;
                const mesNombre = meses[mesNumero - 1];
                
                if (pago.pagado === false) {
                    // Mes sin pago
                    tablaPagos += `
                        <tr class="bg-light">
                            <td>${mesNumero}</td>
                            <td>${mesNombre}</td>
                            <td>Mensualidad</td>
                            <td>${mesNombre}</td>
                            <td></td>
                            <td><span class="badge bg-primary text-light" style="cursor: pointer;" onclick="registrarPago('${folioPago}','${nuevoFolio}', ${mesNumero})">Agregar</span></td>
                        </tr>
                    `;
                } 
                else 
                // Mes con pago
                {
                    tablaPagos += `
                        <tr class="table-success text-dark">
                            <td>${mesNumero}</td>
                            <td>${mesNombre}</td>
                            <td>${pago.concepto || 'Mensualidad'}</td>
                            <td>${mesNombre}</td>
                            <td>${pago.monto || ''}</td>
                            <td><span class="badge bg-danger text-light" style="cursor: pointer;" onclick="eliminarPago('${folioPago}','${nuevoFolio}', ${mesNumero})">Eliminar</span></td>
                        </tr>
                    `;
                }
            });

            document.getElementById("NuevaSolicitud").hidden = false;
            $('#NuevaSolicitud').html(tablaPagos);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

//------------- Registrar pago --------------------------------
function registrarPago(folioPago, folio, mes) {
    // código
    if (confirm("¿Estás seguro de registrar el pago para este mes?")) {
        $.ajax({
            type: "POST",
            url: "query/registrar_pago.php", // Archivo PHP que registrará el pago
            data: { 
                folioPago: folioPago,
                folio: folio,
                mes: mes
            },
            dataType: "json",
            success: function(response) {
                if (response.success) {
                   // swalpago();
                    //alert("Pago registrado correctamente.");
                    generarTablaPagos(folio); // Recargar la tabla de pagos
                } else {
                    alert("Error al registrar el pago: " + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al registrar el pago.");
            }
        });
    }
}

$(document).ready(function (){
    $('.input-number').on('input', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });
});

function queryDashboard1(pagina = 1) {
    $.ajax({
        type: "POST",
        url: "query/dashboard1.php",
        data: { pagina: pagina },
        dataType: "HTML",
        success: function(data) {
            $('#dashboard1').html(data);
            
            // Agregar evento a los botones de paginación
            $('.paginacion').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryDashboard1(pagina);
            });
        }
    });
}

function enviarSolicitud(id, estatus, event) {  // Añade el parámetro 'event'
    event.preventDefault();  // Previene el comportamiento por defecto del enlace
    
    $.ajax({
        type: "POST",
        url: "prcd/prcd_cambiar_estatus_pago.php",
        data: { id: id, estatus: estatus },
        dataType: "json",
        success: function(data) {
            if (data.success == 1) {  // Corregido: usa == o === para comparación
                queryDashboard1();
            }
            else {
                console.error(data.error);
            }
        }
    });
}

function enviarSolicitud2(id, estatus, event) {  // Añade el parámetro 'event'
    event.preventDefault();  // Previene el comportamiento por defecto del enlace
    
    $.ajax({
        type: "POST",
        url: "prcd/prcd_cambiar_estatus_pago.php",
        data: { id: id, estatus: estatus },
        dataType: "json",
        success: function(data) {
            if (data.success == 1) {  // Corregido: usa == o === para comparación
                let texto = _('nombre_buscar_pagoDash').value;
                dashboardFiltro(texto,pagina = 1);
            }
            else {
                console.error(data.error);
            }
        }
    });
}

function queryDashboardGastos(pagina = 1) {
    $.ajax({
        type: "POST",
        url: "query/dashboardGastos.php",
        data: { pagina: pagina },
        dataType: "HTML",
        success: function(data) {
            $('#dashboardGastos').html(data);
            
            // Agregar evento a los botones de paginación
            $('.paginacion').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryDashboardGastos(pagina);
            });
        }
    });
}
function dashboardFiltro(texto,pagina = 1) {
    if (texto == ""){
        let pagina = 1;
        queryDashboard1(pagina);
    }
    $.ajax({
        type: "POST",
        url: "query/dashboardFiltro.php",
        data: { pagina: pagina, texto: texto },
        dataType: "HTML",
        success: function(data) {
            $('#dashboard1').html(data);
            
            // Agregar evento a los botones de paginación
            $('.paginacion').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryDashboardFiltro(texto,pagina);
            });
        }
    });
}

let contador = 1;

function tablaGrid(){
    const select = document.getElementById('catalogoConceptos');
    const selectedOption = select.options[select.selectedIndex];

    const valor = selectedOption.value;
    const costo = selectedOption.dataset.costo;
    const concepto = selectedOption.dataset.concepto;
    const periodo = selectedOption.dataset.periodo;

    const cuerpo = document.getElementById("NuevaSolicitud");

    const fila = document.createElement("tr");

    fila.innerHTML = `
        <td>${periodo}</td>
        <td>${concepto}</td>
        <td>${periodo}</td>
        <td>${costo}</td>
        
        <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
    `;

    cuerpo.appendChild(fila);
    contador++;
    calcularTotal();
}

// Función básica para eliminar fila
function eliminarTr(elemento) {
    if(confirm('¿Estás seguro de eliminar este registro?')) {
        elemento.closest('tr').remove();

        calcularTotal(); // Recalcula todo desde cero
    }
}

// función para agregar descuento
function agregarDescuento(){
    let descuento = _('monto_desc').value;
    let fechaMesAnnio = obtenerFechaHoyMesAnnio();
    let periodo = "Pago actual";
    let concepto = "Descuento";
    if(descuento == null || descuento == ""){
        alert('Agrega la cantidad a descontar');
        return;
    }
    
        const cuerpo = document.getElementById("NuevaSolicitud");
        const fila = document.createElement("tr");

        fila.innerHTML = `
            <td>${fechaMesAnnio}</td>
            <td>${concepto}</td>
            <td>${periodo}</td>
            <td>-${descuento}</td>
            
            <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
        `;

        cuerpo.appendChild(fila);
        contador++;
        calcularTotal();
    
}
// función para agregar descuento
// función para agregar promoción
function agregarPromoTable(){
    const select = document.getElementById('promocionesPagos');
    let fecha = obtenerFechaHoyMesAnnio();
    let validacion = select.value;
    if (validacion == "" || validacion == null){
        alert('Debes seleccionar una promoción');
        return;

    }
    const selectedOption = select.options[select.selectedIndex];

    const valor = selectedOption.value;
    const costo = selectedOption.dataset.costo;
    const concepto = selectedOption.dataset.concepto;
    const periodo = selectedOption.dataset.periodo;

    const cuerpo = document.getElementById("NuevaSolicitud");

    const fila = document.createElement("tr");

    fila.innerHTML = `
        <td>${fecha}</td>
        <td>${concepto}</td>
        <td>${periodo}</td>
        <td>${costo}</td>
        
        <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
    `;

    cuerpo.appendChild(fila);
    contador++;
    calcularTotal();
}
// función para agregar promoción
// función para agregar pago adicional
function agregarMontoAdicional(){
    borrarNoTieneAdeudos();
    let fecha = obtenerFechaHoyMesAnnio();
    let descripcion = _('descrip_adicional').value;
    let montoAdicional = _('montoAdicional').value;
    let periodo = "Monto adicional agregado";

    if (descripcion == "" || descripcion == null || montoAdicional == "" || montoAdicional == null ){
        alert('Debes llenar los datos para agregar descuento');
        return;
    }

    const cuerpo = document.getElementById("NuevaSolicitud");

    const fila = document.createElement("tr");

    fila.innerHTML = `
        <td>${fecha}</td>
        <td>${descripcion}</td>
        <td>${periodo}</td>
        <td>${montoAdicional}</td>
        
        <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
    `;

    cuerpo.appendChild(fila);
    contador++;
    $('#cargoAdicionalModal').modal('hide');
    calcularTotal();
}
function agregarCostoInstalacion(id,costo){
    borrarNoTieneAdeudos();
    let fecha = obtenerFechaHoyMesAnnio();
    let descripcion = "Costo instalación";
    let montoAdicional = costo;
    let periodo = "Instalación";

    if (descripcion == "" || descripcion == null || montoAdicional == "" || montoAdicional == null ){
        alert('Debes llenar los datos para agregar descuento');
        return;
    }

    const cuerpo = document.getElementById("NuevaSolicitud");

    const fila = document.createElement("tr");

    fila.innerHTML = `
        <td>${fecha}</td>
        <td>${descripcion}</td>
        <td>${periodo}</td>
        <td>${montoAdicional}</td>
        
        <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
    `;

    cuerpo.appendChild(fila);
    contador++;
    $('#cargoAdicionalModal').modal('hide');
    calcularTotal();
}
// función para agregar pago adicional

// agregar Pago Anticipado
function agregarPA(){
    let fechaMesAnnio = obtenerFechaHoyMesAnnio();
    let hoy = new Date();
    let anio = hoy.getFullYear();
    let concepto = "Pago anticipado";
    let folio = _('folioContratoRegistro').value;
    borrarNoTieneAdeudos();
    let montoAdicional = _('costoAdelantado').value;
    // let montoAdicional = "450";
    const cuerpo = document.getElementById("NuevaSolicitud");
    const checkboxes = document.querySelectorAll('input[name="meses[]"]:checked');

    // Validar que al menos un mes esté seleccionado
    if (checkboxes.length === 0) {
        alert("¡Selecciona al menos un mes!");
        return;
    }

    // Crear una fila por cada mes seleccionado
    checkboxes.forEach(checkbox => {
        const meses = [
                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
            ];
            let previoMeses = checkbox.value;
            let mesReal = previoMeses - 1;
            let mesSeleccionado = meses[mesReal];
            if(previoMeses.length == 1){
                var dato = '0'+previoMeses;
            }
            else{
                var dato = previoMeses;
            }
        const fila = document.createElement("tr");
        fila.innerHTML = `
            <td>${anio}-${dato}</td>
            <td>${concepto}</td>
            <td>${mesSeleccionado}</td>  <!-- Mes individual -->
            <td>${montoAdicional}</td>
            <td><a href="#"><span class="badge bg-danger" onclick="eliminarTr(this)"><i class="bi bi-trash"></i> Eliminar</span></a></td>
        `;
        cuerpo.appendChild(fila);
    });

    contador += checkboxes.length;  // Actualizar contador con la cantidad de meses
    $('#cargoAdicionalModal').modal('hide');
    calcularTotal();
}
// función para los meses

//función para encontrar el costo del usuario

//función para encontrar el costo del usuario

// Función para calcular el total desde cero (más precisa)
function calcularTotal() {
    let total = 0;
    document.querySelectorAll("#NuevaSolicitud tr").forEach(fila => {
        total += parseFloat(fila.cells[3].textContent);
    });
    document.getElementById('total-costo').textContent = total.toFixed(2);
}

function imprimirSeleccion(nombre, nombre2) {
    const ventimp = window.open('', 'popimpr');
    const fecha = new Date().toLocaleDateString();
    const rutaLogo = '../images/logo_conectwi_wide-removebg-preview.png';
    const comunidad = _('comunidadClientePago').innerText;
    const fechaPago = _('fechaClientepagos').value;

    // Estilos optimizados para impresión térmica
    const estilos = `
        <style>
            @page { size: auto; margin: 0; }
            body { 
                width: 8cm !important;
                margin: 0 !important;
                padding: 0.2cm !important;
                font-family: Arial, sans-serif;
                font-size: 10px !important;
                -webkit-print-color-adjust: exact;
            }
            * { 
                max-width: 100% !important;
                box-sizing: border-box;
            }
            .logo-container {
                text-align: center;
                margin-bottom: 5px;
            }
            .logo {
                max-width: 60% !important;
                height: auto;
            }
            table {
                width: 100% !important;
                font-size: 9px !important;
                border-collapse: collapse;
                margin: 5px 0;
            }
            th, td {
                padding: 2px 3px !important;
                line-height: 1.2;
                border: 1px solid #ddd;
                text-align: center;
            }
            /* Ocultar primera y última columna */
            tr > :first-child,
            tr > :last-child {
                display: none;
            }
            /* Excepción para fila de total si es necesario */
            tr.fila-total > :last-child {
                display: table-cell !important;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            .header-text {
                text-align: center;
                margin: 3px 0;
            }
            .header-text h1 {
                font-size: 14px !important;
                margin: 2px 0;
                font-weight: bold;
            }
            .footer {
                font-size: 10px !important;
                text-align: center;
                margin-top: 5px;
                padding-top: 5px;
                border-top: 1px dashed #000;
            }
            .nombre-cliente {
                font-weight: bold;
                margin: 5px 0;
                text-align: center;
                font-size: 11px;
            }
        </style>
    `;

    // Clonar y modificar tabla
    const tablaOriginal = document.getElementById('tablaPre');
    const tablaClonada = tablaOriginal.cloneNode(true);
    
    // Extraer el valor del total antes de modificar la tabla
    let totalValue = '';
    const elementoTotal = tablaClonada.querySelector('#total-costo, .total, [data-total]');
    if (elementoTotal) {
        totalValue = elementoTotal.textContent.trim();
        // Eliminar fila de total si es necesario
        const filaTotal = elementoTotal.closest('tr');
        if (filaTotal) {
            filaTotal.parentNode.removeChild(filaTotal);
        }
    }

    // Ocultar columnas en todas las filas
    Array.from(tablaClonada.querySelectorAll('tr')).forEach(tr => {
        if (tr.children.length > 0) {
            tr.children[0].style.display = 'none'; // Primera columna
            if (tr.children.length > 1) {
                tr.lastElementChild.style.display = 'none'; // Última columna
            }
        }
    });

    // Generar HTML del logo
    const logoHTML = rutaLogo 
        ? `<div class="logo-container"><img src="${rutaLogo}" class="logo" alt="Logo"></div>`
        : '';

    ventimp.document.open();
    ventimp.document.write(`
        <html>
            <head>
                <title>Ticket</title>
                ${estilos}
            </head>
            <body>
                ${logoHTML}
                <div class="header-text">
                    <br>
                    <h2>RECIBO DE PAGO</h2>
                    <h3>ORIGINAL</h3>
                </div>
                
                ${nombre2 ? `<div class="nombre-cliente">
                                <p class="text-left">Cliente: ${nombre2}
                                    <br>
                                   Comunidad: ${comunidad}
                                    <br>
                                   Fecha y hora de Pago: ${fechaPago}
                                   <br>
                                   <br>
                                </p>
                            </div>` : ''}
                ${tablaClonada.outerHTML}
                
                <div class="footer">
                    ${totalValue ? `<div><strong>TOTAL:</strong> ${totalValue}</div>` : ''}
                    <div>
                        <br>
                        <p>${fecha} | www.conectwi.com</p>
                    </div>
                    <div>
                        <p>Número para reportes: 4929427478</p>
                        <p>** CONSERVE ESTE TICKET **</p>
                    </div>
                </div>
            </body>
        </html>
    `);
    ventimp.document.close();
    limpiarModal();
    limpiar1modal();
    $('#pago').modal('hide');

    ventimp.onload = function() {
        setTimeout(() => {
            ventimp.print();
            ventimp.close();
        }, 50);
    };
}

function imprimirSeleccion2(nombre, nombre2) {
    const ventimp = window.open('', 'popimpr');
    const fecha = new Date().toLocaleDateString();
    const rutaLogo = '../images/logo_conectwi_wide-removebg-preview.png';
    const fechaPago = _('fechaPagoRealizado').innerText;
    const comunidad = _('comunidadPagoRealizado').innerText;
    
    // Estilos optimizados para impresión térmica
    const estilos = `
        <style>
            @page { size: auto; margin: 0; }
            body { 
                width: 8cm !important;
                margin: 0 !important;
                padding: 0.2cm !important;
                font-family: Arial, sans-serif;
                font-size: 10px !important;
                -webkit-print-color-adjust: exact;
            }
            * { 
                max-width: 100% !important;
                box-sizing: border-box;
            }
            .logo-container {
                text-align: center;
                margin-bottom: 5px;
            }
            .logo {
                max-width: 60% !important;
                height: auto;
            }
            table {
                width: 100% !important;
                font-size: 9px !important;
                border-collapse: collapse;
                margin: 5px 0;
            }
            th, td {
                padding: 2px 3px !important;
                line-height: 1.2;
                border: 1px solid #ddd;
                text-align: center;
            }
            /* Ocultar primera y última columna */
            tr > :first-child
            {
                display: none;
            }
            /* Excepción para fila de total si es necesario */
            tr.fila-total > :last-child {
                display: table-cell !important;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            .header-text {
                text-align: center;
                margin: 3px 0;
            }
            .header-text h1 {
                font-size: 14px !important;
                margin: 2px 0;
                font-weight: bold;
            }
            .footer {
                font-size: 10px !important;
                text-align: center;
                margin-top: 5px;
                padding-top: 5px;
                border-top: 1px dashed #000;
            }
            .nombre-cliente {
                font-weight: bold;
                margin: 5px 0;
                text-align: center;
                font-size: 11px;
            }
        </style>
    `;

    // Clonar y modificar tabla
    const tablaOriginal = document.getElementById('reimprimirTabla');
    const tablaClonada = tablaOriginal.cloneNode(true);

    // Ocultar columnas en todas las filas
    Array.from(tablaClonada.querySelectorAll('tr')).forEach(tr => {
        if (tr.children.length > 0) {
            tr.children[0].style.display = 'none'; // Primera columna
            // if (tr.children.length > 1) {
            //     tr.lastElementChild.style.display = 'none'; // Última columna
            // }
        }
    });

    // Generar HTML del logo
    const logoHTML = rutaLogo 
        ? `<div class="logo-container"><img src="${rutaLogo}" class="logo" alt="Logo"></div>`
        : '';

    ventimp.document.open();
    ventimp.document.write(`
        <html>
            <head>
                <title>Ticket</title>
                ${estilos}
            </head>
            <body>
                ${logoHTML}
                <div class="header-text">
                    <br>
                    <h2>RECIBO DE PAGO</h2>
                    <h3>REIMPRESION</h3>
                </div>
                
                ${nombre2 ? `<div class="nombre-cliente">
                                <p class="text-left">Cliente: ${nombre2}
                                    <br>
                                   Comunidad: ${comunidad}
                                    <br>
                                   Fecha y hora de Pago: ${fechaPago}
                                   <br>
                                   <br>
                                </p>
                            </div>` : ''}
                ${tablaClonada.outerHTML}
                
                <div class="footer">

                    <div>
                        <br>
                        <p>${fecha} | www.conectwi.com</p>
                    </div>
                    <div>
                        <p>Número para reportes: 4929427478</p>
                        <p>** CONSERVE ESTE TICKET **</p>
                    </div>
                </div>
            </body>
        </html>
    `);
    ventimp.document.close();
    limpiarModal();
    limpiar1modal();
    $('#pago').modal('hide');

    ventimp.onload = function() {
        setTimeout(() => {
            ventimp.print();
            ventimp.close();
        }, 50);
    };
}

function catalogoInstalaciones(){
    $.ajax({
        type: "POST",
        url: "query/queryInstalaciones.php",

        dataType: "html",
        success: function(data) {
            $('#instalacionesPagos').html(data);
        }
    });
}

function borrarNoTieneAdeudos(){
    const filas = $('#NuevaSolicitud tr');
    
    filas.each(function() {
        var concepto = $(this).find('td:eq(1)').text();
        if (concepto == 'No tiene adeudos') { // Solo no pagados
                filas.closest('tr').remove();
            }
    });
}

function reimpirimirPago(){
    let folioPago = _('folioPagoRealizado').innerText;
    let nombreTicket = _('nombrePagoRealizado').innerText;
    imprimirSeleccion2(folioPago, nombreTicket);
}