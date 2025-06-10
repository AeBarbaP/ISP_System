function generarReporteIndClientes(){
    let cliente = _('cliente_reporte_individual').value;
    let fechaInicio = _('fecha_inicio_reportec').value;
    let fechaFinal = _('fecha_final_reportec').value;
    let tipoReporte = _('tipoReporteCliente').value;

    if(tipoReporte == 1){
        $.ajax({
            url: 'query/query_reporte_cliente_individual2.php',
            type: 'POST',
            data: {
                cliente : cliente,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            },
            dataType: 'html',
            success: function(data) {
                $('#reportePagos').modal('show');
                $('#tablaPagosG').html(data);
            }
        });
    }
    else if(tipoReporte == 2){
         $.ajax({
            url: 'query/query_reporte_cliente_individual3.php',
            type: 'POST',
            data: {
                cliente : cliente,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            
            },
            dataType: 'html',
            success: function(data) {
                $('#reportePagoIndividual').modal('show');
                $('#tablaPagoIndividualG').html(data);
            }
        });
    }

}

function modalFallasInd(){
    $('#reporteFallasInd').modal('show');

    $.ajax({
        url: 'query/query_reporte_incidencias.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#reporteFallas').html(data);
        }
    });
}
function modalFallas(){
    $('#reporteIndividualInc').modal('show');

    //$.ajax({
        //url: 'query/query_reporte_incidencias.php',
        //type: 'POST',
        //dataType: 'html',
        //success: function(data) {
            //$('#reporteFallas').html(data);
        //}
    //});
}

function generarReporteIndUsuarios(){
    let usuario = _('usr_reporte').value;
    let fechaInicio = _('fecha_inicio_reporteusr').value;
    let fechaFinal = _('fecha_final_reporteusr').value;
    let tipoReporte = _('tipoReporteUsr').value;

    if(tipoReporte == 1){ // general
        $.ajax({
            url: 'query/query_reporte_usuario_individual1.php',
            type: 'POST',
            data: {
                usuario : usuario,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            },
            dataType: 'html',
            success: function(data) {
                $('#reporteUsuarioG').modal('show');
                $('#tablaUsuariosInd').html(data);
            }
        });
    }
    else if(tipoReporte == 2){ // Individual
         $.ajax({
            url: 'query/query_reporte_usuario_individual2.php',
            type: 'POST',
            data: {
                usuario : usuario,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            
            },
            dataType: 'html',
            success: function(data) {
                $('#reporteUsuarioG').modal('show');
                $('#tablaUsuariosIndG').html(data);
            }
        });
    }

}