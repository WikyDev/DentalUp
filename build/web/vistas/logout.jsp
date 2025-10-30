<%-- 
    Document   : logout
    Created on : 23/10/2025, 12:06:15 a. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //clase que redirige al login(cerrar sesion) desde cualquier menu 
    session.invalidate();
    response.sendRedirect("vs_login.jsp"); 
%>
