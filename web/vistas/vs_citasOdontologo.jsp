<%-- 
    Document   : vs_citasOdontologo
    Created on : 14/11/2025, 11:07:40 a. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdCita" %>

<%
    List<mdCita> lista = (List<mdCita>) request.getAttribute("listaCitas");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Citas del Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<h2>Mis Citas</h2>
<!-- mensaje de exito cuando una historia clinica haya sido registrada -->
<% if ("ok".equals(request.getParameter("msg"))) { %>
    <p style="color:green;">✔ Historia clínica registrada y cita marcada como atendida.</p>
<% } %>

<% if (lista == null || lista.isEmpty()) { %>
    <p>No hay citas registradas.</p>
<% } else { %>
<table border="1">
    <thead>
        <tr>
            <th>Fecha y Hora</th>
            <th>Paciente</th>
            <th>Motivo</th>
            <th>Estado</th>
            <th>Acción</th>
        </tr>
    </thead>
    <tbody>
    <% for (mdCita c : lista) { %>
        <tr>
            <td><%= c.getFechaCita() %></td>
            <td><%= c.getNombrePaciente() %></td> 
            <td><%= c.getMotivo() %></td>
            <td>
                <% if (mdCita.ESTADO_ATENDIDA.equalsIgnoreCase(c.getEstado())){ %>
                    Atendida
                <% }else{ %>
                    Pendiente
                <%  } %>
            </td>
            <td>
                <% if (mdCita.ESTADO_PENDIENTE.equalsIgnoreCase(c.getEstado())) { %>
                <a href="${pageContext.request.contextPath}/HistoriaServlet?accion=cargarDesdeCita&id_cita=<%= c.getIdCita() %>&cedula_paciente=<%= c.getCedulaPaciente()%>&cedula_odontologo=<%= c.getCedulaOdontologo()%>&fecha=<%= java.net.URLEncoder.encode(c.getFechaCita(), "UTF-8")%>&motivo=<%= java.net.URLEncoder.encode(c.getMotivo(), "UTF-8")%>"
                   class="btn">
                    Registrar Historia
                </a>

                <% } else { %>
                <span style="color:green; font-weight:bold; ">Finalizada</span>
                <% } %>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>
<% } %>

<br>
<a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp">Volver al Menú</a>
</body>
</html>

