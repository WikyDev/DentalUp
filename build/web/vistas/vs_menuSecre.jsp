<%-- Vista limpia: sin lógica embebida --%>

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
        <a href="/control/ct_secre.jsp?op=listarCitas">📋 Ver todas las citas</a><br>

        <a href="/vista/vs_buscarCita.jsp">🔍 Buscar cita por ID</a><br>

        <a href="/control/ct_secre.jsp?op=generarReporteCitas">📄 Generar reporte PDF</a><br>

        <a href="/vista/vs_login.jsp">🚪 Cerrar sesión</a>
    </div>
</body>
</html>
