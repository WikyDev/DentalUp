<%-- 
    Document   : registrarHistoria
    Created on : 14/11/2025, 10:46:12 a. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%
    // Parámetros enviados desde HistoriaServlet
    String idCita = (String) request.getParameter("id_cita");
    String idPaciente = request.getParameter("id_paciente");
    String idOdontologo = request.getParameter("id_odontologo");
    String fecha = request.getParameter("fecha");
    String motivoConsulta = request.getParameter("motivo");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Historia Clínica</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h2>Registrar Historia Clínica</h2>

<!-- Mostrar mensajes si existen -->
<% if (request.getAttribute("mensaje") != null) { %>
    <p style="color:green;"><%= request.getAttribute("mensaje") %></p>
<% } %>
<% if (request.getAttribute("error") != null) { %>
    <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<form action="${pageContext.request.contextPath}/HistoriaServlet" method="post">
    <!-- Hidden inputs para enviar IDs -->
    <input type="hidden" name="accion" value="registrar">
    <input type="hidden" name="id_cita" value="<%= idCita %>">
    <input type="hidden" name="id_paciente" value="<%= idPaciente %>">
    <input type="hidden" name="id_odontologo" value="<%= idOdontologo %>">
    <input type="hidden" name="fecha" value="<%= fecha %>">
    <input type="hidden" name="motivoConsulta" value="<%= motivoConsulta %>">

   
    <p>
        <label>Fecha de la cita:</label>
        <input type="text" value="<%= fecha %>" disabled>
    </p>
    <p>
        <label>Motivo de la consulta:</label>
        <input type="text" value="<%= motivoConsulta %>" disabled>
    </p>

    <p>
        <label>Diagnóstico:</label><br>
        <textarea name="diagnostico" rows="4" cols="50" required></textarea>
    </p>

    <p>
        <label>Tratamiento:</label><br>
        <textarea name="tratamiento" rows="4" cols="50" required></textarea>
    </p>

    <p>
        <label>Observaciones:</label><br>
        <textarea name="observaciones" rows="3" cols="50"></textarea>
    </p>

    <p>
        <button type="submit">Registrar Historia Clínica</button>
        <a href="${pageContext.request.contextPath}/vistas/vs_citasOdontologo.jsp">Cancelar</a>
    </p>
</form>

</body>
</html>

