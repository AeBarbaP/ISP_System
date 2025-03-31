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
                options += `<option value="${item.nombre}" data-folio="${item.folio}">`;
            });
            $('#nombresClientes').html(options);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

$(document).ready(function() {
    $('#buscanombre').on('change', function() {
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
                datosGenerales += `<h3>"${item.nombre}"</h3><span>Folio Contrato: "${item.folio}"</span><br>
                <span>Domicilio:"${item.domicilio}"</span>
                <br>
                <span>Teléfono: "${item.telefono}"</span>
                <br>`;
            });
            $('#datosGenerales').html(datosGenerales);

             // Llamar a la función para generar la tabla de pagos
             generarTablaPagos(folio);
        }
    });
}

function generarTablaPagos(folio) {
    $.ajax({
        type: "POST",
        url: "query/query_pagos_cliente.php", // Archivo PHP que buscará los pagos
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

            // Recorrer los meses y buscar los pagos correspondientes
            meses.forEach((mes, index) => {
                const pago = data.find(p => p.mes == (index + 1)); // Buscar pago para el mes actual
                const mesNumero = index + 1; // Número del mes (1 = Enero, 2 = Febrero, etc.)
                const descripcion = 'Mensualidad';
            
                tablaPagos += `
                    <tr class="${pago ? 'bg-secondary' : 'bg-ligth'}">
                        <td>${index+1}</td>
                        <td>${mes}</td>
                        <td>${descripcion}</td>
                        <td>${pago ? pago.periodo : mes}</td>
                        <td>${pago ? pago.monto : ''}</td>
                        <td>${pago ? pago.concepto : `<span class="badge bg-primary text-light" style="cursor: pointer;" onclick="registrarPago('${folioPago}','${nuevoFolio}', ${mesNumero})">Pagar</span>`}</td>
                    </tr>
                `;
            });

            document.getElementById("NuevaSolicitud").hidden = false;

            // Insertar la tabla en el tbody
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