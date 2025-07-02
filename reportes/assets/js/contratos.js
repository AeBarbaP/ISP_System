
function _(el){
    return document.getElementById(el);
}

function consultaContratosRep() {
    $.ajax({
        url: 'query/query_contratos.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosG').html(data);
            

        }
    });
}

function consultaClientesRep() {
    $.ajax({
        url: 'query/query_clientesRep.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#cliente_reporte_individual').html(data);
        }
    });
}

function buscarContratosRep(val){
    let nombre = val;
    $.ajax({
        url: 'query/query_contratosRep.php',
        type: 'POST',
        data:{
            nombre : nombre
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosGRep').html(data);
        }
    });
}