function pagoNew() {
    $("#pago").modal("show");
    generarFolio2();
    queryConcepto();

    // Obtener los elementos input
    const inputFechaActual = document.getElementById('fechaSolicitud');
    // Obtener la fecha actual
    const fechaActual = new Date();

    // Función para formatear la fecha en YYYY-MM-DD
    function formatearFecha(fecha) {
        const año = fecha.getFullYear();
        const mes = String(fecha.getMonth() + 1).padStart(2, '0'); // Meses van de 0 a 11
        const dia = String(fecha.getDate()).padStart(2, '0');
        return `${año}-${mes}-${dia}`;
    }

    // Formatear las fechas
    const fechaActualFormateada = formatearFecha(fechaActual);

    // Asignar las fechas a los inputs
    inputFechaActual.value = fechaActualFormateada;

    // Inicia el ajax para los datos del usuario
}

function queryConcepto(){
    $.ajax({
        type: "POST",
        url: "query/query_conceptos.php",
        dataType: "html",
        success: function(data) {
            $('#catalogoConceptos').html(data);
        }
        });

        $.ajax({
            type: "POST",
            url: "query/query_paquetes.php",
            dataType: "html",
            success: function(data) {
                $('#Mensualidad').html(data);
            }
            });
}