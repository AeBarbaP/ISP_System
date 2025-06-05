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