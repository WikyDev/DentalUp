<%-- 
    Document   : ct_registro
    Created on : 9/05/2025, 9:33:00 p. m.
    Author     : Anthony
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica Odontológica</title>
    </head>
    <body>
        <%
            String id_paciente = request.getParameter("id_paciente");
            String apellido = request.getParameter("apellido");
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String fecha_nac = request.getParameter("fecha_nac");
            String tiene_os = request.getParameter("tiene_os");
            String tipo_sangre = request.getParameter("tipo_sangre");
            //out.print(id + "/" + apellido + "/" + nombre + "/" + genero + "/" + estrato + "/" + estado + "<br>");
            
            ArrayList datos = new ArrayList<String>();
            datos.add(id_paciente);
            datos.add(apellido);
            datos.add(nombre);
            datos.add(telefono);
            datos.add(fecha_nac);
            datos.add(tiene_os);
            datos.add(tipo_sangre);
            session.setAttribute("datos", datos);
            out.print("<script>location.href=\"../modelo/md_regPac.jsp\";</script>");
        %>
    </body>
</html>
