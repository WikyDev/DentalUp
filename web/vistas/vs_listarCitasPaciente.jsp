<%-- 
    Document   : vs_listarCitasPaciente
    Created on : 29/10/2025, 10:01:40 p. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdCita" %>
<!DOCTYPE html>
<!-- Vista que muestra el listado de las citas para el paciente que se encuentre logueado -->
<html>
<head>
    <title>Mis Citas</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/listaCitasPaciente.css">
</head>
<body>

<div class="container">
    <h2>🗓 Mis Citas Agendadas</h2>

    <!-- Mostrar mensajes de estado -->
    <%
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null) {
    %>
        <p class="<%= mensaje.contains("Error") ? "error" : "mensaje" %>"><%= mensaje %></p>
    <% } %>

    <!-- Tabla de citas -->
    <%
        List<mdCita> lista = (List<mdCita>) request.getAttribute("listaCitas");
        if (lista != null && !lista.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID Cita</th>
                <th>Odontólogo</th>
                <th>Fecha y Hora</th>
                <th>Motivo</th>
            </tr>
            <% for (mdCita c : lista) { %>
                <tr>
                    <td><%= c.getIdCita()%></td>
                    <td><%= c.getIdOdontologo()%></td>
                    <td><%= c.getFechaCita()%></td>
                    <td><%= c.getMotivo() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p class="error">No tienes citas agendadas actualmente.</p>
    <% } %>

    <div style="text-align:center; margin-top:20px;">
        <!-- Actualiza la lista, la llama nuevamente -->
        <a href="${pageContext.request.contextPath}/CitaServlet?accion=listar" class="btn">Actualizar</a>
        <!-- Boton para volver al menu-->
        <a href="${pageContext.request.contextPath}/vistas/vs_menuPaciente.jsp" class="btn" style="background-color:#9e9e9e;">Volver al Menú</a>
    </div>
</div>

</body>
</html>

