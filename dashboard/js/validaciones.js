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
}