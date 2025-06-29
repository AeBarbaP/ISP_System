function conteoGeneral() {
    $.ajax({
        type: "POST",
        url: "query/query_meses_annio.php",
        dataType: "json",
        cache: false,
        success: function(response) {
            var jsonData = JSON.parse(JSON.stringify(response));
            console.log('Respuesta JSON:', jsonData);
            var filas = 0;
            var filasExp = 0;
            var filasTar = 0;
            var filasAct = 0;

            if (Array.isArray(jsonData)) {
                console.log('Número de elementos en el array:', jsonData.length);
                var datosTabla = Array(12).fill(0).map(() => ({ credencial: 0, tarjeton: 0, expediente: 0 }));

                // Iterar sobre cada elemento en el array
                for (var i = 0; i < jsonData.length; i++) {
                    var datosGenerales = jsonData[i];
                    var mes = datosGenerales.mes - 1; // Convertir el mes a un índice de 0 a 11
                    var credencial = datosGenerales.credencial;
                    var tarjeton = datosGenerales.tarjeton;
                    var expediente = datosGenerales.expediente;

                    console.log('mes:', mes);
                    console.log('credencial:', credencial);
                    console.log('tarjeton:', tarjeton);
                    console.log('expediente:', expediente);

                    // Agregar los datos al arreglo multidimensional
                    datosTabla[mes] = { credencial, tarjeton, expediente };
                }

                console.log('datosTabla:', datosTabla);

                // Crear un arreglo para los datos del gráfico
                var credencialData = datosTabla.map(d => d.credencial);
                var tarjetonData = datosTabla.map(d => d.tarjeton);
                var expedienteData = datosTabla.map(d => d.expediente);

                // Crear el gráfico
                const ctx = document.getElementById('myChart').getContext('2d');
                let delayed;
                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [
                            'Ene', 'Feb', 'Mzo', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
                        ],
                        datasets: [
                            {
                                label: 'Credencial',
                                data: credencialData,
                                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                borderColor: 'rgba(255, 99, 132, 1)',
                                borderWidth: 1,
                                pointBackgroundColor: 'rgba(255, 99, 132, 1)',
                                borderRadius: 40,
                                borderSkipped: false,
                                responsive: true,
                                maintainAspectRatio: false,
                            },
                            {
                                label: 'Tarjeton',
                                data: tarjetonData,
                                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1,
                                pointBackgroundColor: 'rgba(54, 162, 235, 1)',
                                borderRadius: 40,
                                borderSkipped: false,
                                responsive: true,
                                maintainAspectRatio: false,
                            },
                            {
                                label: 'Expediente',
                                data: expedienteData,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1,
                                pointBackgroundColor: 'rgba(75, 192, 192, 1)',
                                borderRadius: 40,
                                borderSkipped: false,
                                responsive: true,
                                maintainAspectRatio: false,
                            }
                        ],
                    },
                    options: {
                        plugins: {
                            legend: {
                                display: true,
                            },
                            tooltip: {
                                boxPadding: 3,
                            },
                        },
                        animation: {
                            onComplete: () => {
                                delayed = true;
                            },
                            delay: (context) => {
                                let delay = 0;
                                if (context.type === 'data' && context.mode === 'default' && !delayed) {
                                    delay = context.dataIndex * 300 + context.datasetIndex * 100;
                                }
                                return delay;
                                },
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                            },
                        },
                    },
                });
            }
        },
        error: function(error) {
            console.error('Error en la petición AJAX:', error);
        }
    });
}


$(document).ready(function() {
    $.ajax({
        url: 'query/query_pagos_mes.php', // Ruta a tu archivo PHP
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            // Procesar datos para la gráfica
            const ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar', // Tipo de gráfica (puede ser 'line', 'pie', etc.)
                data: {
                    labels: data.map(item => item.fecha),
                    datasets: [{
                        label: 'Pagos por día',
                        data: data.map(item => item.total_pagos),
                        backgroundColor:'rgba(78, 160, 242, 1)',
                        //borderColor: 'rgb(17, 68, 68)',
                        borderWidth: 1,
                        borderRadius: 10
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
            beginAtZero: true,
            title: { display: true, text: 'Número de pagos' },
            ticks: {
                // Fuerza números enteros (sin decimales)
                precision: 0, // Opción 1 (Chart.js 3+)
                // stepSize: 1,  // Opción 2 (para versiones anteriores)
                callback: function(value) {
                    if (Number.isInteger(value)) {
                        return value; // Solo muestra enteros
                    }
                }
            }
        },
                        x: {
                            title: { display: true, text: 'Fecha' }
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error("Error al cargar los datos:", error);
        }
    });
});
