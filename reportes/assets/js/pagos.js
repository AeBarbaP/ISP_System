function limpiarModal(){
    $(".modal").on('hidden.bs.modal', function () {
        $(this).find('form').trigger('reset');
    });
}

function queryClientes(cliente) {
    $.ajax({
        type: "POST",
        url: "query/query_clientes.php",
        data: { 
            cliente: cliente 
        },
        dataType: "json",
        success: function(data) {
            let options = '';
            data.forEach(function(item) {
                options += `<option value="${item.nombre}" data-folio="${item.folio}" data-comunidad="${item.comunidad}">`;
            });
            $('#nombresClientes').html(options);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

$(document).ready(function() {
    $('#buscanombre').on('change', function() {
        const selectedValue = $(this).val();
        const selectedOption = $(`#nombresClientes option[value="${selectedValue}"]`);
        const folio = selectedOption.data('folio');

        if (folio) {
            ejecutarFuncionConFolio(folio);
        } else {
            console.error("No se encontró un folio válido para la selección.");
        }
    });
});

function ejecutarFuncionConFolio(folio) {
    console.log("Folio seleccionado:", folio);
    _("datosGenerales").innerHTML = "";

    // Aquí puedes hacer lo que necesites con el folio
    $.ajax({
        type: "POST",
        url: "query/query_datos_clientes.php",
        data: { 
            folio:folio 
        },
        dataType: "json",
        success: function(data) {
            document.getElementById("datoscliente").hidden = false;
            let datosGenerales = '';
            data.forEach(function(item) {
                datosGenerales += `
                <div class="alert alert-info mb-2" role="alert">
                <h3>${item.nombre}</h3><span>Folio Contrato: ${item.folio}</span><br>
                <span>Domicilio:${item.domicilio}</span>
                <br>
                <h3>${item.nombre}</h3><span>Folio Contrato: ${item.folio}</span><br>
                <span>Comunidad:${item.comunidad}</span>
                <br>
                <span>Teléfono: ${item.telefono}</span>
                </div>`;
            });
            $('#datosGenerales').html(datosGenerales);

             // Llamar a la función para generar la tabla de pagos
            generarTablaPagos(folio);
        }
    });
}

function generarTablaPagos(folio) {
    $.ajax({
        type: "POST",
        url: "query/query_pagos_cliente.php",
        data: { 
            folio: folio 
        },
        dataType: "json",
        success: function(data) {
            let nuevoFolio = folio;
            let folioPago = _("folioLabelpago").value;
            let tablaPagos = '';
            const meses = [
                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
            ];

            // Recorrer los pagos recibidos
            data.forEach((pago) => {
                const mesNumero = pago.mes;
                const mesNombre = meses[mesNumero - 1];
                
                if (pago.pagado === false) {
                    // Mes sin pago
                    tablaPagos += `
                        <tr class="bg-light">
                            <td>${mesNumero}</td>
                            <td>${mesNombre}</td>
                            <td>Mensualidad</td>
                            <td>${mesNombre}</td>
                            <td></td>
                            <td><span class="badge bg-primary text-light" style="cursor: pointer;" onclick="registrarPago('${folioPago}','${nuevoFolio}', ${mesNumero})">Agregar</span></td>
                        </tr>
                    `;
                } 
            });

            document.getElementById("NuevaSolicitud").hidden = false;
            $('#NuevaSolicitud').html(tablaPagos);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
        }
    });
}

//------------- Registrar pago --------------------------------
function registrarPago(folioPago, folio, mes) {
    if (confirm("¿Estás seguro de registrar el pago para este mes?")) {
        $.ajax({
            type: "POST",
            url: "query/registrar_pago.php", // Archivo PHP que registrará el pago
            data: { 
                folioPago: folioPago,
                folio: folio,
                mes: mes
            },
            dataType: "json",
            success: function(response) {
                if (response.success) {
                    alert("Pago registrado correctamente.");
                    generarTablaPagos(folio); // Recargar la tabla de pagos
                } else {
                    alert("Error al registrar el pago: " + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("Error en la solicitud AJAX: ", textStatus, errorThrown);
                alert("Error al registrar el pago.");
            }
        });
    }
}
//------------- Pagos dashboard --------------------------------

function queryDashboard1() {
    $.ajax({
        type: "POST",
        url: "query/dashboard1.php",
        dataType: "HTML",
        success: function(data) {
            $('#dashboard1').html(data);
        }
    });
}

queryDashboard1();

function buscarPagosRepFecha(){
    let fechaInicial = _('fecha_inicio_pagosRep1').value;
    let fechaFinal = _('fecha_inicio_pagosRep2').value;

    if(fechaInicial == "" || fechaFinal == ""){
        alert("Debes llenar ambas fechas");
        return;
    }
    /* if(nombre == ""){
        _('tablaContratosGRep').innerHTML = "";
        return;
    } */
    $.ajax({
        url: 'query/query_pagosRep.php',
        type: 'POST',
        data:{
            fechaInicial : fechaInicial,
            fechaFinal : fechaFinal
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaPagosGRep').html(data);
        }
    });
}

function pagosIndividuales(folio,x) {
    const tabla = document.getElementById('tablaPagosBody');
    tabla.innerHTML = '';
    if (x == 1){
        $('#modalSolicitudesPagos').modal('hide');
        $('#listaPagosInv').modal('show');
        _('btnListaPagosInv').setAttribute('onclick','querySolicitudes()');
    } else if (x == 2){
        $('#modalReportePagos').modal('hide');
        $('#listaPagosInv').modal('show');
        _('btnListaPagosInv').setAttribute('onclick','queryPagosDiarios()');
    }
    _('folioPagoRealizado').innerText = "";
    _('fechaPagoRealizado').innerText = "";
    _('nombrePagoRealizado').innerText = "";
    _('totalPagoRealizado').innerText = "";

    $.ajax({
        type: "POST",
        url: "query/query_pago_query.php",
        data:{folio: folio},
        dataType: "json",
        success: function(data) {
            let success = data.success;
            var listado = data.listado;
            console.log(listado);
            if (success == 1){
                _('folioPagoRealizado').innerText = data.folio_pago;
                _('fechaPagoRealizado').innerText = data.fechaPago;
                _('nombrePagoRealizado').innerText = data.nombre;
                _('totalPagoRealizado').innerText = data.total;

                // listado tabla
                listado.forEach((pago, index) => {
                    const fila = document.createElement('tr');

                    fila.innerHTML = `
                        <td>${index + 1}</td>
                        <td>${pago.concepto}</td>
                        <td>$${parseFloat(pago.monto).toFixed(2)}</td>
                    `;

                    tabla.appendChild(fila);
                });
            }
        }
    });
}

function imprimirSeleccion2(nombre, nombre2) {
    const ventimp = window.open('', 'popimpr');
    const fecha = new Date().toLocaleDateString();
    const rutaLogo = '../images/logo_conectwi_wide-removebg-preview.png';
    const fechaPago = _('fechaPagoRealizado').innerText;
    
    // Estilos optimizados para impresión térmica
    const estilos = `
        <style>
            @page { size: auto; margin: 0; }
            body { 
                width: 8cm !important;
                margin: 0 !important;
                padding: 0.2cm !important;
                font-family: Arial, sans-serif;
                font-size: 10px !important;
                -webkit-print-color-adjust: exact;
            }
            * { 
                max-width: 100% !important;
                box-sizing: border-box;
            }
            .logo-container {
                text-align: center;
                margin-bottom: 5px;
            }
            .logo {
                max-width: 60% !important;
                height: auto;
            }
            table {
                width: 100% !important;
                font-size: 9px !important;
                border-collapse: collapse;
                margin: 5px 0;
            }
            th, td {
                padding: 2px 3px !important;
                line-height: 1.2;
                border: 1px solid #ddd;
                text-align: center;
            }
            /* Ocultar primera y última columna */
            tr > :first-child
            {
                display: none;
            }
            /* Excepción para fila de total si es necesario */
            tr.fila-total > :last-child {
                display: table-cell !important;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            .header-text {
                text-align: center;
                margin: 3px 0;
            }
            .header-text h1 {
                font-size: 14px !important;
                margin: 2px 0;
                font-weight: bold;
            }
            .footer {
                font-size: 10px !important;
                text-align: center;
                margin-top: 5px;
                padding-top: 5px;
                border-top: 1px dashed #000;
            }
            .nombre-cliente {
                font-weight: bold;
                margin: 5px 0;
                text-align: center;
                font-size: 11px;
            }
        </style>
    `;

    // Clonar y modificar tabla
    const tablaOriginal = document.getElementById('reimprimirTabla');
    const tablaClonada = tablaOriginal.cloneNode(true);

    // Ocultar columnas en todas las filas
    Array.from(tablaClonada.querySelectorAll('tr')).forEach(tr => {
        if (tr.children.length > 0) {
            tr.children[0].style.display = 'none'; // Primera columna
            // if (tr.children.length > 1) {
            //     tr.lastElementChild.style.display = 'none'; // Última columna
            // }
        }
    });

    // Generar HTML del logo
    const logoHTML = rutaLogo 
        ? `<div class="logo-container"><img src="${rutaLogo}" class="logo" alt="Logo"></div>`
        : '';

    ventimp.document.open();
    ventimp.document.write(`
        <html>
            <head>
                <title>Ticket</title>
                ${estilos}
            </head>
            <body>
                ${logoHTML}
                <div class="header-text">
                    <h1 hidden>CONECTWi</h1>
                    <h2>RECIBO DE PAGO</h2>
                </div>
                
                ${nombre2 ? `<div class="nombre-cliente">${nombre2}</div>` : ''}
                ${tablaClonada.outerHTML}
                
                <div class="footer">
                    
                    <div>${fechaPago} | www.conectwi.com</div>
                    <div>** CONSERVE ESTE TICKET **</div>
                </div>
            </body>
        </html>
    `);
    ventimp.document.close();
    limpiarModal();
    limpiar1modal();
    $('#pago').modal('hide');

    ventimp.onload = function() {
        setTimeout(() => {
            ventimp.print();
            ventimp.close();
        }, 50);
    };
}

function reimpirimirPago(){
    let folioPago = _('folioPagoRealizado').innerText;
    let nombreTicket = _('nombrePagoRealizado').innerText;
    imprimirSeleccion2(folioPago, nombreTicket);
}