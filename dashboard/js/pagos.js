function queryClientes(cliente) {
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
                datosGenerales += `
                <div class="alert alert-info mb-2" role="alert">
                <h3>${item.nombre}</h3><span>Folio Contrato: </span><span id="folioContratoRegistro">${item.folio}</span><br>
                <span>Domicilio:${item.domicilio}</span>
                <br>
                <span>Comunidad:${item.comunidad}</span>
                <br>
                <span>Teléfono: ${item.telefono}</span>
                </div>`;
            });
            $('#datosGenerales').html(datosGenerales);

             // Llamar a la función para generar la tabla de pagos
            //  generarTablaPagos(folio);
            queryConcepto(folio);
        }
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

queryDashboard1();

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
