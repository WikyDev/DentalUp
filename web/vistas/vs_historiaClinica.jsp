<%-- 
    Document   : vs_historiaClinica
    Created on : 14/11/2025, 10:50:22 a. m.
    Author     : Anthony
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdHistoriaClinica" %>

<%
    ArrayList<mdHistoriaClinica> listaHistorias = 
        (ArrayList<mdHistoriaClinica>) request.getAttribute("listaHistorias");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mis Historias Clínicas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>

<h2>Mis Historias Clínicas</h2>

<!-- Mensajes -->
<% if (request.getAttribute("mensaje") != null) { %>
    <p style="color: green;"><%= request.getAttribute("mensaje") %></p>
<% } %>
<% if (request.getAttribute("error") != null) { %>
    <p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

<!-- Verificar si hay historias -->
<% if (listaHistorias == null || listaHistorias.isEmpty()) { %>

    <p>No se encontraron historias clínicas registradas.</p>

<% } else { %>

    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Fecha de Registro</th>
                <th>Diagnóstico</th>
                <th>Tratamiento</th>
                <th>Observaciones</th>
                <th>Odontólogo</th>
            </tr>
        </thead>
        
        <tbody>
            <% for (mdHistoriaClinica h : listaHistorias) {%>
            <tr>
                <td><%= h.getIdHistoria()%></td>
                <td><%= h.getFecha()%></td>
                <td><%= h.getDiagnostico()%></td>
                <td><%= h.getTratamiento()%></td>
                <td><%= h.getObservaciones()%></td>
                <td><%= h.getNombreOdontologo()%></td>
            </tr>
            <% } %>
        </tbody>
    </table>

<% } %>

<br>
<a href="${pageContext.request.contextPath}/vistas/vs_menuPaciente.jsp">⬅ Volver al menú</a>

</body>
</html>


