<%-- Vista limpia: sin logica embebida --%>

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
        <!-- Por el momento estas opciones no se encuentran funcionales, usan llamados de la version anterior
        (se cambiaran usando servlets) -->
        <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo">Ver mis Citas</a>
        
        <a href="/vista/vs_agendaOdontologo.jsp">Agenda por odontólogo</a><br>
        
        <a href="/control/ct_grafica.jsp">Gráfica por Motivo</a><br>
        
        <a href="logout.jsp">Cerrar sesión</a>
    </div>
</body>
</html>
