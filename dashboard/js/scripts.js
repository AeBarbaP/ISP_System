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
    let fechaContrato = _("dateContratoNew").value;
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

    $.ajax({
        type: "POST",
        url: "prcd/guardarContrato.php",
        data:{
            fechaContrato:fechaContrato,
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
                alert("Contrato guardado");
                $('#contrato').modal('hide');
                // limpiarCampos2();
            }
            else{
                alert("No se guardó");
                console.log(datos.error)
            }
        }
    });
}