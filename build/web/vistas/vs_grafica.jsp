<%@ page import="controlador.ControladorGrafica, java.util.Map" %>
<%
    ControladorGrafica ctrl = new ControladorGrafica();
    Map<String,Integer> datos = ctrl.conteoCitasPorMes();
    request.setAttribute("datosGrafica", datos);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Motivos por Odontólogo</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .contenedor-graficas {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 100px;
            padding: 20px;
        }

        .grafica {
            width: 250px;
            text-align: center;
        }

        canvas {
            width: 300px !important;
            height: 300px !important;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">GRÁFICA POR MOTIVO DE PACIENTE</h2>

    <div class="contenedor-graficas">
    
        <div class="grafica">
            <h4>Odontólogo: </h4>
            <canvas id=""></canvas>
        </div>

        <script>
    const ctx = document.getElementById('').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: [
                    'rgba(48,140,236)',     // azul
                    'rgba(244,116,20)',     // naranja
                    'rgba(54,162,235,0.6)', // azul claro
                    'rgba(255,159,64,0.6)', // naranja claro
                    'rgba(54,162,235,0.6)',
                    'rgba(255,159,64,0.6)'
                ]
            }]
        },
        options: {
            responsive: false,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                },
                title: {
                    display: false
                }
            }
        }
    });
</script>

    
    </div>
    
    <div>
        <br>
        <a href="/vista/vs_menuOdonto.jsp">Volver al menú</a>
    </div>
</body>
</html>
