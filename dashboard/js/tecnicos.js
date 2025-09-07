function datosTecnicosModalB(){
    $.ajax({
    url: 'query/query_incidencias_tecnicos.php',
    type: 'POST',
    dataType: 'html',
    success: function (response) {
        $('#accordionCortes').html(response);
    }
  });
}

function datosTecnicoCortes(){
    $.ajax({
    url: 'query/query_cortes_tecnicos.php',
    type: 'POST',
    dataType: 'html',
    success: function (response) {
        $('#tecnicosCortes').html(response);
    }
  });
}

function modalIndicenciasTecnico(id){
    $('#modalIncidencias').modal('show');
    $('#idIncidenciaTecnico').val(id);
}
function modalCortesTecnico(id){
    $('#modalCortes').modal('show');
    $('#idCorteTecnico').val(id);
}

function cerrarIncidenciaTecnico(){
    let idUsr = sessionStorage.getItem("idUsr");
    let id = $('#idIncidenciaTecnico').val();
    let comentario = $('#comentariosTecnicos').val();

    $.ajax({
        url: 'prcd/prcd_cerrar_incidencia_tecnico.php',
        type: 'POST',
        data: {
            username: idUsr,
            id: id,
            comentario: comentario
        },
        success: function(response) {
            let success = response.success;
            if (success = 1) {
                alert('Incidencia cerrada correctamente');
                document.getElementById('comentariosTecnicos').value = "";
                $('#modalIncidencias').modal('hide');
                datosTecnicosModalB();
            } else {
                alert('Error al cerrar la incidencia');
            }
        },
        error: function() {
            alert('Error en la conexión con el servidor');
        }
    });
}

function cerrarCorteTecnico(){
    let idUsr = sessionStorage.getItem("idUsr");
    let id = $('#idCorteTecnico').val();
    let comentario = $('#comentariosTecnicosCorte').val();

    $.ajax({
        url: 'prcd/prcd_cerrar_corte_tecnico.php',
        type: 'POST',
        data: {
            username: idUsr,
            id: id,
            comentario: comentario
        },
        success: function(response) {
            let success = response.success;
            if (success = 1) {
                alert('Corte cerrado correctamente');
                document.getElementById('comentariosTecnicosCorte').value = "";
                $('#modalCortes').modal('hide');
                datosTecnicoCortes();
            } else {
                alert('Error al cerrar el corte');
            }
        },
        error: function() {
            alert('Error en la conexión con el servidor');
        }
    });
}