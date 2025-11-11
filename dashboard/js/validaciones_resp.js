function hideInput(val){
    var valor = val;
    if (valor == 1){
        document.getElementById('foliosearch').hidden = false;
        document.getElementById('nombresearch').hidden = true;
        document.getElementById('domiciliosearch').hidden = true;
    }
    else if (valor == 2){
        document.getElementById('foliosearch').hidden = true;
        document.getElementById('nombresearch').hidden = false;
        document.getElementById('domiciliosearch').hidden = true;
    }
    else if (valor == 3){
        document.getElementById('foliosearch').hidden = true;
        document.getElementById('nombresearch').hidden = true;
        document.getElementById('domiciliosearch').hidden = false;
    }
}

function mostrardatos(){
    document.getElementById('datoscliente').hidden = false;
    document.getElementById('NuevaSolicitud').hidden = false;
    document.getElementById('pagodiv').hidden = false;
}

function cerrarpago(){
    document.getElementById('cerrarpago1').disabled = true;
}

function baucher(){
    var pago = document.getElementById('tipopago').value;

    if (pago == 1){
        document.getElementById('pagodiv2').hidden = true;
    }
    else if (pago == 2 || pago == 3 || pago == 4){
        document.getElementById('pagodiv2').hidden = false;
    }
    else {
        document.getElementById('pagodiv2').hidden = true;
    }
}

function descuento_promo(){
    //var descuento = document.getElementById('descuento');
    var promo = document.getElementById('promocion');

    // if (descuento.checked){
       // document.getElementById('monto_desc').disabled = false;
        //document.getElementById('addbtndesc').disabled = false;
   // }
   // else{
      //  document.getElementById('monto_desc').disabled = true;
      //  document.getElementById('addbtndesc').disabled = true;
   // }

    if (promo.checked){
        document.getElementById('promocionesPagos').disabled = false;
    }
    else {
        document.getElementById('promocionesPagos').disabled = true;
    }
}