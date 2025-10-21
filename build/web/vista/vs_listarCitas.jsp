<%-- 
    Document   : vs_listarCitas
    Created on : 24/06/2025, 1:48:27 p. m.
    Author     : Wilson
--%>

<%@page import="java.sql.ResultSet" %>
<%@page import="util.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Citas Agendadas</title>
</head>
<body>
    <h2>Listado de todas las citas</h2>
    <table border="1">
        <tr>
            <th>ID Cita</th>
            <th>Paciente</th>
            <th>Odontólogo</th>
            <th>Fecha</th>
            <th>Motivo</th>
        </tr>
        <%
            conexion c = new conexion();
            ResultSet rs = c.consultar(
                "SELECT ci.id_cita, p.nombre AS paciente, o.nombre_completo AS odontologo, ci.fecha_cita AS fecha, ci.motivo AS motivo " + 
                "FROM citas ci " +
                "JOIN pacientes p ON ci.id_paciente = p.id_paciente " +
                "JOIN odontologos o ON ci.id_odontologo = o.id_odontologo"
            );

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id_cita") %></td>
            <td><%= rs.getString("paciente") %></td>
            <td><%= rs.getString("odontologo") %></td>
            <td><%= rs.getTimestamp("fecha") %></td>
            <td><%= rs.getString("motivo") %></td>
        </tr>
        <% } c.cerrar();%>
    </table>
    
    <div>
        <br>
        <a href="<%=request.getContextPath()%>/vista/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
