<%-- Vista limpia: sin lógica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Administrador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<%--<body>
    <h2>Menú Administrador</h2>
    <div class="menu menu-admin">
        <a href="/control/ct_admin.jsp?op=resumenSemanal">Ver resumen semanal</a><br>
        <a href="/control/ct_admin.jsp?op=verCitasDadas">Citas dadas</a><br>
        <a href="/control/ct_admin.jsp?op=verPacientesAlta">Pacientes dados de alta</a><br>
        <a href="/control/ct_admin.jsp?op=verPendientes">Pacientes pendientes</a><br>
        <a href="/control/ct_admin.jsp?op=registrarOdontologo">Registrar odontólogos</a><br>
        <a href="/control/ct_admin.jsp?op=registrarSecretario">Registrar secretarios</a>
    </div>
    <p style="margin-top:20px;">
      <a href="/vista/vs_login.jsp">Cerrar sesión</a>
    </p>
</body>
</html>--%>

<!-- muestra el nombre_user y rol que este en la base de datos -->
<body>
    <h1>Bienvenido, <%= session.getAttribute("usuario") %></h1>
    <h2>Rol: <%= session.getAttribute("rol") %></h2>

    <a href="logout.jsp">Cerrar sesión</a>
</body>
</html>
