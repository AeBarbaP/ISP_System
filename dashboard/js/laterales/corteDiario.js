//Inicia Gestión de Paquetes

function corteCajaDiario() {
    Swal.fire({
        title: "Seguro que deseas hacer corte de Caja?",
        text: "No podrás realizar ningún movimiento en el sistema",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí!"
        }).then((result) => {
            if (result.isConfirmed) {
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

function reporteCorteCaja() {

}