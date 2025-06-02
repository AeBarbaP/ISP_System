function queryContratosNuevos(){
    $.ajax({
        type: "POST",
        url: "query/query_contratos.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("expNews2").value = datos.contratos;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryContratosNuevos();

function queryIncidencias(){
    $.ajax({
        type: "POST",
        url: "query/query_incidencias.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("filasTar").value = datos.incidencia;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}