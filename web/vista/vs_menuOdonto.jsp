<%-- 
    Document   : vs_menuOdonto
    Created on : 20/05/2025, 2:57:26 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Menú Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h2>Menú Odontólogo</h2>
    <div class="menu menu-odontologo">
        <a href="ct_odontologo?op=darAltaPaciente">Dar de alta paciente</a>
        <a href="ct_odontologo?op=verCitas">Ver mis citas</a>
        <a href="ct_odontologo?op=generarAgenda">Generar agenda del día</a>
    </div>
</body>
</html>
