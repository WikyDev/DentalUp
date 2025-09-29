<%-- 
    Document   : ct_secre
    Created on : 24/06/2025, 1:24:59 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String opcion = request.getParameter("op");
    String destino = "";
    
    if (opcion == null) {
        out.println("⚠️ Parámetro 'op' no proporcionado en la URL.");
        return;
    }

    switch (opcion) {

        case "listarCitas":
            // Consulta general de todas las citas
            destino = "../vista/vs_listarCitas.jsp";
            break;

        case "buscarCitaPorID":
            // Vista para buscar cita por clave primaria
            destino = "../vista/vs_buscarCita.jsp";
            break;

        case "generarReporteCitas":
            // Generar PDF de resumen o estadística de citas
            destino = "../vista/vs_reporteAgenda.jsp";
            break;

        default:
            destino = "../vista/vs_menuSecre.jsp";
            break;
    }
%>

<jsp:forward page="<%= destino %>" />
