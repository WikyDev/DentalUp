<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String opcion = request.getParameter("op");
    String destino = "";
    
    if (opcion == null) {
        out.println("⚠️ Parámetro 'op' no proporcionado en la URL.");
        return;
    }

    switch (opcion) {

        case "listarOdonto":
            // Consulta general de todas las citas
            destino = "../vista/vs_listarOdonto.jsp";
            break;

        case "verAgendaOdontologo":
            // Muestra la agenda filtrada por odontólogo
            destino = "../vista/vs_agendaOdontologo.jsp";
            break;
            
        default:
            destino = "../vista/vs_menuOdonto.jsp";
            break;
    }
%>

<jsp:forward page="<%= destino %>" />
