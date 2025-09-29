<%-- 
    Document   : vs_menuOdonto.jsp
    Created on : (fecha)
    Author     : Anthony 
    Modified   : Daniel Martinez
--%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
         import="javax.servlet.http.HttpServletResponse" %>
<%
    // 1) Compruebo sesión
    String rol = (String) session.getAttribute("rol");
    if (rol == null) {
        response.sendRedirect(request.getContextPath() + "/vista/vs_login.jsp");
        return;
    }
    // 2) Compruebo rol
    if (!"odontologo".equals(rol)) {
        response.sendError(HttpServletResponse.SC_FORBIDDEN,
                          "Acceso denegado: solo odontólogos.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h2>Menú Odontólogo</h2>
    <div class="menu menu-odontologo">
        <a href="<%=request.getContextPath()%>/control/ct_odonto.jsp?op=listarOdonto">📋 Ver todas las citas</a><br>
        
        <a href="<%=request.getContextPath()%>/vista/vs_agendaOdontologo.jsp">📅 Agenda por odontólogo</a><br>
        
        <a href="<%=request.getContextPath()%>/control/ct_grafica.jsp">📊 Gráfica por Motivo</a><br>
        
        <a href="<%=request.getContextPath()%>/vista/vs_login.jsp">🚪 Cerrar sesión</a>
    </div>
</body>
</html>
