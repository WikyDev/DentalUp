<%-- 
    Document   : vs_menuAdmin
    Created on : 20/05/2025, 3:54:26 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menú Administrador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h2>Menú Administrador</h2>
    <div class="menu menu-admin">
        <a href="ct_admin?op=resumenSemanal">Ver resumen semanal</a>
        <a href="ct_admin?op=verCitasDadas">Citas dadas</a>
        <a href="ct_admin?op=verPacientesAlta">Pacientes dados de alta</a>
        <a href="ct_admin?op=verPendientes">Pacientes pendientes</a>
        <a href="ct_admin?op=registrarOdontologo">Registrar odontólogos</a>
        <a href="ct_admin?op=registrarSecretario">Registrar secretarios</a>
    </div>
</body>
</html>
