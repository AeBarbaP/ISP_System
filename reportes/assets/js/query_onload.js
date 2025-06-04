function usuariosQueryLogs(){
    $.ajax({
        url: 'query/query_usuarioslog.php',
        type: 'POST',
        dataType: 'html',
        success: function(response){
            $('#usuariosTabla').html(response);
        }
    });
}

function conteoGeneralCards(){ 
    $.ajax({
        type:"POST",
        url:"query/query_conteogeneral.php",
        dataType: "json",
        cache: false,
        success: function(response)
        { 
            var jsonData = JSON.parse(JSON.stringify(response));
            var filas = jsonData.filas;
            var cortes = jsonData.cortes;
            var fallas = jsonData.fallas;
            var filasAct = jsonData.filasAct;

            //console.log("Nuevos registros: "+filas);
            document.getElementById("filasContratos").innerHTML = filas;
            //console.log("Entrega credenciales: "+filasExp);
            document.getElementById("filasFallas").innerHTML = filasExp;
            //console.log("Tarjetones entregados: "+filasTar);
            document.getElementById("filasCortes").innerHTML = filasTar;
        }
    });
}

function usuariosQuery(){
    $.ajax({
        url: 'query/query_usuarios.php',
        type: 'POST',
        dataType: 'html',
        success: function(response){
            $('#tablaUsuarios').html(response);
        }
    });
}