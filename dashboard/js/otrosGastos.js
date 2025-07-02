function guardarOtrosGastos(){
    let concepto = document.getElementById("conceptoOtrosGastos").value;
    let cantidad = document.getElementById("cantidadOtrosGastos").value;
    let fecha = document.getElementById("fechaOtrosGastos").value;
    let idUsuario = document.getElementById("idOtrosGastos").value;

    if (concepto === "" || cantidad === "" || fecha === "") {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Por favor, completa todos los campos.'
        });
        return;
    }
    if (isNaN(cantidad) || cantidad <= 0) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'La cantidad debe ser un número positivo.'
        });
        return;
    }

    $.ajax({
        type: "POST",
        url: "prcd/guardar_otrosGastos.php",
        data: {
            concepto: concepto,
            cantidad: cantidad,
            fecha: fecha,
            idUsuario: idUsuario
        },
        success: function(data) {
            
            let datos = JSON.parse(JSON.stringify(data));
            let success = datos.success;
            if (success = 1) {
                Swal.fire({
                    icon: 'success',
                    title: 'Éxito',
                    text: 'Otros gastos registrados correctamente.',
                    confirmButtonColor: '#3085d6'
                }).then(function() {
                    $('#modalOtrosGastos').modal('hide');
                    modalReporteOtrosGastos();
                    limpiarModal();
                    // Aquí puedes agregar una función para actualizar la lista de otros gastos si es necesario
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'No se pudo registrar los otros gastos. Inténtalo de nuevo.'
                });
            }
        }
    });
}

function modalOtrosGastos(){
    $('#modalOtrosGastos').modal('show');

    let fecha = obtenerFechaHoy();
    _('fechaOtrosGastos').value = fecha;

}

function modalReporteOtrosGastos(){
    $('#modalReporteOtrosGastos').modal('show');
    let fecha = obtenerFechaHoy();
    _('fechaOtrosPagosDate').value = fecha;
    let usr = _('idReporteTablaOtrosGastos').value;

    $.ajax({
        type: "POST",
        url: "query/query_otros_gastos.php",
        data: {
            usr: usr
        },
        success: function(data) {
            $('#tablaOtrosGastos').html(data); 
        }
    });
}

function cambioFechaOtrosGastos(){
    let fecha = _('fechaOtrosPagosDate').value;
    let usr = _('idReporteTablaOtrosGastos').value;

    $.ajax({
        type: "POST",
        url: "query/query_otros_gastos2.php",
        data: {
            usr: usr,
            fecha: fecha
        },
        success: function(data) {
            $('#tablaOtrosGastos').html(data); 
            _('btnReporteTablaOtrosGastos').setAttribute('href','query/excel_query_otros_gastos2.php?usr='+usr+'&fecha='+fecha+'>')
        }
    });
}