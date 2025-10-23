<%-- Vista limpia: sin lógica embebida --%>

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
        <a href="/control/ct_odonto.jsp?op=listarOdonto">📋 Ver todas las citas</a><br>
        
        <a href="/vista/vs_agendaOdontologo.jsp">📅 Agenda por odontólogo</a><br>
        
        <a href="/control/ct_grafica.jsp">📊 Gráfica por Motivo</a><br>
        
        <a href="/vista/vs_login.jsp">🚪 Cerrar sesión</a>
    </div>
</body>
</html>
