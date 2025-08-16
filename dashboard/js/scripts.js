function contratoNew() {
    $("#contrato").modal("show");

    // Obtener los elementos input
    const inputSiguienteMes = document.getElementById('siguienteMesInput');
    const inputMesMasCincoDias = document.getElementById('mesMasCincoDiasInput');
    const inputFechaActual = document.getElementById('dateContratoNew');
    // Obtener la fecha actual
    const fechaActual = new Date();

    // 1. Calcular el siguiente mes
    const siguienteMes = new Date(fechaActual);
    siguienteMes.setMonth(fechaActual.getMonth() + 1); // Sumar un mes

    // 2. Calcular un mes más cinco días
    const mesMasCincoDias = new Date(fechaActual);
    mesMasCincoDias.setMonth(fechaActual.getMonth() + 1); // Sumar un mes
    mesMasCincoDias.setDate(fechaActual.getDate() + 5);   // Sumar cinco días

    // Función para formatear la fecha en YYYY-MM-DD
    function formatearFecha(fecha) {
        const año = fecha.getFullYear();
        const mes = String(fecha.getMonth() + 1).padStart(2, '0'); // Meses van de 0 a 11
        const dia = String(fecha.getDate()).padStart(2, '0');
        return `${año}-${mes}-${dia}`;
    }

    // Formatear las fechas
    const siguienteMesFormateado = formatearFecha(siguienteMes);
    const mesMasCincoDiasFormateado = formatearFecha(mesMasCincoDias);
    const fechaActualFormateada = formatearFecha(fechaActual);

    // Asignar las fechas a los inputs
    inputFechaActual.value = fechaActualFormateada;
    inputSiguienteMes.value = siguienteMesFormateado;
    inputMesMasCincoDias.value = mesMasCincoDiasFormateado;

    document.getElementById("antenaContrato").addEventListener('keyup', function() { 
      this.value = 
        (this.value.toUpperCase()
        .replace(/[^\d|A-Z]/g, '')
        .match(/.{1,2}/g) || [])
        .join(".")
    });

    //comunidad();
    //municipio();
    //estado();
    catalogoPaquetes();
    generarFolio();
    //antenas();
}
function cambiarFecha() {

    // Obtener los elementos input
    const inputSiguienteMes = document.getElementById('siguienteMesInput');
    const inputMesMasCincoDias = document.getElementById('mesMasCincoDiasInput');
    const inputFechaActual = document.getElementById('dateContratoNew');
    // Obtener la fecha actual

    // const fechaActual = new Date();
    const fechaActual = new Date(inputFechaActual.value);

    // 1. Calcular el siguiente mes
    const siguienteMes = new Date(fechaActual);
    siguienteMes.setMonth(fechaActual.getMonth() + 1); // Sumar un mes

    // 2. Calcular un mes más cinco días
    const mesMasCincoDias = new Date(fechaActual);
    mesMasCincoDias.setMonth(fechaActual.getMonth() + 1); // Sumar un mes
    mesMasCincoDias.setDate(fechaActual.getDate() + 5);   // Sumar cinco días

    // Función para formatear la fecha en YYYY-MM-DD
    function formatearFecha(fecha) {
        const año = fecha.getFullYear();
        const mes = String(fecha.getMonth() + 1).padStart(2, '0'); // Meses van de 0 a 11
        const dia = String(fecha.getDate()).padStart(2, '0');
        return `${año}-${mes}-${dia}`;
    }

    // Formatear las fechas
    const siguienteMesFormateado = formatearFecha(siguienteMes);
    const mesMasCincoDiasFormateado = formatearFecha(mesMasCincoDias);
    const fechaActualFormateada = formatearFecha(fechaActual);

    // Asignar las fechas a los inputs
    // inputFechaActual.value = fechaActualFormateada;
    inputSiguienteMes.value = siguienteMesFormateado;
    inputMesMasCincoDias.value = mesMasCincoDiasFormateado;

    comunidad();
    municipio();
    estado();
    antenas();
    catalogoPaquetes();
    generarFolio();
}

// function cambiarFecha(){
//     const inputFechaActual = document.getElementById('dateContratoNew');

//     var fechaCambio = new Date(inputFechaActual.value);

// }

function ultimoAcceso(id){
    $.ajax({
        type: "POST",
        url: "query/query_ultimo_acceso.php",
        dataType: "json",
        data:{
            id:id
        },
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            var hora = datos.hora;
    
            if(success == 1){
                document.getElementById('ultimoAcceso').innerHTML = hora;
                
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            } 
        }
    });
}



/* function antenas(){
    $.ajax({
        type: "POST",
        url: "query/antenas.php",
        dataType: "html",
        success: function(data){
            $('#antenaContrato').html(data);  
        }
    });
}
function antenasEdit(){
    $.ajax({
        type: "POST",
        url: "query/antenas.php",
        dataType: "html",
        success: function(data){
            $('#antenaContratoEdit').html(data);  
        }
    });
} */

