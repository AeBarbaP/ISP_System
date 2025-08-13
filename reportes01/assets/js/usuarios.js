
function consultaUsuariosRep() {
    $.ajax({
        url: 'query/query_usuariosRep.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#usr_reporte').html(data);
        }
    });
}

function consultaUsuariosGeneral() {
    $.ajax({
        url: 'query/query_usuariosGeneral.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#usr_tablaGral').html(data);
        }
    });
}