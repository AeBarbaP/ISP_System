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

function modalIndicenciasTecnico(){
    $('#modalIncidencias').modal('show');
}
function modalCortesTecnico(){
    $('#modalCortes').modal('show');
}