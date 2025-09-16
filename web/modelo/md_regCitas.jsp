<%-- 
    Document   : md_regCitas
    Created on : May 16, 2025, 12:52:02 PM
    Author     : Jhoon
--%>

<%@page import="util.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registro citas</title>
    </head>
    <body>
 
        <%
            ArrayList datos = (ArrayList)session.getAttribute("datos");
            // for (Object elem : datos) out.print(elem + "<br>");
            
            Conexion c = new Conexion();
            if(c.insertar("cita", datos)){
                out.print("Se almaceno el registro.<br><br>");
                out.print("<a href=\"../vista/vs_inicio.jsp\">Volver al inicio</a>");
            }else out.print(c.getMensaje());
        %>
    </body>
</html>
