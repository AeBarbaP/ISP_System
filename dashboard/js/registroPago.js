function _grecibos(el){
    return document.getElementById(el);
}

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
            // $('#catalogoConceptos').html(data);
            $('#NuevaSolicitud').html(data);
            calcularTotal();
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
    document.getElementById('pagoreg').disabled = true;
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
                //actualizarTotal();
                guardarRecibo();
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

function guardarRecibo(){
    var folio_pago = _grecibos('folioLabelpago').value;
    var fecha_pago = _grecibos('fechaSolicitud').value;
    var tarjeta = _grecibos('tipopagoBaucher').value;
    var tipo_pago = _grecibos('tipopago').value;
    var folio_contrato = _grecibos('folioContratoRegistro').innerText;
    var total_pago = _grecibos('total-costo').innerText;

    $.ajax({
        url: 'prcd/guardar_recibo.php',
        type: 'POST',
        data: { 
            folio_pago:folio_pago,
            fecha_pago:fecha_pago,
            tipo_pago:tipo_pago,
            tarjeta:tarjeta,
            folio_contrato:folio_contrato,
            total_pago:total_pago
        },
        success: function(response) {
            var datos = JSON.parse(JSON.stringify(response));

            var success = datos.success;
    
            if(success = 1){
                alert("Recibo guardado");
                $('#pago').modal('hide');
                queryDashboard1();
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            }
          
        },
    });
}

function queryRecibo(){
    $.ajax({
        type: "POST",
        url: "query/query_proximos_vencimiento_3.php",
        dataType: "html",
        success: function(data) {
            $('#tablaProximos').html(data);
        }
    });
}

function queryRecibo2(){
    $.ajax({
        type: "POST",
        url: "query/query_proximos_vencimiento_2.php",
        dataType: "html",
        success: function(data) {
            $('#tablaProximos2').html(data);
        }
    });
}

queryRecibo();
queryRecibo2();

function _pagosRealizados(el){
    return document.getElementById(el);
}

function abrirModalPagos(folio){
    const tabla = document.getElementById('tablaPagosBody');
    tabla.innerHTML = '';
    
    $("#listaPagosInv").modal("show");
    _pagosRealizados('folioPagoRealizado').innerText = "";
    _pagosRealizados('fechaPagoRealizado').innerText = "";
    _pagosRealizados('nombrePagoRealizado').innerText = "";
    _pagosRealizados('totalPagoRealizado').innerText = "";

    let folioPago = folio;
    $.ajax({
        type: "POST",
        url: "query/query_pago_query.php",
        data: {
            folio: folioPago
        },
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success; 
            var listado = datos.listado;
            console.log(listado);
            if (success == 1){
                _pagosRealizados('folioPagoRealizado').innerText = datos.folio_pago;
                _pagosRealizados('fechaPagoRealizado').innerText = datos.fechaPago;
                _pagosRealizados('nombrePagoRealizado').innerText = datos.nombre;
                _pagosRealizados('totalPagoRealizado').innerText = datos.total;

                // listado tabla
                listado.forEach((pago, index) => {
                    const fila = document.createElement('tr');

                    fila.innerHTML = `
                        <td>${index + 1}</td>
                        <td>${pago.concepto}</td>
                        <td>${pago.num_pago}</td>
                        <td>$${parseFloat(pago.monto).toFixed(2)}</td>
                    `;

                    tabla.appendChild(fila);
                });
            }
        }
    });
}