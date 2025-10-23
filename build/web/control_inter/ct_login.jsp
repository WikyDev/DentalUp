<%-- 
    Document   : ct_login
    Created on : 21/10/2025, 7:38:44 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ctLogin"%>
<%
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");

    ctLogin controlador = new ctLogin();
    boolean acceso = controlador.validarAcceso(usuario, password);

    if (acceso) {
        session.setAttribute("usuario", usuario);
        response.sendRedirect("../vistas/vs_menu.jsp");
    } else {
        response.sendRedirect("../vistas/login.jsp?error=true");
    }
%>
