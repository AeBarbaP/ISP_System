function guardarUser(){
    var username = document.getElementById('username').value;
    var nombre = document.getElementById('nombre').value;
    var perfil = document.getElementById('perfil').value;
    var pwd = document.getElementById('pwd').value;
    var color = document.getElementById('colorUser').value;

    if (username == "" || nombre == "" || perfil == "" || pwd == ""){
        alert("Todos los campos son obligatorios");
    
    }
    else{
        $.ajax({
            url: 'prcd/agregarUser.php',
            type: 'POST',
            data: {
                username:username,
                nombre:nombre,
                perfil:perfil,
                pwd:pwd,
                color:color
            },
            success: function(response){
                var jsonData = JSON.parse(JSON.stringify(response));
                var success = jsonData.success;
                if (success = 1){
                    Swal.fire({
                        icon: "success",
                        title: "Registro correcto",
                        footer: "SUIDEV - INCLUSIÓN 2024",
                        showCancelButton: false,
                        confirmButtonColor: "#3085d6",
                        confirmButtonText: "OK"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            refrescarIndex();
                        }
                    });
                }
                else {
                    Swal.fire({
                        icon: "error",
                        title: "Error al registrar",
                        footer: "SUIDEV - INCLUSIÓN 2024"
                    });
                }
            }
        });
    }
}