function comunidad(){
    $.ajax({
        type: "POST",
        url: "query/comunidades.php",
        dataType: "html",
        success: function(data){
            $('#catalogoComunidades').html(data);  
        }
    });
}
function municipio(){
    $.ajax({
        type: "POST",
        url: "query/municipios.php",
        dataType: "html",
        success: function(data){
            $('#catalogoMunicipios').html(data);  
        }
    });
}
function estado(){
    $.ajax({
        type: "POST",
        url: "query/estado.php",
        dataType: "html",
        success: function(data){
            $('#catalogoEstados').html(data);  
        }
    });
}
/* function catalogoPaquetes(){
    $.ajax({
        type: "POST",
        url: "query/paquetes.php",
        dataType: "html",
        success: function(data){
            $('#catalogoPaquetes').html(data);  
        }
    });
}
function catalogoPaquetesEdit(){
    $.ajax({
        type: "POST",
        url: "query/paquetes.php",
        dataType: "html",
        success: function(data){
            $('#catalogoPaquetesEdit').html(data);  
        }
    });
} */

function cuotaMensual(select){
    // Obtener el option seleccionado
    const selectedOption = select.options[select.selectedIndex];

    // Obtener el valor del atributo data-costo
    const costo = selectedOption.getAttribute('data-costo');

    // Obtener el input donde se colocará el costo
    const inputCosto = document.getElementById('inputCosto'); // Cambia 'inputCosto' por el ID de tu input

    // Asignar el costo al input
    if (costo) {
        inputCosto.value = costo;
    } else {
        inputCosto.value = ''; // Limpiar el input si no hay costo
    }
}
function _(el){
    return document.getElementById(el);
}


function limpiarModal(){
    $(".modal").on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
}
function limpiarModalX(){
    $(".modal").on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
    const button = document.getElementById('pagoreg');
    button.disabled = false;
}

function limpiar1modal(){
    //$(".modal").on('hidden.bs.modal', function () {
    //    $(this).find('form').trigger('reset');
    //});
      const button = document.getElementById('pagoreg');

    _('NuevaSolicitud').innerHTML = "";
    _('buscanombre').value = "";
    //$("#nombresClientes option[value='option1']").remove();
    _('nombresClientes').innerHTML = "";
   button.disabled = false;
    _('datosGenerales').innerHTML = "";
    _('nombresClientes').value = "";
    _('total-costo').innerText = "0.00";
}

function contratoNuevo() {
    var id = document.getElementById('folioLabelContrato').value;
    const url = `prcd/contrato.php?id=${encodeURIComponent(id)}`;
    window.open(url, '_blank'); // '_blank' abre en nueva pestaña
}
function contratoNuevo2() {
    var id = document.getElementById('folioLabelContratoEdit').value;
    const url = `prcd/contrato.php?id=${encodeURIComponent(id)}`;
    window.open(url, '_blank'); // '_blank' abre en nueva pestaña
}


function mostrarPwd1(){
    var valorCheck = _("mostrarPwd1");
    if(valorCheck.checked){
        _("pwdNew1").type = "text";
    }else{
        _("pwdNew1").type = "password";
    }
}
function mostrarPwd2(){
    var valorCheck = _("mostrarPwd");
    if(valorCheck.checked){
        _("pwdNewUsr").type = "text";
    }else{
        _("pwdNewUsr").type = "password";
    }
}

function generarFolio(){
    // Llamar a la función que genera el folio
    $.ajax({
        type: "POST",
        url: "prcd/generarFolio.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("folioLabelContrato").value = datos.folio;
            } else {
                alert("No se pudo generar el folio");
            }
        }
    });
    // y poner el resultado en el label con id "folioLabelContrato"
}

function generarFolioEdit(){
    // Llamar a la función que genera el folio
    $.ajax({
        type: "POST",
        url: "prcd/generarFolio.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("folioLabelContratoEdit").value = datos.folio;
            } else {
                alert("No se pudo generar el folio");
            }
        }
    });
    // y poner el resultado en el label con id "folioLabelContrato"
}
function generarFolio2(){
    // Llamar a la función que genera el folio
    $.ajax({
        type: "POST",
        url: "prcd/generarFolioPago.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("folioLabelpago").value = datos.folio;
            } else {
                alert("No se pudo generar el folio");
            }
        }
    });
    // y poner el resultado en el label con id "folioLabelContrato"
}
function generarFolioIncidencia(){
    // Llamar a la función que genera el folio
    $.ajax({
        type: "POST",
        url: "prcd/generarFolioIncidencia.php",
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            if(success == 1) {
                _("folio_incidencia").value = datos.folio;
            } else {
                alert("No se pudo generar el folio");
            }
        }
    });
    // y poner el resultado en el label con id "folioLabelContrato"
}
