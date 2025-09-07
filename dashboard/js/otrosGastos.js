function _(el){
  return document.getElementById(el);
}

function guardarOtrosGastos(){
    let idUsr = sessionStorage.getItem("idUsr");
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
            idUsuario: idUsr
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
                    queryDashboardGastos();
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
    $('#modalReporteOtrosGastos').modal('hide');

    let fecha = obtenerFechaHoy();
    _('fechaOtrosGastos').value = fecha;

}

function modalReporteOtrosGastos(){
    $('#modalReporteOtrosGastos').modal('show');
    $('#modalOtrosGastos').modal('hide');
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

function editarOtroGasto(id){
    $('#modalReporteOtrosGastos').modal('hide');
    $('#modalEditarOtrosGastos').modal('show');
    $.ajax({
        type: "POST",
        url: "query/query_editar_otros_gastos.php",
        data: {
            id: id
        },
        dataType: "json",
        success: function(data) {
            let success = data.success;
            if(success = 1){
                document.getElementById('fechaEditarOtrosGastos').value = data.fecha;
                document.getElementById('conceptoEditarOtrosGastos').value = data.concepto;
                document.getElementById('cantidadEditarOtrosGastos').value = data.cantidad;
                document.getElementById('idRowEditarOtrosGastos').value = data.id;
            }
            else{
                console.log(data.error);
            }
        }
    });

}

function guardarEditarOtrosGastos(){
    let user = sessionStorage.getItem("username");
    let concepto = document.getElementById("conceptoEditarOtrosGastos").value;
    let cantidad = document.getElementById("cantidadEditarOtrosGastos").value;
    let fecha = document.getElementById("fechaEditarOtrosGastos").value;
    let id = document.getElementById("idRowEditarOtrosGastos").value;

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
        url: "prcd/editar_otrosGastos.php",
        data: {
            concepto: concepto,
            cantidad: cantidad,
            fecha: fecha,
            id: id,
            username: user
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
                    $('#modalEditarOtrosGastos').modal('hide');
                    modalReporteOtrosGastos();
                    limpiarModal();
                    queryDashboardGastos();
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

function eliminarOtroGasto(id){
    let user = sessionStorage.getItem("username");
    if(confirm('¿Desea eliminar otro pago')){
        $.ajax({
        type: "POST",
        url: "prcd/prcd_eliminar_otros_gastos.php",
        data: {
            username: user,
            id: id
        },
        success: function(data) {
            let success = data.success;
            if(success = 1){
                alert('Otro pago, eliminado');
                let fecha = _('fechaOtrosPagosDate').value;
                cambioFechaOtrosGastos();
                modalReporteOtrosGastos();
                queryDashboardGastos();
            }
            else{
                console.log(data.error);
            }
        }
    });
    }
}