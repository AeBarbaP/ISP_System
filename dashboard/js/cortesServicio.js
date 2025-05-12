function queryClientes() {
    $.ajax({
        url: 'query/query_clientesCorte.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#clientes_corte').html(data);
            // $('#clientesCorte').selectpicker('refresh');
        }
    });
}