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

function swalpago(){
    Swal.fire({
		position: "top-end",
		icon: "success",
		title: "Pago Exitoso",
		showConfirmButton: false,
		timer: 1500
	});
    document.getElementById('printticket').hidden = false;
    document.getElementById('pagoreg').hidden = true;
}

function cerrarpago(){
    document.getElementById('printticket').hidden = true;
    document.getElementById('cerrarpago1').hidden = false;
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