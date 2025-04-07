function queryPromocion() {
    $.ajax({
        type: "POST",
        url: "query/query_promocion.php",
        dataType: "html",
        success: function(data) {
            $('#promocionesList').html(data);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

//------------- Registrar pago --------------------------------
//------------- Pagos dashboard --------------------------------

function queryDashboard1() {
    $.ajax({
        type: "POST",
        url: "query/dashboard1.php",
        dataType: "HTML",
        success: function(data) {
            $('#dashboard1').html(data);
        }
    });
}

queryDashboard1();