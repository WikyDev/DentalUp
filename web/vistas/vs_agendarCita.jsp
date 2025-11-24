<%-- 
    Document   : vs_menuPaciente
    Created on : 29/10/2025, 7:26:27 p. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.mdOdontologo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agendar Cita</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/agendar.css">
</head>
<body>

<div class="container">
    <h2>Agendar Nueva Cita</h2>

    <!-- Mensaje del controlador -->
    <%
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null) {
    %>
        <p class="<%= mensaje.contains("Error") ? "error" : "mensaje" %>"><%= mensaje %></p>
    <% } %>

    <form action="${pageContext.request.contextPath}/CitaServlet" method="post">
        <input type="hidden" name="accion" value="registrar">

        <!-- Toma el id del paciente logueado y lo pone en el campo automaticamente-->
        <label>ID del Paciente:</label>
        <input type="text" name="id_paciente" value="<%= session.getAttribute("id_paciente") != null ? session.getAttribute("id_paciente") : "" %>" readonly>

        <label>Seleccione un odontólogo:</label>
        <select name="id_odontologo" required>
            <option value="">-- Seleccione --</option>
            <%
                List<mdOdontologo> listaO = (List<mdOdontologo>) request.getAttribute("listaOdontologos");
                if (listaO != null) {
                    for (mdOdontologo o : listaO) {
            %>
            <option value="<%= o.getIdOdonto()%>"><%= o.getNombreCompleto()%></option>
            <%
                    }
                }
            %>
        </select>

        <label>Fecha y hora de la cita:</label>
        <input type="datetime-local" name="fecha_cita" required>

        <label>Motivo de la cita:</label>
        <textarea name="motivo" placeholder="Describa brevemente el motivo de su consulta" required></textarea>
        
        <!-- Boton para volver al menu -->
        <button type="submit" class="btn">Agendar</button>
        <a href="${pageContext.request.contextPath}/vistas/vs_menuPaciente.jsp" class="btn" style="background-color:#9e9e9e;">Volver al Menú</a>
    </form>
</div>

</body>
</html>

