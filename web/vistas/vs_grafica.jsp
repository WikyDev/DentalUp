
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
</head>

<div id="img-fondo"></div>
      <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        <div style="width:400px;margin:auto;">
            <canvas id="graficaMotivos"></canvas>
        </div>

<script>
let chart;

// Función para cargar datos desde el servlet
async function cargarDatos() {
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
                    data: data.values
                }]
            },
            options: {
                responsive: false,
                maintainAspectRatio: false
            }
        });

    } else {
        // Actualizar gráfica existente
        chart.data.labels = data.labels;
        chart.data.datasets[0].data = data.values;
        chart.update();
    }
}

// Carga inicial
cargarDatos();

// ? Actualizar cada 8 segundos
setInterval(cargarDatos, 8000);


</script>
<div>
        <br>
        <a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp">Volver al menú</a>
    </div>