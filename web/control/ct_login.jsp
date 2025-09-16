<%-- 
    Document   : ct_login
    Created on : May 16, 2025, 2:48:54 PM
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
            
            String nombre = request.getParameter("usuario");
            String password = request.getParameter("contrasena");
            String rol = request.getParameter("rol");
            
    
            
            ArrayList datos = new ArrayList<String>();
           
            datos.add(nombre);
            datos.add(password);
            datos.add(rol);
          
            session.setAttribute("datos", datos);
            out.print("<script>location.href=\"../modelo/md_login.jsp\";</script>");
        %>
    </body>
</html>