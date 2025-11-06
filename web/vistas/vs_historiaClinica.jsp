<%-- 
    Document   : vs_historiaClinica
    Created on : 5 nov 2025, 21:48:36
    Author     : Usuario
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.mdHistoriaClinica, java.util.ArrayList" %>
<%
    ArrayList<mdHistoriaClinica> listaHistoria = 
        (ArrayList<mdHistoriaClinica>) request.getAttribute("listaHistoria");
    String mensaje = (String) request.getAttribute("mensaje");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historia Clínica</title>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/listaCitasPaciente.css">
</head>
<body>
    <h2> Historia Clínica del Paciente</h2>

    <% if (mensaje != null) { %>
        <p><strong><%= mensaje %></strong></p>
    <% } %>

    <% if (listaHistoria == null || listaHistoria.isEmpty()) { %>
        <p>No hay registros en la historia clínica.</p>
    <% } else { %>
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>ID Historia</th>
                    <th>Diagnóstico</th>
                    <th>Tratamiento</th>
                    <th>Fecha de Registro</th>
                </tr>
            </thead>
            <tbody>
                <% for (mdHistoriaClinica h : listaHistoria) { %>
                    <tr>
                        <td><%= h.getId_historia() %></td>
                        <td><%= h.getDiagnostico() %></td>
                        <td><%= h.getTratamiento() %></td>
                        <td><%= h.getFecha_registro() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

    <br>
    <a href="vs_menuPaciente.jsp">⬅ Volver al menú</a>
</body>
</html>

