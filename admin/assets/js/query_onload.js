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
        url:"query/queryconteoGeneral.php",
        dataType: "json",
        cache: false,
        success: function(response)
        { 
            var jsonData = JSON.parse(JSON.stringify(response));
            var filas = jsonData.filas;
            var filasExp = jsonData.filasExp;
            var filasTar = jsonData.filasTar;
            var filasAct = jsonData.filasAct;

            console.log("Nuevos registros: "+filas);
            document.getElementById("expNews2").innerHTML = filas;
            console.log("Entrega credenciales: "+filasExp);
            document.getElementById("credEnt").innerHTML = filasExp;
            console.log("Tarjetones entregados: "+filasTar);
            document.getElementById("filasTar").innerHTML = filasTar;
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