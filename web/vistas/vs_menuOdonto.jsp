<%-- Vista limpia: sin lÃ³gica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <h1>Bienvenido, <%= session.getAttribute("usuario") %></h1>
    <h2>Rol: <%= session.getAttribute("rol") %></h2>
    <div class="menu menu-odontologo">
        <a href="/control/ct_odonto.jsp?op=listarOdonto">Ver todas las citas</a><br>
        
        <a href="/vista/vs_agendaOdontologo.jsp">Agenda por odontólogo</a><br>
        
        <a href="/control/ct_grafica.jsp">Gráfica por Motivo</a><br>
        
        <a href="logout.jsp">Cerrar sesión</a>
    </div>
</body>
</html>
