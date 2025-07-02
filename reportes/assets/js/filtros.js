function queryClientes2(valor) {
    const select = document.getElementById('cliente_reporte_individual');
    const opciones = select.querySelectorAll('option');

    const texto = valor.toLowerCase();

    // Mostrar todas las opciones si el input está vacío
    if (texto === '') {
        opciones.forEach(op => {
            op.style.display = '';
        });
        return;
    }

    opciones.forEach(op => {
        // Saltar la opción por defecto "Selecciona..."
        if (op.textContent.trim().toLowerCase().includes(texto) || op.selected) {
            op.style.display = '';
        } else {
            op.style.display = 'none';
        }
    });
}

