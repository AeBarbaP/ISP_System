function queryClientes2(valor) {
    const select = document.getElementById('cliente_reporte_individual');
    const opciones = select.querySelectorAll('option');

    const texto = valor.toLowerCase();

    // Mostrar todas las opciones si el input está vacío
    if (texto === '') {
        opciones.forEach(op => {
            op.style.display = '';
        });
        return;
    }

    opciones.forEach(op => {
        // Saltar la opción por defecto "Selecciona..."
        if (op.textContent.trim().toLowerCase().includes(texto) || op.selected) {
            op.style.display = '';
        } else {
            op.style.display = 'none';
        }
    });
}

function datosClienteRepIN(val){
    $.ajax({
        url: 'query/query_datos_reporteClienteIND.php',
        type: 'POST',
        dataType: 'json',
        data:{
            val : val
        },
        success: function(response) {
            let success = response.success;
                if (success == 1) {
                    _('nombreReporteCIND').innerText = response.nombre;
                    _('domicilioReporteCIND').innerText = response.domicilio;
                } else {
                    alert("Error " + response.message);
                }
        }
    });
}

$(document).ready(function () {
        // $("#myInput").on("keyup", function () {
        $('input[name="btnradioFiltroC"]').on('change', function() {
            var value = $(this).val().toLowerCase();
            $("#tablaContratosGRep tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

$(document).ready(function () {

        $('input[name="nombre_buscar_pagoREP"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#tablaPagosGRep tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

$(document).ready(function () {

        $('input[name="nombreUsuariosGlobalR"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#tablaUsuariosIndG tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
    
$(document).ready(function () {

        $('input[name="nombreReporteUserG"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#usr_tablaGral tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

$(document).ready(function () {

        $('input[name="nombre_buscar_tec_rep"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#tec_tablaGral tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    $(document).ready(function () {
        // $("#myInput").on("keyup", function () {
        $('input[name="btnradioFiltroTegG"]').on('change', function() {
            var value = $(this).val();
            $("#tec_tablaGral tr").filter(function () {
                $(this).toggle($(this).text().indexOf(value) > -1)
            });
        });
    });

    $(document).ready(function () {

        $('input[name="buscar_inc_rep"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#reporteFallas tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

     $(document).ready(function () {
        // $("#myInput").on("keyup", function () {
        $('input[name="btnradioFallasR"]').on('change', function() {
            var value = $(this).val();
            $("#reporteFallas tr").filter(function () {
                $(this).toggle($(this).text().indexOf(value) > -1)
            });
        });
    });

    $(document).ready(function () {

        $('input[name="buscar_inc_rep"]').on('input', function() {
            var value = $(this).val().toLowerCase();
            $("#reporteFallas tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    