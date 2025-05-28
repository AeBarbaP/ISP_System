function accesos(){
    let usr = document.getElementById('usr').value;
    let pwd = document.getElementById('pwd').value;
    
    if (usr == "" || pwd == ""){
        alert("Debes llenar todos los campos");
        return;
    }
    
    $.ajax({
      type: "POST",
      data:{
        usr:usr,
        pwd:pwd
      },
      url: "prcd/acceso.php",
      dataType: "JSON",
      success: function(data){
        var datos = JSON.parse(JSON.stringify(data));
        
        var success = datos.success;
        if(success == 1){
          Swal.fire({
            icon: 'success',
            imageUrl: '../images/logo_conectwi_wide-removebg-preview.png',
            imageHeight: 100,
            title: 'Usuario correcto',
            text: 'Credenciales correctas',
            confirmButtonColor: '#3085d6',
            footer: 'CONECTWI',
            // Personalización del contenedor de la imagen
            didOpen: () => {
                const image = Swal.getImage();
                if (image) {
                    image.style.borderRadius = '0%'; // Fondo redondo
                    image.style.backgroundColor = ''; // Color de fondo
                    image.style.padding = '1px'; // Espaciado interno
                }
            }
        }).then(function(){window.location='dashboard.php';});
        }
        else
        {
            Swal.fire({
                icon: 'error',
                title: 'Datos incorrectos',
                text: 'Credenciales incorrectas',
                confirmButtonColor: '#3085d6',
                footer: 'CONECTWI'
            }).then(function(){window.location='index.html';});
            }
      }
    });
  }