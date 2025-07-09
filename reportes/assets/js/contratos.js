
function _(el){
    return document.getElementById(el);
}

function consultaContratosRep() {
    $.ajax({
        url: 'query/query_contratos.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosG').html(data);
            

        }
    });
}

function consultaClientesRep() {
    $.ajax({
        url: 'query/query_clientesRep.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#cliente_reporte_individual').html(data);
        }
    });
}

function buscarContratosRep(val){
    let nombre = val;
    if(nombre == ""){
        _('tablaContratosGRep').innerHTML = "";
        return;
    }
    $.ajax({
        url: 'query/query_contratosRep.php',
        type: 'POST',
        data:{
            nombre : nombre
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosGRep').html(data);
        }
    });
}

function buscarContratosRepFecha(){
    let fechaInicial = _('fecha_inicio_contratos').value;
    let fechaFinal = _('fecha_final_contratos').value;

    if( fechaInicial == "" || fechaFinal == ""){
        alert("Debes llenar ambas fechas");
        return;
    }

    $.ajax({
        url: 'query/query_contratosRep_fecha.php',
        type: 'POST',
        data:{
            fechaInicial : fechaInicial,
            fechaFinal : fechaFinal
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosGRep').html(data);
        }
    });
}

function cambiarEstatusCont(folio, estatus){
    let name = _('nombre_buscarContrato').value;
    if (confirm("¿Cambiar estatus del contrato?")) {
        $.ajax({
            url: 'prcd/prcd_cambiar_estatus_contrato.php',
            type: 'POST',
            data:{
                folio : folio,
                estatus : estatus
            },
            dataType: 'json',
            success: function(data) {
                let success = data.success;
                
                if(success = 1){
                    _('nombre_buscarContrato').value = name;
                    console.log(name);
                    buscarContratosRep(name);
                    alert('Estatus del contrato '+folio);
                }
            }
        });
    } else {
    // Code to execute if the user clicks "Cancel" (e.g., do nothing)
    console.log("No se cambió el estatus"); //prueba
    }
}

function editarContratos(folio){
    $('#modalContratosEdit').modal('show');
    catalogoPaquetes();
    antenas();
    $.ajax({
        url: 'query/query_contratos_editar.php',
        type: 'POST',
        data:{
            folio : folio
        },
        dataType: 'json',
        success: function(data) {
            let success = data.success;
            if(success == 1){
                _('folioLabelContrato').value = data.folio;
                _('dateContratoNew').value = data.fecha_contrato;
                _('nombreCompleto').value = data.nombre;
                _('domicilioContrato').value = data.domicilio;
                _('catalogoComunidades').value = data.comunidad;
                _('catalogoMunicipios').value = data.municipio;
                _('catalogoEstados').value = data.estado;
                _('cpContrato').value = data.cp;
                _('telefonoContrato').value = data.telefono;
                _('referenciasContrato').value = data.referencias;
                _('identificacionContrato').value = data.identificacion;
                _('comprobanteContrato').value = data.comprobante;
                _('catalogoPaquetes').value = data.servicio;
                _('antenaContrato').value = data.antena;
                _('ipAddressContrato').value = data.direccionip;
                _('inputCosto').value = data.cuota;
                _('siguienteMesInput').value = data.fecha_limite;
                _('siguienteMesInput').value = data.fecha_limite;
                _('mesMasCincoDiasInput').value = data.fecha_corte;
                _('mesMasCincoDiasInput').value = data.fecha_corte;
            }
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

    // antenas();
    // comunidad();
    // municipio();
    // estado();
    // catalogoPaquetes();
    // generarFolio();
}

function limpiarTabla(){
    _('tablaContratosGRep').innerHTML = "";
}