<%@ page import="java.util.*" %>
<%
    Map<String, Map<String, Integer>> datos = (Map<String, Map<String, Integer>>) session.getAttribute("datosGrafica");
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
    <%
        int graficoId = 0;
        for (Map.Entry<String, Map<String, Integer>> entry : datos.entrySet()) {
            String odontologo = entry.getKey();
            Map<String, Integer> motivos = entry.getValue();
            String chartId = "grafico" + graficoId;
    %>
        <div class="grafica">
            <h4>Odontólogo: <%= odontologo %></h4>
            <canvas id="<%= chartId %>"></canvas>
        </div>

        <script>
    const ctx<%= graficoId %> = document.getElementById('<%= chartId %>').getContext('2d');
    new Chart(ctx<%= graficoId %>, {
        type: 'doughnut',
        data: {
            labels: [<%
                int i = 0;
                for (String motivo : motivos.keySet()) {
                    out.print("'" + motivo + "'");
                    if (++i < motivos.size()) out.print(", ");
                }
            %>],
            datasets: [{
                data: [<%
                    int j = 0;
                    for (Integer cantidad : motivos.values()) {
                        out.print(cantidad);
                        if (++j < motivos.size()) out.print(", ");
                    }
                %>],
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

    <%
        graficoId++;
        }
    %>
    </div>
    
    <div>
        <br>
        <a href="<%=request.getContextPath()%>/vista/vs_menuOdonto.jsp">Volver al menú</a>
    </div>
</body>
</html>
