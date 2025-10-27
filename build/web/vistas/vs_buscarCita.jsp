<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Cita</title>
    <meta charset="UTF-8">
</head>
<body>
    <h2>Buscar cita por ID</h2>

    <!-- ? El formulario envía al Servlet con op=buscarCita -->
    <form action="${pageContext.request.contextPath}/ctSecre" method="get">
        <input type="hidden" name="op" value="buscarCita">
        <input type="number" name="id_cita" required placeholder="ID de cita">
        <button type="submit">Buscar</button>
    </form>

    <%
        // ? Recuperar resultado enviado desde el servlet
        ArrayList<String> resultado = (ArrayList<String>) request.getAttribute("resultadoBuscar");
        if (resultado != null && !resultado.isEmpty()) {
    %>
        <h3>Resultado:</h3>
        <p><b>ID Cita:</b> <%= resultado.get(0) %></p>
        <p><b>Paciente:</b> <%= resultado.get(1) %></p>
        <p><b>Odontólogo:</b> <%= resultado.get(2) %></p>
        <p><b>Fecha:</b> <%= resultado.get(3) %></p>
        <p><b>Motivo:</b> <%= resultado.get(4) %></p>
    <%
        } else if (request.getAttribute("noEncontrado") != null) {
    %>
        <p style="color:red;">No se encontró una cita con ese ID.</p>
    <%
        } else if (request.getAttribute("error") != null) {
    %>
        <p style="color:red;">Error: <%= request.getAttribute("error") %></p>
    <%
        }
    %>

    <div>
        <br>
        <a href="${pageContext.request.contextPath}/vistas/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
