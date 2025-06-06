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
                    alert('Usuario nuevo, no hay pagos registrados');
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
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><i class="bi bi-person-fill-add"> </i>${titulo}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="pagoAnticipadoForm">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="1" id="enero">
                                <label class="form-check-label" for="enero">
                                    Enero
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="2" id="febrero">
                                <label class="form-check-label" for="febrero">
                                    Febrero
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="3" id="marzo">
                                <label class="form-check-label" for="marzo">
                                    Marzo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="4" id="abril">
                                <label class="form-check-label" for="abril">
                                    Abril
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="5" id="mayo">
                                <label class="form-check-label" for="mayo">
                                    Mayo
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="6" id="junio">
                                <label class="form-check-label" for="junio">
                                    Junio
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="7" id="julio">
                                <label class="form-check-label" for="julio">
                                    Julio
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="8" id="agosto">
                                <label class="form-check-label" for="agosto">
                                    Agosto
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="9" id="septiembre">
                                <label class="form-check-label" for="septiembre">
                                    Septiembre
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="10" id="octubre">
                                <label class="form-check-label" for="octubre">
                                    Octubre
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="11" id="noviembre">
                                <label class="form-check-label" for="noviembre">
                                    Noviembre
                                </label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="12" id="diciembre">
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
  fechaTecnico();

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
                    alert("Pago registrado correctamente.");
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
//------------- Pagos dashboard --------------------------------

function queryDashboard1() {
    $.ajax({
        type: "POST",
        url: "query/dashboard1.php",
        dataType: "HTML",
        success: function(data) {
            $('#dashboard1').html(data);
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
    calcularTotal();}

// Función básica para eliminar fila
function eliminarTr(elemento) {
    if(confirm('¿Estás seguro de eliminar este registro?')) {
        elemento.closest('tr').remove();

        calcularTotal(); // Recalcula todo desde cero
    }
}

// Función para calcular el total desde cero (más precisa)
function calcularTotal() {
    let total = 0;
    document.querySelectorAll("#NuevaSolicitud tr").forEach(fila => {
        total += parseFloat(fila.cells[3].textContent);
    });
    document.getElementById('total-costo').textContent = total.toFixed(2);
}

function imprimirSeleccion(nombre) {
    var ficha = document.getElementById(nombre);
    var ventimp = window.open(' ', 'popimpr');
    var fecha = new Date('Y');
    var texto = "<center><p>.</p><p>...</p><p>.</p><h1 style='font-size: 2.5rem; font-family: 'Aboreto', cursive;'><strong>CONECTWi</strong></h1><h1 style='font-size: 2rem; font-family: 'Aboreto', cursive;'>Recibo de Pago</h1></center>";
    var texto2 = "<center><p style='font-size: 2rem;'>CONSERVE SU TICKET</p><p style='font-size: 1.5rem;'>Únicamente presentando éste ticket se pordrá acreditar su pago</p><p style='font-size: 1.2rem;'>http://www.conectwi.com</p><p style='font-size: 1.2rem;'>CONECTWI | "+fecha+"</p></center>";
    var tabla = "";
    ventimp.document.write(texto);
    ventimp.document.write(ficha.innerHTML);
    ventimp.document.write(texto2);
    ventimp.document.close();
    ventimp.print();
    ventimp.close();
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

