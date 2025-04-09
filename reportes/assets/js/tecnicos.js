
function consultaTecnicosRep() {
    $.ajax({
        url: 'query/query_tecnicosRep.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tec_reporteInd').html(data);
        }
    });
}

function consultaTecnicosGeneral() {
    $.ajax({
        url: 'query/query_tecnicosGeneral.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tec_tablaGral').html(data);
        }
    });
}