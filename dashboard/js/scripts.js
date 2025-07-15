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

    comunidad();
    municipio();
    estado();
    catalogoPaquetes();
    generarFolio();
    antenas();
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

    antenas();
    comunidad();
    municipio();
    estado();
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

function antenas(){
    $.ajax({
        type: "POST",
        url: "query/antenas.php",
        dataType: "html",
        success: function(data){
            $('#antenaContrato').html(data);  
        }
    });
}

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
function catalogoPaquetes(){
    $.ajax({
        type: "POST",
        url: "query/paquetes.php",
        dataType: "html",
        success: function(data){
            $('#catalogoPaquetes').html(data);  
        }
    });
}

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
function guardarContrato(){ 
    //Falta el folio
    let fechaContrato = _("dateContratoNew").value;
    let folio = _("folioLabelContrato").value;
    let nombreCompleto = _("nombreCompleto").value;
    let domicilioContrato = _("domicilioContrato").value;
    let catalogoComunidades = _("catalogoComunidades").value;
    let catalogoMunicipios = _("catalogoMunicipios").value;
    let catalogoEstados = _("catalogoEstados").value;
    let cpContrato = _("cpContrato").value;
    let telefonoContrato = _("telefonoContrato").value;
    let referenciasContrato = _("referenciasContrato").value;
    let identificacionContrato = _("identificacionContrato").value;
    let comprobanteContrato = _("comprobanteContrato").value;
    let catalogoPaquetes = _("catalogoPaquetes").value;
    let antenaContrato = _("antenaContrato").value;
    let ipAddressContrato = _("ipAddressContrato").value;
    let inputCosto = _("inputCosto").value;
    let siguienteMesInput = _("siguienteMesInput").value;
    let mesMasCincoDiasInput = _("mesMasCincoDiasInput").value;

    if(fechaContrato == "" || folio == "" || nombreCompleto == "" || domicilioContrato == "" || catalogoComunidades == "" || catalogoMunicipios == "" || catalogoEstados == "" || cpContrato == "" || telefonoContrato == "" || referenciasContrato == "" || identificacionContrato == "" || comprobanteContrato == "" || catalogoPaquetes == "" || antenaContrato == "" || ipAddressContrato == "" || inputCosto == "" || siguienteMesInput == "" || mesMasCincoDiasInput == ""){
        alert("Falta llenar campos del contrato");
        return;
    }

    $.ajax({
        type: "POST",
        url: "prcd/guardarContrato.php",
        data:{
            fechaContrato:fechaContrato,
            folio: folio,
            nombreCompleto:nombreCompleto,
            domicilioContrato:domicilioContrato,
            catalogoComunidades:catalogoComunidades,
            catalogoMunicipios:catalogoMunicipios,
            catalogoEstados:catalogoEstados,
            cpContrato:cpContrato,
            telefonoContrato:telefonoContrato,
            referenciasContrato:referenciasContrato,
            identificacionContrato:identificacionContrato,
            comprobanteContrato:comprobanteContrato,
            catalogoPaquetes:catalogoPaquetes,
            antenaContrato:antenaContrato,
            ipAddressContrato:ipAddressContrato,
            inputCosto:inputCosto,
            siguienteMesInput:siguienteMesInput,
            mesMasCincoDiasInput:mesMasCincoDiasInput
        },
        dataType: "json",
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
    
            var success = datos.success;
    
            if(success == 1){
                $('#contrato').modal('hide');
                limpiarModal();
                //$('#contrato').modal('reset');
                // limpiarCampos2();
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            }
        }
    });
}

function limpiarModal(){
    $(".modal").on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
}

function limpiar1modal(){
    //$(".modal").on('hidden.bs.modal', function () {
    //    $(this).find('form').trigger('reset');
    //});
    _('NuevaSolicitud').innerHTML = "";
    _('buscanombre').value = "";
    //$("#nombresClientes option[value='option1']").remove();
    _('nombresClientes').innerHTML = "";
    _('datosGenerales').innerHTML = "";
    _('nombresClientes').value = "";
    _('total-costo').innerText = "0.00";
}

function contratoNuevo() {
    var id = document.getElementById('folioLabelContrato').value;
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
