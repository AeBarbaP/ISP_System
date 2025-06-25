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

function ejecutarFuncionConFolio(folio) {
    console.log("Folio seleccionado:", folio);
    _("datosGenerales").innerHTML = "";

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
                    <h3><b>${item.nombre}</b></h3>
                    <span>Folio Contrato: </span><span id="folioContratoRegistro">${item.folio}</span><br>
                    <span>Domicilio: ${item.domicilio}</span>
                    <br>
                    <span>Comunidad: ${item.comunidad}</span>
                    <br>
                    <span>Teléfono: ${item.telefono}</span>
                    <br>
                    <span class="h3"><b>Paquete Contratado: ${item.paquete}</b></span>
                    <br>
                    <span class="h3">Último Pago Registrado: ${item.ultimopago} ${item.total}</span>
                    </div>`;
                }
                else{
                datosGenerales += `
                <div class="alert alert-info mb-2" role="alert">
                    <h3><b>${item.nombre}</b></h3>
                    <span>Folio Contrato: </span><span id="folioContratoRegistro">${item.folio}</span><br>
                    <span>Domicilio: ${item.domicilio}</span>
                    <br>
                    <span>Comunidad: ${item.comunidad}</span>
                    <br>
                    <span>Teléfono: ${item.telefono}</span>
                    <br>
                    <span class="h3"><b>Paquete Contratado: ${item.paquete}</b></span>
                    <br>
                    <span class="h3">Último Pago Registrado: ${item.ultimopago} ${item.total}</span>
                    </div>`;}
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
                                <input class="form-check-input" name="meses[]" type="checkbox" value="1" id="enero">
                                <label class="form-check-label" for="enero">
                                    Enero
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="7" id="julio">
                                <label class="form-check-label" for="julio">
                                    Julio
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="2" id="febrero">
                                <label class="form-check-label" for="febrero">
                                    Febrero
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="8" id="agosto">
                                <label class="form-check-label" for="agosto">
                                    Agosto
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="3" id="marzo">
                                <label class="form-check-label" for="marzo">
                                    Marzo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="9" id="septiembre">
                                <label class="form-check-label" for="septiembre">
                                    Septiembre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="4" id="abril">
                                <label class="form-check-label" for="abril">
                                    Abril
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="10" id="octubre">
                                <label class="form-check-label" for="octubre">
                                    Octubre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="5" id="mayo">
                                <label class="form-check-label" for="mayo">
                                    Mayo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="11" id="noviembre">
                                <label class="form-check-label" for="noviembre">
                                    Noviembre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="6" id="junio">
                                <label class="form-check-label" for="junio">
                                    Junio
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" name="meses[]" type="checkbox" value="12" id="diciembre">
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

  // Eliminar el modal del DOM cuando se cierre
  modal.addEventListener('hidden.bs.modal', () => {
    modal.remove();
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

//------------- Pagos dashboard --------------------------------

// function queryDashboard1() {
//     $.ajax({
//         type: "POST",
//         url: "query/dashboard1.php",
//         dataType: "HTML",
//         success: function(data) {
//             $('#dashboard1').html(data);
//         }
//     });
// }

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
// función para agregar pago adicional

// función para los meses
function agregarPA(){
    let fechaMesAnnio = obtenerFechaHoyMesAnnio();
    let hoy = new Date();
    let anio = hoy.getFullYear();
    let concepto = "Pago anticipado";
    let montoAdicional = "450";
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

// Función para calcular el total desde cero (más precisa)
function calcularTotal() {
    let total = 0;
    document.querySelectorAll("#NuevaSolicitud tr").forEach(fila => {
        total += parseFloat(fila.cells[3].textContent);
    });
    document.getElementById('total-costo').textContent = total.toFixed(2);
}

function imprimirSeleccion(nombre) {
    const ventimp = window.open('', 'popimpr');
    const fecha = new Date().toLocaleDateString();
    const rutaLogo = '../images/logo_conectwi_wide-removebg-preview.png';
    
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
                    <h1 hidden>CONECTWi</h1>
                    <h2>RECIBO DE PAGO</h2>
                </div>
                
                ${nombre ? `<div class="nombre-cliente">${nombre}</div>` : ''}
                ${tablaClonada.outerHTML}
                
                <div class="footer">
                    ${totalValue ? `<div><strong>TOTAL:</strong> ${totalValue}</div>` : ''}
                    <div>${fecha} | www.conectwi.com</div>
                    <div>** CONSERVE ESTE TICKET **</div>
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

/* $(document).ready(function () {
    $('#printticket1').on('click', function (event) {
        if ($('.modal').is(':visible')) {
            console.log('si');
            var modalId = $(event.target).closest('.modal').attr('id');
            $('body').css('visibility', 'hidden');
            $('footer').css('visibility', 'hidden');
            document.getElementById('footer').hidden = true;
            $('header').css('visibility', 'hidden');
            document.getElementById('header').hidden = true;
            $("#" + modalId).css('visibility', 'visible');
            $('#' + modalId).removeClass('modal');
            window.print();
            $('body').css('visibility', 'visible');
            $('footer').css('visibility', 'visible');
            document.getElementById('footer').hidden = false;
            $('header').css('visibility', 'visible');
            document.getElementById('header').hidden = false;
            $('#' + modalId).addClass('modal');
        } else {
            window.print();
        }
    })
}); */

