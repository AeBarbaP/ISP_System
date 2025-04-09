
function consultaPagosRep() {
    $.ajax({
        url: 'query/query_pagos.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tablaPagosG').html(data);
        }
    });
}