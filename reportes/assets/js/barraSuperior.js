function generarReporteIndClientes(){
    let cliente = _('cliente_reporte_individual').value;
    let fechaInicio = _('fecha_inicio_reportec').value;
    let fechaFinal = _('fecha_final_reportec').value;
    let tipoReporte = _('tipoReporteCliente').value;

    if (cliente == "" || fechaFinal == "" || fechaInicio == "" || tipoReporte == ""){
        alert("Por favor, completa todos los campos.");
        return;
    }

    if(tipoReporte == 1){
        $.ajax({
            url: 'query/query_reporte_cliente_individual2.php',
            type: 'POST',
            data: {
                cliente : cliente,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal
            },
            dataType: 'html',
            success: function(data) {
                $('#reportePagos').modal('show');
                $('#tablaPagosG').html(data);
                _('btnReportePagos').setAttribute('href','query/excel_query_reporte_cliente_individual2.php?cliente='+cliente+'&finicial='+fechaInicio+'&ffinal='+fechaFinal);
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
                _('btnReporteIndividualExcel').setAttribute('href','query/excel_query_reporte_cliente_individual3.php?cliente='+cliente+'&finicial='+fechaInicio+'&ffinal='+fechaFinal);
            }
        });
    }

}
// juntos ---------------------------
function modalFallasInd(){
    $('#reporteFallasInd2').modal('show');
    
    $.ajax({
        url: 'query/query_reporte_incidencias.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#reporteFallas').html(data);
        }
    });
}
// filtrado de fechas en fallas
function modalFallasIndDate(){
    let fechaInicio = _('fecha_inicio_incgral').value;
    let fechaFinal = _('fecha_final_incgral').value;

    if(fechaInicio == "" || fechaFinal == ""){
        alert('Debes llenar ambas fechas');
        return;
    }
    $.ajax({
        url: 'query/query_reporte_incidencias_fechas.php',
        type: 'POST',
        data:{
            fechaInicio: fechaInicio,
            fechaFinal: fechaFinal
        },
        dataType: 'html',
        success: function(data) {
            $('#reporteFallas').html(data);
        }
    });
}

// filtro de botones para fallas
$(document).ready(function() {
    $('input[name="btnradioRepFallas"]').on('change', function() {
        var value = $(this).val().toLowerCase();
        $("#usr_tablaGral tr").each(function() {
            var rowText = $(this).text().toLowerCase();
            $(this).toggle(rowText.indexOf(value) > -1);
        });
    });
});
// filtro de botones para fallas

// excel para fallas
function exportarExcelFallas() {
  const tabla = document.getElementById('tablaReportesFallasExcel');
  const html = tabla.outerHTML;
  const blob = new Blob([html], {type: 'application/vnd.ms-excel'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'reportesFallas.xls';
  a.click();
}
// excel para fallas


function reporteFallaG(folio){
    let folioReporte = folio;
    $.ajax({
        url: 'query/query_reporte_incidencias_individual.php',
        type: 'POST',
        data: {
            folioReporte : folioReporte
        },
        dataType: 'html',
        success: function(data) {
            $('#reporteFallasInd').modal('show');
            $('#reporteFallasInd2').modal('hide');
            $('#bodyFallasInd').html(data);
        }
    });
}
// juntos ---------------------------

// estos van juntos
function modalFallas(){
    $('#reporteIndividualInc').modal('show');
    
    $.ajax({
        url: 'query/query_reporte_incidencias2.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#inc_reporte').html(data);
        }
    });
}

function reporteFallaInd(){
    let folioReporte = _('inc_reporte').value;
    $.ajax({
        url: 'query/query_reporte_incidencias_individual.php',
        type: 'POST',
        data: {
            folioReporte : folioReporte
        },
        dataType: 'html',
        success: function(data) {
            $('#reporteIndividualInc').modal('hide');
            $('#reporteFallasInd').modal('show');
            $('#bodyFallasInd').html(data);
        }
    });
    
}
// estos van juntos

function generarReporteIndUsuarios(){
    let usuario = _('usr_reporte').value;
    let fechaInicio = _('fecha_inicio_reporteusr').value;
    let fechaFinal = _('fecha_final_reporteusr').value;
    let tipoReporte = _('tipoReporteUsr').value;
    
    if(tipoReporte == 1){ // general
        if (usuario == "" || fechaFinal == "" || fechaInicio == ""){
            alert("Por favor, completa todos los campos.");
            return;
        }
        $.ajax({
            url: 'query/query_reporte_usuario_individual1.php',
            type: 'POST',
            data: {
                usuario : usuario,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal
            },
            dataType: 'html',
            success: function(data) {
                $('#reporteUsuarioG').modal('show');
                $('#tablaUsuariosInd').html(data);
                
            }
        });
    }
    else if(tipoReporte == 2){ // Individual
        if (usuario == "" || fechaFinal == "" || fechaInicio == ""){
            alert("Por favor, completa todos los campos.");
            return;
        }
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
                _('reporteIndExcel').setAttribute('href','query/excel_query_reporte_usuario_individual2.php?usuario='+usuario+'&fechaInicio='+fechaInicio+'&fechaFinal='+fechaFinal);

            }
        });
    }

}

