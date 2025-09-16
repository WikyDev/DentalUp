<%-- 
    Document   : md_regPac
    Created on : 10/05/2025, 11:43:35 p. m.
    Author     : Anthony
--%>

<%@page import="util.Conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica Odontológica</title>
    </head>
    <body>
        <h1>Registro Paciente</h1>
        <%
            ArrayList datos = (ArrayList)session.getAttribute("datos");
            // for (Object elem : datos) out.print(elem + "<br>");
            
            Conexion c = new Conexion();
            if(c.insertar("pacientes", datos)){
                out.print("Se almaceno el registro.<br><br>");
                out.print("<a href=\"../vista/vs_tipoReg.jsp\">Volver al menu</a>");
            }else out.print(c.getMensaje());
        %>
    </body>
</html>
