function usuariosQueryG(){
    $.ajax({
        url: 'query/query_usuariosg.php',
        type: 'POST',
        dataType: 'html',
        success: function(response){
            $('#tablaUsuariosG').html(response);
        }
    });
}

function refrescarIndex() {
    window.location.reload();
}