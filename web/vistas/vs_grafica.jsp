<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

// ? Actualizar cada 5 segundos
setInterval(cargarDatos, 8000);
</script>
