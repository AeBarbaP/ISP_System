
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

function consultaClientesRep(texto) {
    $.ajax({
        url: 'query/query_clientesRep.php',
        type: 'POST',
        data:{texto:texto},
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

catalogoPaquetesEdit();
function editarContratos(folio){
    $('#modalContratosEdit').modal('show');
    document.getElementById("antenaContratoEdit").addEventListener('keyup', function() { 
      this.value = 
        (this.value.toUpperCase()
        .replace(/[^\d|A-Z]/g, '')
        .match(/.{1,2}/g) || [])
        .join(".")
    });
    
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
                // antenasEdit(data.antena);
                _('folioLabelContratoEdit').value = data.folio;
                _('dateContratoEdit').value = data.fecha_contrato;
                _('nombreCompletoEdit').value = data.nombre;
                _('domicilioContratoEdit').value = data.domicilio;
                _('catalogoComunidadesEdit').value = data.comunidad;
                _('catalogoMunicipiosEdit').value = data.municipio;
                _('catalogoEstadosEdit').value = data.estado;
                _('cpContratoEdit').value = data.cp;
                _('telefonoContratoEdit').value = data.telefono;
                _('referenciasContratoEdit').value = data.referencias;
                _('identificacionContratoEdit').value = data.identificacion;
                _('comprobanteContratoEdit').value = data.comprobante;
                _('catalogoPaquetesEdit').value = data.servicio;
                _('antenaContratoEdit').value = data.antena;
                _('ipAddressContratoEdit').value = data.direccionip;
                _('ipAPEdit').value = data.direccion_ip_ap;
                _('inputCostoEdit').value = data.cuota;
                _('siguienteMesInputEdit').value = data.fecha_limite;
                _('mesMasCincoDiasInputEdit').value = data.fecha_corte;
                
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

function catalogoPaquetesEdit(){
    $.ajax({
        type: "POST",
        url: "query/paquetes.php",
        dataType: "html",
        success: function(data){
            $('#catalogoPaquetesEdit').html(data);  
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

function antenasEdit(id){
    $.ajax({
        type: "POST",
        data:{
            id:id
        },
        url: "query/antenasEdit.php",
        dataType: "html",
        success: function(data){
            $('#antenaContratoEdit').html(data);  
        }
    });
}

function cuotaMensual(select){
    // Obtener el option seleccionado
    const selectedOption = select.options[select.selectedIndex];

    // Obtener el valor del atributo data-costo
    const costo = selectedOption.getAttribute('data-costo');

    // Obtener el input donde se colocará el costo
    const inputCosto = document.getElementById('inputCostoEdit'); // Cambia 'inputCosto' por el ID de tu input

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

function guardarEditarContrato() {
    let name = _('nombre_buscarContrato').value;
    let folio = _('folioLabelContratoEdit').value;
    let nombre = _('nombreCompletoEdit').value;
    let domicilio = _('domicilioContratoEdit').value;
    let comunidad = _('catalogoComunidadesEdit').value;
    let municipio = _('catalogoMunicipiosEdit').value;
    let estado = _('catalogoEstadosEdit').value;
    let cp = _('cpContratoEdit').value;
    let telefono = _('telefonoContratoEdit').value;
    let referencia = _('referenciasContratoEdit').value;
    let identificacion = _('identificacionContratoEdit').value;
    let comprobante = _('comprobanteContratoEdit').value;
    let paquete = _('catalogoPaquetesEdit').value;
    let antena = _('antenaContratoEdit').value;
    let ip = _('ipAddressContratoEdit').value;
    let ipAP = _('ipAPEdit').value;
    let fechaContrato = _('dateContratoEdit').value;
    let fechaLimite = _('siguienteMesInputEdit').value;
    let fechaCorte =  _('mesMasCincoDiasInputEdit').value;
    let cuota = _('inputCostoEdit').value;
    
    $.ajax({
        url: 'prcd/prcd_editar_contratosEdicion.php',
        type: 'POST',
        data: {
            folio: folio,
            nombre: nombre,
            domicilio: domicilio,
            comunidad: comunidad,
            municipio: municipio,
            estado: estado,
            cp: cp,
            telefono: telefono,
            referencia: referencia,
            identificacion: identificacion,
            comprobante: comprobante,
            paquete: paquete,
            antena: antena,
            ip: ip,
            ipAP: ipAP,
            fechaContrato: fechaContrato,
            fechaLimite: fechaLimite,
            fechaCorte: fechaCorte,
            cuota: cuota
        },
        dataType: 'json',
        success: function(data) {
            let success = data.success;
            
            if(success == 1){
                alert('Contrato editado correctamente');
                $('#modalContratosEdit').modal('hide');
                consultaContratosRep();
                limpiarTabla();
                buscarContratosRep(name);
            }
            else{
                alert('Error al editar el contrato. Por favor, inténtalo de nuevo.');
                console.error('Error details:', data.error); // Log the error details for debugging
            }
        }
            
    });
}