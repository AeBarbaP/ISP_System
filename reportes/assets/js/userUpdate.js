function myFunction() {
    var x = document.getElementById("passW");
    
    if (x.type == "password") {
        x.type = "text";
        document.getElementById("ojoabiertoIcon").hidden = false;
        document.getElementById("ojocerradoIcon").hidden = true;
    } else {
        x.type = "password";
        document.getElementById("ojoabiertoIcon").hidden = true;
        document.getElementById("ojocerradoIcon").hidden = false;
    }
}

function estatusCambio(x,y){
    var id = x;
    var estatus = y;
    
    $.ajax({
        url: 'prcd/cambiarEstatus.php',
        type: 'POST',
        data: {
            id: id,
            estatus: estatus
        },
        success: function(response){
            usuariosQuery();
        }
    });
}

function editarUsuario(a,b,c,d,e,f){
    var id = a;
    var nombre = b;
    var username = c;
    var pwd = d;
    var estatus = e;
    var perfil = f;
    
    $("#editar").modal("show");
    document.getElementById("idHidden").value = id;
    document.getElementById("nombreEditar").value = nombre;
    document.getElementById("userEditar").value = username;
    document.getElementById("perfilEditar").value = perfil;
    if (estatus == 1){
        document.getElementById("estatus1").checked = true;
        document.getElementById("estatus2").checked = false;
    } 
    else {
        document.getElementById("estatus1").checked = false;
        document.getElementById("estatus2").checked = true;
    }
    document.getElementById("passW").value = pwd;
}