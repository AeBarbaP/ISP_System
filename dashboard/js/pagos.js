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
            let tablaPagos = '';
            const meses = [
                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
            ];

            // Recorrer los meses y buscar los pagos correspondientes
            meses.forEach((mes, index) => {
                const pago = data.find(p => p.mes == (index + 1)); // Buscar pago para el mes actual
                tablaPagos += `
                    <tr>
                        <td>${mes}</td>
                        <td>${pago ? pago.folio_contrato : ''}</td>
                        <td>${pago ? pago.concepto : ''}</td>
                        <td>${pago ? pago.periodo : ''}</td>
                        <td>${pago ? pago.monto : ''}</td>
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