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

$(document).ready(function () {
        // $("#myInput").on("keyup", function () {
        $('input[name="btnradioFiltroC"]').on('change', function() {
            var value = $(this).val().toLowerCase();
            $("#tablaContratosGRep tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

// $(document).ready(function() {
//     // Filtro por botones de radio
//     $('input[name="btnradioFiltroC"]').on('change', function() {
//         var value = $(this).val().toLowerCase();
//         var columnaFiltro = 6; // Cambia este número según la columna donde está el estado
        
//         $('#tablaContratosGRep tr').each(function() {
//             // Saltar la fila de encabezados si existe
//             if ($(this).find('th').length) return;
            
//             var celdaEstado = $(this).find('td').eq(columnaFiltro).text().toLowerCase();
//             var mostrarFila = false;
            
//             switch(value) {
//                 case '1': // Activo
//                     mostrarFila = celdaEstado.includes('Activo');
//                     break;
//                 case '2': // Inactivo
//                     mostrarFila = celdaEstado.includes('Inactivo');
//                     break;
//                 case '3': // Cancelado
//                     mostrarFila = celdaEstado.includes('Cancelado');
//                     break;
//                 default:
//                     mostrarFila = true; // Mostrar todos si no hay selección
//             }
            
//             $(this).toggle(mostrarFila);
//         });
//     });

    // Opcional: Botón para limpiar filtros
//     $('#limpiarFiltros').on('click', function() {
//         $('input[name="btnradio"]').prop('checked', false);
//         $('#tablaContratosGRep tr').show();
//     });
// });