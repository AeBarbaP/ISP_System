//Inicia Gestión de Paquetes

function corteCajaDiario() {
    Swal.fire({
        title: "¿Seguro que deseas hacer corte de Caja?",
        text: "No podrás realizar ningún movimiento en el sistema",
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí!"
        }).then((result) => {
            if (result.isConfirmed) {
            generarCorteCaja();
            Swal.fire({
                title: "Corte de Caja!",
                text: "Se ha realizado el corte del día, nos vemos mañana!.",
                icon: "success"
            });
            bloquearTodo();
            document.getElementById('menuCorteCaja').disabled = true;
            }
        });

}

function revisarCorte(){

  $.ajax({
    url: 'query/corteCaja.php',
    type: 'POST',
    dataType: 'json',
    success: function(data) {
      var datos = JSON.parse(JSON.stringify(data));
      var success = datos.success;
    
            if (success == 1) {
                Swal.fire({
                    icon: 'warning',
                    imageUrl: '../images/logo_conectwi_wide-removebg-preview.png',
                    imageHeight: 100,
                    title: '¡Atención!',
                    text: 'Ya realizaste corte de caja el día de hoy',
                    confirmButtonColor: '#3085d6',
                    footer: 'ConectWI'
                });


              
            }
            else{
                Swal.fire({
                    icon: 'success',
                    imageUrl: '../images/logo_conectwi_wide-removebg-preview.png',
                    imageHeight: 100,
                    title: 'Bienvenido al sistema',
                    text: 'Acceso correcto',
                    confirmButtonColor: '#3085d6',
                    footer: 'ConectWI'
                });
            }
    }
  });
}

function generarCorteCaja(){
  $.ajax({
    url: 'prcd/generarCorteCaja.php',
    type: 'POST',
    dataType: 'json',
    success: function(data) {
      var datos = JSON.parse(JSON.stringify(data));
      var success = datos.success;
        if (success == 1) {
          console.log("Corte generado");
        }
        else{
          console.log("No se generó corte");
        }
    }
  });
}

function bloquearTodo(){
    const elementos = document.querySelectorAll('.bloquearNav');
    const bloquearmenus = document.querySelectorAll('.bloquearMenus');
    const coloresNav = document.querySelectorAll('.coloresNav');
    const corte = document.querySelectorAll('.corteCaja');

    elementos.forEach(elemento => {
        elemento.disabled = true;
        elemento.classList.add('deshabilitado');
        elemento.removeAttribute('href');
        elemento.removeAttribute('onclick');
        elemento.style.cursor = 'not-allowed';
        elemento.style.opacity = '0.6';
    });
    coloresNav.forEach(color => {
        color.setAttribute('colors','primary:#ff5733')
        color.style.opacity = '0.3';
    });
    bloquearmenus.forEach(bMenu => {
        bMenu.setAttribute('colors','primary:#ff5733')
        bMenu.style.opacity = '0.3';
        bMenu.disabled = true;
    });
    corte.forEach(corteCaja => {
        corteCaja.setAttribute('colors','primary:#ff5733')
        corteCaja.style.opacity = '0.3';
        corteCaja.disabled = true;
        corteCaja.removeAttribute('onclick');
    });

}

function reporteCorteCaja() {

}