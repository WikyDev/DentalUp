<%-- 
    Document   : ct_regCitas
    Created on : May 16, 2025, 12:07:24 PM
    Author     : Jhoon
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            
            String nombre = request.getParameter("nombre");
            
            String fechaHora = request.getParameter("fechaHora");
            String odontologo = request.getParameter("odontologo");
            String afeccion = request.getParameter("afeccion");
    
            
            ArrayList datos = new ArrayList<String>();
           
            datos.add(nombre);
            datos.add(fechaHora);
            datos.add(odontologo);
            datos.add(afeccion);
            session.setAttribute("datos", datos);
            out.print("<script>location.href=\"../modelo/md_regCitas.jsp\";</script>");
        %>
    </body>
</html>
