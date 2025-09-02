function _grecibos(el){
    return document.getElementById(el);
}

function pagoNew() {
    $("#pago").modal("show");
    generarFolio2();
    // queryConcepto();
    queryPromociones();

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

function revisarMeses(){
    console.log('inicial');
    const hoy = new Date();
    const annio = hoy.getFullYear();
    // const dia = String(hoy.getDate()).padStart(2, '0');
    // const mes = String(hoy.getMonth() + 1).padStart(2, '0'); // los meses van de 0 a 11
    //   return `${anio}-${mes}-${dia}`;
    //  `${anio}-${mes}`;

    const filas = $('#NuevaSolicitud tr');

    filas.each(function() {
            console.log('interno');

        var concepto = $(this).find('td:eq(0)').text();
        if (concepto == annio+'-01') {
            $('.revisarEnero').prop('disabled', true);
        }
        else if (concepto == annio+'-02') {
          $('.revisarFebrero').prop('disabled', true);
        }
        else if (concepto == annio+'-03') {
          $('.revisarMarzo').prop('disabled', true); 
        }
        else if (concepto == annio+'-04') {
          $('.revisarAbril').prop('disabled', true); 
        }
        else if (concepto == annio+'-05') {
          $('.revisarMayo').prop('disabled', true);  
        }
        else if (concepto == annio+'-06') {
          $('.revisarJunio').prop('disabled', true);
        }
        else if (concepto == annio+'-07') {
          $('.revisarJulio').prop('disabled', true);
        }
        else if (concepto == annio+'-08') {
          $('.revisarAgosto').prop('disabled', true); 
        }
        else if (concepto == annio+'-09') {
          $('.revisarSeptiembre').prop('disabled', true);  
        }
        else if (concepto == annio+'-10') {
          $('.revisarOctubre').prop('disabled', true); 
        }
        else if (concepto == annio+'-11') {
          $('.revisarNoviembre').prop('disabled', true);  
        }
        else if (concepto == annio+'-12') {
          $('.revisarDiciembre').prop('disabled', true);  
        }
        
    });
}

function queryPromociones(){
    $.ajax({
        type: "POST",
        url: "query/query_promociones_select.php",
        dataType: "html",
        success: function(data) {
            // $('#catalogoConceptos').html(data);
            $('#promocionesPagos').html(data);
        }
        });

}

function swalpago(){
    var nombre = document.getElementById('nombresClientes').value;
    if (nombre == ""){
        alert('Debes seleccionar nombre del cliente');
        return;
    }
    Swal.fire({
		position: "top-end",
		icon: "success",
		title: "Pago Exitoso",
		showConfirmButton: false,
		timer: 1500
	});
    document.getElementById('pagoreg').disabled = true;
    // guardarRecibo()
    guardarTodosPagos();
    // revisarPagosAnticipados();
    // revisarPagosAtrasado();
    limpiarModal();
}

function guardarTodosPagos() {
    const filas = $('#NuevaSolicitud tr');
    const pagos = [];
    const folioPago1 = $('#folioLabelpago').val();
    const foliContrato = document.getElementById('folioContratoRegistro').innerText;
    const fechaSolicitud = _('fechaClientepagos2').value;
    const nombreTicket = _('nombrePagoTicket').innerText;

    if (filas == 0) {
        alert('No hay pagos pendientes para guardar');
        return;
    }

    filas.each(function() {
        // var concepto = $(this).find('td:eq(1)').text();
        
        if (!$(this).hasClass('table-success')) { // Solo no pagados
            pagos.push({
                folio_pago: folioPago1,
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
        dataType:'json',
        success: function(response) {
            if (response.success) {
                filas.addClass('table-success');
                $('.btn-pagar').html('<i class="bi bi-check-circle"></i> Pagado').removeClass('btn-primary').addClass('btn-success');
                //actualizarTotal();
                queryDashboard1();
                guardarRecibo();
                //alert(response.message);
                console.log(response.message);

                if (confirm("¿Quieres imprimir el recibo "+folioPago1+"?")) {
                    imprimirSeleccion(folioPago1, nombreTicket);
                }

            } else {
                alert('Error: ' + response.message);
            }
        },
        complete: function() {
            $('#btnGuardarTodos').html('<i class="bi bi-save"></i> Guardar Todos').prop('disabled', false);
        }
    });
}
function revisarPagosAnticipados() {

    var tarjeta = _grecibos('tipopagoBaucher').value;
    var tipo_pago = 4;

    const filas = $('#NuevaSolicitud tr');
    const pagos = [];
    const folioPago1 = $('#folioLabelpago').val();
    const foliContrato = document.getElementById('folioContratoRegistro').innerText;
    const fechaSolicitud = $('#fechaSolicitud').val();
    
    var i = 0;
    
    if (filas >= 2){
        filas.each(function() {
            var concepto = $(this).find('td:eq(1)').text();
            if (concepto == 'Pago anticipado') { // Solo no pagados
                i = i +1;
                var folioPago = folioPago1 +'-FAn-'+ i;
                $.ajax({
                    url: 'prcd/guardar_recibo.php',
                    type: 'POST',
                    data: { 
                        folio_pago: folioPago,
                        fecha_pago: fechaSolicitud,
                        tarjeta: tarjeta,
                        tipo_pago: tipo_pago,
                        folio_contrato: foliContrato,
                        periodo: $(this).find('td:eq(0)').text(),
                        concepto: $(this).find('td:eq(1)').text(),
                        mes: $(this).find('td:eq(2)').text(),
                        total_pago: 0
                    },
                    success: function(data) {
                        console.log('Guardado pagos anticipados');
                        
                    }
                });
            }
            else{
                console.log('No se registró');
            }
        
        });
    }
    else {
        filas.each(function() {
            var concepto = $(this).find('td:eq(1)').text();
            if (concepto == 'Pago anticipado') { // Solo no pagados
                i = i +1;
                var folioPago = folioPago1 +'-FAn-'+ i;
                $.ajax({
                    url: 'prcd/guardar_recibo.php',
                    type: 'POST',
                    data: { 
                        folio_pago: folioPago,
                        fecha_pago: fechaSolicitud,
                        tarjeta: tarjeta,
                        tipo_pago: tipo_pago,
                        folio_contrato: foliContrato,
                        periodo: $(this).find('td:eq(0)').text(),
                        concepto: $(this).find('td:eq(1)').text(),
                        mes: $(this).find('td:eq(2)').text(),
                        total_pago: $(this).find('td:eq(3)').text()
                    },
                    success: function(data) {
                        console.log('Guardado pagos anticipados');
                        
                    }
                });
            }
        
        });
    }
}
    
function revisarPagosAtrasado() {

    var tarjeta = _grecibos('tipopagoBaucher').value;
    var tipo_pago = 1;

    const filas = $('#NuevaSolicitud tr');
    const pagos = [];
    const folioPago1 = $('#folioLabelpago').val();
    const foliContrato = document.getElementById('folioContratoRegistro').innerText;
    const fechaSolicitud = $('#fechaSolicitud').val();
    var i = 0;
    
    if (filas >= 2){
        filas.each(function() {
            var concepto = $(this).find('td:eq(1)').text();
            if (concepto == 'Adeudo') { // Solo no pagados
                i = i +1;
                var folioPago = folioPago1 +'-FAt-'+ i;
                $.ajax({
                    url: 'prcd/guardar_recibo.php',
                    type: 'POST',
                    data: { 
                        folio_pago: folioPago,
                        fecha_pago: fechaSolicitud,
                        tarjeta: tarjeta,
                        tipo_pago: tipo_pago,
                        folio_contrato: foliContrato,
                        periodo: $(this).find('td:eq(0)').text(),
                        concepto: $(this).find('td:eq(1)').text(),
                        mes: $(this).find('td:eq(2)').text(),
                        total_pago: 0
                    },
                    success: function(data) {
                        console.log('Guardado pagos atrasados');
                        
                    }
                });
            }
            else{
                console.log('No se registró');
            }
        });
    }
    else  {
        filas.each(function() {
            var concepto = $(this).find('td:eq(1)').text();
            if (concepto == 'Adeudo') { // Solo no pagados
                i = i +1;
                var folioPago = folioPago1 +'-FAt-'+ i;
                $.ajax({
                    url: 'prcd/guardar_recibo.php',
                    type: 'POST',
                    data: { 
                        folio_pago: folioPago,
                        fecha_pago: fechaSolicitud,
                        tarjeta: tarjeta,
                        tipo_pago: tipo_pago,
                        folio_contrato: foliContrato,
                        periodo: $(this).find('td:eq(0)').text(),
                        concepto: $(this).find('td:eq(1)').text(),
                        mes: $(this).find('td:eq(2)').text(),
                        total_pago: $(this).find('td:eq(3)').text()
                    },
                    success: function(data) {
                        console.log('Guardado pagos atrasados');
                        
                    }
                });
            }
        });
    }
}

function guardarRecibo() {

    var folio_pago = _grecibos('folioLabelpago').value;
    var fecha_pago = _grecibos('fechaClientepagos2').value;
    var tarjeta = _grecibos('tipopagoBaucher').value;
    var tipo_pago = _grecibos('tipopago').value;
    var folio_contrato = _grecibos('folioContratoRegistro').innerText;
    var total_pago = _grecibos('total-costo').innerText;

    var tarjeta = _grecibos('tipopagoBaucher').value;
    //var tipo_pago = 1;

    const filas = $('#NuevaSolicitud tr');
    const pagos = [];

    // Objeto para acumular los totales por período
    var totalesPorPeriodo = {};

    // Primero recorremos para sumar
    filas.each(function() {
        var periodo = $(this).find('td:eq(0)').text();
        var monto = parseFloat($(this).find('td:eq(3)').text()) || 0;
        
        if (!totalesPorPeriodo[periodo]) {
            totalesPorPeriodo[periodo] = 0;
        }
        totalesPorPeriodo[periodo] += monto;
    });

    $.ajax({
        url: 'prcd/guardar_recibo.php',
        type: 'POST',
        data: { 
            folio_pago: folio_pago,
            fecha_pago: fecha_pago,
            tarjeta: tarjeta,
            tipo_pago: tipo_pago,
            folio_contrato: folio_contrato,
            periodo: $(this).find('td:eq(0)').text(),
            concepto: $(this).find('td:eq(1)').text(),
            mes: $(this).find('td:eq(2)').text(),
            //total_pago: totalesPorPeriodo[periodoPago]
            total_pago: total_pago
        },
        success: function(datos) {
            // var datos = JSON.parse(JSON.stringify(response));

            var success = datos.success;
            console.log(success);
            if(success == 1){
                alert("Recibo guardado");
                document.getElementById('pagoreg').disabled = false;
                $('#pago').modal('hide');
                // queryDashboard1(pagina = 1);
                limpiarModalX();
                document.getElementById("datoscliente").hidden = true;
                queryDashboard1(pagina = 1);
            }
            else{
                alert("No se guardó recibo normal 1");
                //console.log(datos.error);
                alert(datos.error);
            }
        }
    });

    filas.each(function() {
        var concepto = $(this).find('td:eq(1)').text();
        var periodoPago = $(this).find('td:eq(0)').text();
        var montoActual = parseFloat($(this).find('td:eq(3)').text()) || 0;

        if (concepto == 'Pago oportuno' || concepto == 'Adeudo' || concepto == 'Pago anticipado') { // Solo no pagados
            
            }
            else{
                console.log('No se registró el pago 234');
                return;
            }
    });
}

function guardarRecibo999(){
    var folio_pago = _grecibos('folioLabelpago').value;
    var fecha_pago = _grecibos('fechaSolicitud').value;
    var tarjeta = _grecibos('tipopagoBaucher').value;
    var tipo_pago = _grecibos('tipopago').value;
    var folio_contrato = _grecibos('folioContratoRegistro').innerText;
    var total_pago = _grecibos('total-costo').innerText;
    var periodo = '0000-00';

    $.ajax({
        url: 'prcd/guardar_recibo.php',
        type: 'POST',
        data: { 
            folio_pago:folio_pago,
            fecha_pago:fecha_pago,
            tipo_pago:tipo_pago,
            tarjeta:tarjeta,
            folio_contrato:folio_contrato,
            total_pago:total_pago,
            periodo : periodo
        },
        dataType:'json',
        success: function(response) {
            // var datos = JSON.parse(JSON.stringify(response));

            var success = response.success;
            console.log(response);
    
            if(success == 1){
                alert("Recibo guardado");
                $('#pago').modal('hide');
                queryDashboard1(pagina = 1);
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            }
          
        },
        error: function(xhr, status, error) {
        alert("Error en la petición: " + error);
        console.error(xhr.responseText);
}
    });
}

function queryRecibo(pagina = 1){    
    $.ajax({
        type: "POST",
        url: "query/query_proximos_vencimiento_3.php",
        data: { pagina: pagina },
        dataType: "html",
        success: function(data) {
            $('#tablaProximos').html(data);
            
            // Agregar evento a los botones de paginación específicos
            $('.paginacion-vencimientos').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryRecibo(pagina);
            });
        }
    });
}

function queryRecibo2(pagina = 1){
        $.ajax({
        type: "POST",
        url: "query/query_proximos_vencimiento_2.php",
        data: { pagina: pagina },
        dataType: "html",
        success: function(data) {
            $('#tablaProximos2').html(data);
            
            // Agregar evento a los botones de paginación
            $('.paginacion-proximos').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryRecibo2(pagina);
            });
        }
    });
}

