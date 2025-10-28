<%-- 
    Document   : vs_menuSecre.jsp
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
    if (!"secretario".equals(rol)) {
        response.sendError(HttpServletResponse.SC_FORBIDDEN,
                          "Acceso denegado: solo secretarios.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Secretario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h2>Menú del Secretario</h2>
    <div class="menu menu-secre">
        <a href="<%=request.getContextPath()%>/control/ct_secre.jsp?op=listarCitas">📋 Ver todas las citas</a><br>

        <a href="<%=request.getContextPath()%>/vista/vs_buscarCita.jsp">🔍 Buscar cita por ID</a><br>

        <a href="<%=request.getContextPath()%>/control/ct_secre.jsp?op=generarReporteCitas">📄 Generar reporte PDF</a><br>

        <a href="<%=request.getContextPath()%>/vista/vs_login.jsp">🚪 Cerrar sesión</a>
    </div>
</body>
</html>
