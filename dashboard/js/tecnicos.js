function datosTecnicosModalB(){
    $.ajax({
    url: 'query/query_incidencias_tecnicos.php',
    type: 'POST',
    dataType: 'html',
    success: function (response) {
        $('#incidenciasModalB').html(response);
    }
  });

//   $.ajax({
//     url: 'query/query_cortes_tecnicos.php',
//     type: 'POST',
//     dataType: 'html',
//     success: function (response) {
//         $('#cortesModalB').html(response);
//     }
//   });

}