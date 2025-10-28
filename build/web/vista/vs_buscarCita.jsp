<%-- 
    Document   : vs_buscarCita
    Created on : 24/06/2025, 1:48:48 p. m.
    Author     : Anthony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Cita</title>
</head>
<body>
    <h2>Buscar cita por ID</h2>

    <form method="get">
        <input type="number" name="id_cita" required placeholder="ID de cita">
        <button type="submit">Buscar</button>
    </form>

    <%
        String idParam = request.getParameter("id_cita");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int idCita = Integer.parseInt(idParam);
                conexion c = new conexion();
                ResultSet rs = c.consultarPorID(
                    "SELECT ci.id_cita, p.nombre AS paciente, o.nombre_completo AS odontologo, ci.fecha_cita AS fecha, ci.motivo AS motivo " +
                    "FROM citas ci " +
                    "JOIN pacientes p ON ci.id_paciente = p.id_paciente " +
                    "JOIN odontologos o ON ci.id_odontologo = o.id_odontologo " +
                    "WHERE ci.id_cita = ?", idCita
                );

                if (rs.next()) {
    %>
        <h3>Resultado:</h3>
        <p><b>Paciente:</b> <%= rs.getString("paciente") %></p>
        <p><b>Odontólogo:</b> <%= rs.getString("odontologo") %></p>
        <p><b>Fecha:</b> <%= rs.getTimestamp("fecha") %></p>
        <p><b>Motivo:</b> <%= rs.getString("motivo") %></p>
    <%
                } else {
    %>
        <p style="color:red;">No se encontró una cita con ese ID.</p>
    <%
                }
                c.cerrar();
            } catch (Exception e) {
    %>
        <p style="color:red;">Error: <%= e.getMessage() %></p>
    <%
            }
        }
    %>
    
    <div>
        <br>
        <a href="<%=request.getContextPath()%>/vista/vs_menuSecre.jsp">Volver al menú</a>
    </div>
</body>
</html>
