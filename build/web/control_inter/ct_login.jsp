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
    String rol = controlador.validarAcceso(usuario, password);
    //valida si existe el rol en la base de datos
    if (rol != null) {
    //toma el nombre_user y rol de la base de datos y dependiendo del tipo de usuario que sea lo redirige a su menu respectivo
        session.setAttribute("usuario", usuario);
        session.setAttribute("rol", rol);
        
        switch (rol.toLowerCase()) {
            case "admin":
                response.sendRedirect("../vistas/vs_menuAdmin.jsp");
                break;
            case "secretario":
                response.sendRedirect("../vistas/vs_menuSecre.jsp");
                break;
            case "odontologo":
                response.sendRedirect("../vistas/vs_menuOdonto.jsp");
                break;
            default:
                response.sendRedirect("../vistas/vs_login.jsp?error=rol");
                break;
        }
    } else {
        response.sendRedirect("../vistas/vs_login.jsp?error=true");
    }
%>