function generarReporteTecnicos(){
    let tecnico = _('tec_reporteInd').value;
    let fechaInicio = _('fecha_inicio_reportetec').value;
    let fechaFinal = _('fecha_final_reportetec').value;
    let tipoReporte = _('tipoReporteTec').value;

    if(tipoReporte == 1){ // general
        if (tecnico == "" || fechaFinal == "" || fechaInicio == ""){
            alert("Por favor, completa todos los campos.");
            return;
        }
        $.ajax({
            url: 'query/query_tecnicosGeneral2.php',
            type: 'POST',
            data: {
                tecnico : tecnico,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            },
            dataType: 'html',
            success: function(data) {
                $('#reportegeneralTecnicos').modal('show');
                $('#tec_tablaGral').html(data);
                _('reporteTecnicoExcel').setAttribute('href','query/excel_query_tecnicosGeneral2.php?tecnico='+tecnico);
            }
        });
    }
    else if(tipoReporte == 2){ // Individual
        if (tecnico == "" || fechaFinal == "" || fechaInicio == ""){
            alert("Por favor, completa todos los campos.");
            return;
        }
        $.ajax({
            url: '',
            type: 'POST',
            data: {
                usuario : usuario,
                fechaInicio, fechaInicio,
                fechaFinal : fechaFinal            
            },
            dataType: 'html',
            success: function(data) {
                $('#reporteUsuarioG').modal('show');
                $('#tec_tablaGral').html(data);
            }
        });
    }
}

function queryCortesReporteInd(){
    $('#reporteCorteInd').modal('show');
    $.ajax({
            url: 'query/query_cortes_individual.php',
            type: 'POST',
            dataType: 'html',
            success: function(data) {
                $('#corteserv_reporte').html(data);
            }
        });
}

function generarReporteCorteInd(){
    let folio = _('corteserv_reporte').value;
    // let fechaInicio = _('fecha_inicio_reportecorte').value;
    // let fechaFinal = _('fecha_final_reportecorte').value;
    let tipoReporte = _('tipoReporteCorte').value;

    if(tipoReporte == 2){ // general
        $.ajax({
            url: 'query/query_reporte_cortes_individual.php',
            type: 'POST',
            data: {
                folio : folio
                // fechaInicio, fechaInicio,
                // fechaFinal : fechaFinal            
                },
            dataType: 'html',
            success: function(data) {
                $('#reporteCorteInd').modal('hide');
                $('#reporteCorteInd2').modal('show');
                $('#cortes_detalle').html(data);
            }
        });
    }
    else if(tipoReporte == 1){ // Individual
        //  $.ajax({
        //     url: '',
        //     type: 'POST',
        //     data: {
        //         usuario : usuario,
        //         fechaInicio, fechaInicio,
        //         fechaFinal : fechaFinal            
        //     },
        //     dataType: 'html',
        //     success: function(data) {
        //         $('#reporteUsuarioG').modal('show');
        //         $('#tec_tablaGral').html(data);
        //     }
        // });
        console.log('X');
    }
}
function generarReporteCorteInd2(folio2){
    $('#modalReporteCortes').modal('hide');
    let folio = folio2;
    
        $.ajax({
            url: 'query/query_reporte_cortes_individual.php',
            type: 'POST',
            data: {
                folio : folio        
                },
            dataType: 'html',
            success: function(data) {
                $('#reportegeneralCortesServ').modal('hide');
                $('#reporteCorteInd2').modal('show');
                $('#cortes_detalle').html(data);
            }
        });
}

function generarReporteCorteGral(){
    $('#reportegeneralCortesServ').modal('show');
    
    $.ajax({
        url: 'query/query_reporte_cortes_gral.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#cortesserv_tablaGral').html(data);
        }
    });
}

function queryPagoIndividual(val){
    $('#reportePagoIndividual').modal('show');
    let folioPago = val;

    $.ajax({
        url: 'query/query_pagos_individual.php',
        type: 'POST',
        data:{
            folioPago : folioPago
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaPagoIndividualG').html(data);
        }
    });

}

function datosPagoIndividual(cliente){
    $.ajax({
            type: "POST",
            url: "query/query_pagos_individual_datos.php", 
            data: { 
                cliente: cliente
            },
            dataType: "json",
            success: function(response) {
                // podría fallar la consulta sin el strignfy
                let success = response.success;
                if (success == 1) {
                    _('nombrePG').innerHTML = response.nombre;
                    _('ncontratoPG').innerText = response.folio;
                    _('domicilioPG').innerText = response.domicilio;
                } else {
                    alert("Error al registrar el pago: " + response.message);
                }
            }
        });
}

function reporteCortes(){
    $.ajax({
        url: 'query/query_reporte_cortes_gral2.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tablaCortesReporte').html(data);
        }
    });
}