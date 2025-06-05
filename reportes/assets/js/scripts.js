
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
                //alert("Contrato guardado");
                $('#contrato').modal('reset');
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
        _("editarcontraseniaUsr").type = "text";
    }else{
        _("editarcontraseniaUsr").type = "password";
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
