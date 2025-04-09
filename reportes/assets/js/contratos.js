
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
        url: 'query/query_clientes.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#cliente_reporte').html(data);
        }
    });
}