function queryContratosNuevos(){
    $.ajax({
        type: "POST",
        url: "query/query_contratos.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("expNews2").innerHTML = datos.contratos;
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
                _("filasFallas").innerText = datos.incidencia;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryIncidencias();

function queryCortes(){
    $.ajax({
        type: "POST",
        url: "query/query_cortes.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("filasCortes").innerHTML = datos.cortes;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryCortes();

function queryCortes2(){
    $.ajax({
        type: "POST",
        url: "query/query_cortes.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("segundoCorte").innerText = datos.cortes;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryCortes2();

function queryVencimiento(){
    $.ajax({
        type: "POST",
        url: "query/query_proximos_vencimiento_2.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("vencidos2").innerHTML = datos.vencimiento;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryVencimiento();

function queryAlDia(){
    $.ajax({
        type: "POST",
        url: "query/query_pagos_al_corriente.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("alDia").innerHTML = datos.alDia;
            } else {
                console.log("No existen contratos");
            }
        }
    });
}

queryAlDia();

function queryLOG(pagina = 1){    
    $.ajax({
        type: "POST",
        url: "query/query_log.php",
        data: { pagina: pagina },
        dataType: "html",
        success: function(data){
            $('#tablaLOG').html(data);
            
            // Agregar evento a los botones de paginación específicos
            $('.paginacion-log').on('click', function(e) {
                e.preventDefault();
                var pagina = $(this).data('pagina');
                queryLOG(pagina);
            });
        }
    });
}

queryLOG();

function queryLOGTwitter(){
    $.ajax({
        type: "POST",
        url: "query/query_logTwitter.php",
        dataType: "html",
        success: function(data){
            $('#twitterLog').html(data);
        }
    });
}

queryLOGTwitter();