<%-- 
    Document   : vs_menuAdmin.jsp
    Created on : 20/05/2025, 3:54:26 p. m.
    Author     : Anthony 
    Modified   : Daniel Martinez 
--%>
<%@ page contentType="text/html; charset=UTF-8" session="true" %>
<%
    // 1) Compruebo que exista sesión
    String rol = (String) session.getAttribute("rol");
    if (rol == null) {
        // No está logueado
        response.sendRedirect(request.getContextPath() + "/vista/vs_login.jsp");
        return;
    }
    // 2) Compruebo que sea administrador
    if (!"admin".equals(rol)) {
        response.sendError(HttpServletResponse.SC_FORBIDDEN, 
            "Acceso denegado: solo administradores");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Administrador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h2>Menú Administrador</h2>
    <div class="menu menu-admin">
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=resumenSemanal">Ver resumen semanal</a><br>
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=verCitasDadas">Citas dadas</a><br>
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=verPacientesAlta">Pacientes dados de alta</a><br>
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=verPendientes">Pacientes pendientes</a><br>
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=registrarOdontologo">Registrar odontólogos</a><br>
        <a href="<%=request.getContextPath()%>/control/ct_admin.jsp?op=registrarSecretario">Registrar secretarios</a>
    </div>
    <p style="margin-top:20px;">
      <a href="<%=request.getContextPath()%>/vista/vs_login.jsp">Cerrar sesión</a>
    </p>
</body>
</html>