queryRecibo();
queryRecibo2();

function _pagosRealizados(el){
    return document.getElementById(el);
}

function abrirModalPagos(folio,periodo){
    const tabla = document.getElementById('tablaPagosBody');
    tabla.innerHTML = '';
    
    $("#listaPagosInv").modal("show");
    _pagosRealizados('folioPagoRealizado').innerText = "";
    _pagosRealizados('fechaPagoRealizado').innerText = "";
    _pagosRealizados('nombrePagoRealizado').innerText = "";
    _pagosRealizados('comunidadPagoRealizado').innerText = "";
    _pagosRealizados('periodoPagoRealizado').innerText = "";
    _pagosRealizados('totalPagoRealizado').innerText = "";
    _pagosRealizados('total-costoReimpresion').innerText = "";

    let folioPago = folio;
    $.ajax({
        type: "POST",
        url: "query/query_pago_query.php",
        data: {
            folio: folioPago,
            periodo: periodo
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
                _pagosRealizados('comunidadPagoRealizado').innerText = datos.comunidad;
                _pagosRealizados('periodoPagoRealizado').innerText = datos.periodo;
                _pagosRealizados('totalPagoRealizado').innerText = datos.total;
                _pagosRealizados('total-costoReimpresion').innerText = datos.total;

                // listado tabla
                listado.forEach((pago, index) => {
                    const fila = document.createElement('tr');

                    fila.innerHTML = `
                        <td>${index + 1}</td>
                        <td>${pago.concepto}</td>
                        <td>${pago.periodo}</td>
                        <td>$${parseFloat(pago.monto).toFixed(2)}</td>
                    `;

                    tabla.appendChild(fila);
                });
            }
        }
    });
}