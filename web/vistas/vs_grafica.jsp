<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas de Motivos - DentalUp</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Contenedor de la gráfica mejorado */
        .chart-container {
            width: 100%;
            max-width: 420px;
            margin: 25px auto;
            padding: 28px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 18px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.8);
            transition: all 0.3s ease;
            animation: fadeInScale 0.6s ease-out 0.2s backwards;
        }

        .chart-container:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 32px rgba(100, 124, 245, 0.2);
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Canvas responsive */
        .chart-wrapper {
            position: relative;
            width: 100%;
            height: 320px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #graficaMotivos {
            max-width: 100%;
            max-height: 100%;
        }

        /* Indicador de carga */
        .loading-indicator {
            text-align: center;
            color: #647CF5;
            font-weight: 600;
            margin-top: 15px;
            font-size: 0.9em;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .loading-indicator.active {
            opacity: 1;
        }

        .loading-indicator::after {
            content: '';
            display: inline-block;
            width: 12px;
            height: 12px;
            margin-left: 8px;
            border: 2px solid #647CF5;
            border-top-color: transparent;
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Información adicional */
        .chart-info {
            text-align: center;
            margin-top: 18px;
            padding-top: 18px;
            border-top: 1px solid #e2e8f0;
            color: #718096;
            font-size: 0.85em;
            font-weight: 500;
        }

        .chart-info .update-time {
            display: inline-block;
            margin-top: 6px;
            color: #647CF5;
            font-weight: 600;
        }

        /* Ajuste del título */
        h2 {
            margin-bottom: 15px;
            padding-bottom: 15px;
        }

        /* Espaciado mejorado */
        .btn-container {
            margin-top: 25px;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .chart-container {
                padding: 20px;
            }

            .chart-wrapper {
                height: 280px;
            }
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
    
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        
        <h2>Estadísticas de Motivos</h2>
        
        <div class="chart-container">
            <div class="chart-wrapper">
                <canvas id="graficaMotivos"></canvas>
            </div>
            <div class="loading-indicator" id="loadingIndicator">
                Actualizando datos
            </div>
            <div class="chart-info">
                <div>Datos actualizados automáticamente cada 8 segundos</div>
                <div class="update-time" id="updateTime">Cargando...</div>
            </div>
        </div>

        <script>
        let chart;
        
        // Función para actualizar el tiempo de última actualización
        function actualizarTiempo() {
            const ahora = new Date();
            const horas = String(ahora.getHours()).padStart(2, '0');
            const minutos = String(ahora.getMinutes()).padStart(2, '0');
            const segundos = String(ahora.getSeconds()).padStart(2, '0');
            document.getElementById('updateTime').textContent = `Última actualización: ${horas}:${minutos}:${segundos}`;
        }
        
        // Función para cargar datos desde el servlet
        async function cargarDatos() {
            const loadingIndicator = document.getElementById('loadingIndicator');
            loadingIndicator.classList.add('active');
            
            try {
                const resp = await fetch("${pageContext.request.contextPath}/datosMotivo");
                const data = await resp.json();
                
                if (!chart) {
                    // Crear la gráfica por primera vez
                    const ctx = document.getElementById("graficaMotivos").getContext("2d");
                    chart = new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: data.labels,
                            datasets: [{
                                data: data.values,
                                backgroundColor: [
                                    'rgba(100, 230, 245, 0.8)',
                                    'rgba(240, 77, 100, 0.8)',
                                    'rgba(147, 197, 253, 0.8)',
                                    'rgba(191, 219, 254, 0.8)',
                                    'rgba(200, 150, 250, 0.8)',
                                    'rgba(167, 139, 250, 0.8)'
                                ],
                                borderColor: 'rgba(255, 255, 255, 1)',
                                borderWidth: 2
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            plugins: {
                                legend: {
                                    position: 'bottom',
                                    labels: {
                                        padding: 15,
                                        font: {
                                            size: 16,
                                            family: "'Segoe UI', 'DM Sans', Arial, sans-serif"
                                        }
                                    }
                                },
                                tooltip: {
                                    backgroundColor: 'rgba(45, 55, 72, 0.95)',
                                    padding: 12,
                                    cornerRadius: 8,
                                    titleFont: {
                                        size: 14,
                                        weight: '600'
                                    },
                                    bodyFont: {
                                        size: 13
                                    }
                                }
                            }
                        }
                    });
                } else {
                    // Actualizar gráfica existente
                    chart.data.labels = data.labels;
                    chart.data.datasets[0].data = data.values;
                    chart.update();
                }
                
                actualizarTiempo();
            } catch (error) {
                console.error('Error al cargar datos:', error);
            } finally {
                setTimeout(() => {
                    loadingIndicator.classList.remove('active');
                }, 300);
            }
        }
        
        // Carga inicial
        cargarDatos();
        
        // Actualizar cada 8 segundos
        setInterval(cargarDatos, 8000);
        </script>
        
        <div class="btn-container">
            <a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp" class="btn">Volver al menú</a>
        </div>
    </div>
</body>
</html>