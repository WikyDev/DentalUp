<%-- 
    Document   : vs_agendaOdontologo
    Created on : 24/06/2025, 1:48:01 p. m.
    Author     : Anthony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Agenda por Odontólogo</title>
</head>
<body>
    <h2>Consultar agenda de odontólogo</h2>
    <form method="get">
        <label>Seleccione odontólogo:</label>
        <select name="id_odontologo">
            <%
                conexion c = new conexion();
                ResultSet odontos = c.consultar("SELECT id_odontologo, nombre_completo FROM odontologos");
                while (odontos.next()) {
            %>
                <option value="<%=odontos.getInt("id_odontologo")%>">
                    <%=odontos.getString("nombre_completo")%>
                </option>
            <%
                }
            %>
        </select>
        <button type="submit">Ver agenda</button>
    </form>

    <%
        String idOd = request.getParameter("id_odontologo");
        if (idOd != null) {
            ResultSet rs = c.consultar(
                "SELECT ci.id_cita, p.nombre AS paciente, ci.fecha_cita AS fecha, ci.motivo AS motivo " +
                "FROM citas ci " +
                "JOIN pacientes p ON ci.id_paciente = p.id_paciente " +
                "WHERE ci.id_odontologo = " + idOd + " ORDER BY ci.fecha_cita, ci.motivo"
            );
    %>
    <h3>Agenda:</h3>
    <table border="1">
        <tr><th>ID</th><th>Paciente</th><th>Fecha</th><th>Motivo</th></tr>
        <%
            if (rs != null) {
                while (rs.next()) {
        %>
    <tr>
        <td><%= rs.getInt("id_cita") %></td>
        <td><%= rs.getString("paciente") %></td>
        <td><%= rs.getTimestamp("fecha") %></td>
        <td><%= rs.getString("motivo") %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="3" style="color:red;">Error al consultar la agenda del odontólogo.</td></tr>
    <% } %>
    
    </table>
    <%
            c.cerrar();
        }
    %>
    <div>
        <br>
        <a href="<%=request.getContextPath()%>/vista/vs_menuOdonto.jsp">Volver al menú</a>
    </div>
</body>
</html>
