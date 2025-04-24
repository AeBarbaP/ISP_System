function pagoNew() {
    $("#pago").modal("show");
    generarFolio2();
    queryConcepto();

    // Obtener los elementos input
    const inputFechaActual = document.getElementById('fechaSolicitud');
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

    // Inicia el ajax para los datos del usuario
}

function queryConcepto(folio){
    $.ajax({
        type: "POST",
        url: "query/query_conceptos.php",
        data:{
            folio:folio
        },
        dataType: "html",
        success: function(data) {
            $('#catalogoConceptos').html(data);
        }
        });

}

function swalpago(){
    Swal.fire({
		position: "top-end",
		icon: "success",
		title: "Pago Exitoso",
		showConfirmButton: false,
		timer: 1500
	});
    document.getElementById('printticket').hidden = false;
    document.getElementById('pagoreg').hidden = true;

    guardarTodosPagos();
}
function guardarTodosPagos() {
    const filas = $('#NuevaSolicitud tr');
    const pagos = [];
    const folioPago = $('#folioLabelpago').val();
    const foliContrato = document.getElementById('folioContratoRegistro').innerText;
    const fechaSolicitud = $('#fechaSolicitud').val();

    filas.each(function() {
        if (!$(this).hasClass('table-success')) { // Solo no pagados
            pagos.push({
                folio_pago: folioPago,
                fechaSolicitud: fechaSolicitud,
                folio_contrato: foliContrato,
                periodo: $(this).find('td:eq(0)').text(),
                concepto: $(this).find('td:eq(1)').text(),
                mes: $(this).find('td:eq(2)').text(),
                costo: $(this).find('td:eq(3)').text()
            });
        }
    });

    if (pagos.length === 0) {
        alert('No hay pagos pendientes para guardar');
        return;
    }

    $.ajax({
        url: 'prcd/guardar_pagos.php',
        type: 'POST',
        data: { pagos: pagos },
        beforeSend: function() {
            $('#btnGuardarTodos').html('<i class="bi bi-hourglass"></i> Guardando...').prop('disabled', true);
        },
        success: function(response) {
            if (response.success) {
                filas.addClass('table-success');
                $('.btn-pagar').html('<i class="bi bi-check-circle"></i> Pagado').removeClass('btn-primary').addClass('btn-success');
                actualizarTotal();
                alert(response.message);
            } else {
                alert('Error: ' + response.message);
            }
        },
        complete: function() {
            $('#btnGuardarTodos').html('<i class="bi bi-save"></i> Guardar Todos').prop('disabled', false);
        }
    });
}