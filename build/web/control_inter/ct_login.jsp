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

    if (rol != null) {
        session.setAttribute("usuario", usuario);
        session.setAttribute("rol", rol);

        // Redirección al respectivo menú según el rol
        switch (rol) {
            case "admin":
                response.sendRedirect("../vistas/vs_menuAdmin.jsp");
                break;

            case "secretario":
                response.sendRedirect("../vistas/vs_menuSecre.jsp");
                break;

            case "odontologo":
                response.sendRedirect("../vistas/vs_menuOdonto.jsp");
                break;

            case "paciente":
                int idPaciente = controlador.obtenerIdPaciente(usuario);
                session.setAttribute("id_paciente", idPaciente);
                response.sendRedirect("../vistas/vs_menuPaciente.jsp");
                break;

            default:
                response.sendRedirect("../vistas/vs_login.jsp?error=rol");
                break;
        }

    } else {
        //En caso de ser una credencial incorrecta muestra mensaje de error
        response.sendRedirect("../vistas/vs_login.jsp?error=true");
    }
%>