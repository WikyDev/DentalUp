<%-- Vista limpia: sin lÃ³gica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Secretario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h1>Bienvenido, <%= session.getAttribute("usuario") %></h1>
    <h2>Rol: <%= session.getAttribute("rol") %></h2>
    <div class="menu menu-secre">
        <a href="/control/ct_secre.jsp?op=listarCitas">Ver todas las citas</a><br>

        <a href="/vista/vs_buscarCita.jsp">Buscar cita por ID</a><br>

        <a href="/control/ct_secre.jsp?op=generarReporteCitas">Generar reporte PDF</a><br>
        <!-- se hace el llamado para cerrar la sesion -->
        <a href="logout.jsp">Cerrar sesión</a>
    </div>
</body>
</html>
