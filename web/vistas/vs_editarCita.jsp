<%-- 
    Document   : vs_editarCita
    Created on : 24/11/2025, 12:33:45 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, modelo.mdCita" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Cita</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/listaCitasPaciente.css">
</head>
<body>
<div class="container">
    <h2>✏️ Editar Cita</h2>

    <%
        mdCita cita = (mdCita) request.getAttribute("cita");
        Map<Integer, String> odontologos = (Map<Integer, String>) request.getAttribute("odontologos");
        if (cita == null) {
    %>
        <p class="error">Cita no encontrada.</p>
    <% } else { 
        // intenta dividir fecha y hora si viene en "YYYY-MM-DD HH:MM"
        String fechaHora = cita.getFechaCita() != null ? cita.getFechaCita() : "";
        String fecha = "";
        String hora = "";
        if (fechaHora.contains(" ")) {
            String[] parts = fechaHora.split(" ");
            fecha = parts[0];
            hora = parts.length > 1 ? parts[1] : "";
        } else {
            // si solo tiene fecha o un string, se pone el valor completo en fecha
            fecha = fechaHora;
        }
    %>

    <form action="${pageContext.request.contextPath}/CitaServlet" method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id_cita" value="<%= cita.getIdCita() %>">

        <label for="odontologo">Odontólogo:</label><br>
        <select id="odontologo" name="cedula_odontologo" required>
            <% if (odontologos != null && !odontologos.isEmpty()) {
                   for (Map.Entry<Integer, String> e : odontologos.entrySet()) {
                       int oid = e.getKey();
                       String oname = e.getValue();
            %>
                <option value="<%= oid %>" <%= (oid == cita.getCedulaOdontologo()? "selected" : "") %>><%= oname %></option>
            <%     }
               } else { %>
                <option value="<%= cita.getCedulaOdontologo()%>">ID: <%= cita.getCedulaOdontologo()%></option>
            <% } %>
        </select>
        <br><br>

        <label for="fecha">Fecha:</label><br>
        <input type="date" id="fecha" name="fecha" value="<%= fecha %>" required>
        <br><br>

        <label for="hora">Hora:</label><br>
        <input type="time" id="hora" name="hora" value="<%= hora %>" required>
        <br><br>

        <label for="motivo">Motivo:</label><br>
        <textarea id="motivo" name="motivo" rows="3" required><%= cita.getMotivo() %></textarea>
        <br><br>

        <button type="submit" class="btn">Guardar cambios</button>
        <a href="${pageContext.request.contextPath}/CitaServlet?accion=listar" class="btn" style="background:#9e9e9e;">Cancelar</a>
    </form>

    <% } %>
</div>
</body>
</html>
