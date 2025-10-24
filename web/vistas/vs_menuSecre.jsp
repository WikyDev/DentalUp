
<%-- 
    ? vs_menuSecre.jsp
    Esta vista muestra el menú principal para el rol de "Secretario".
    Desde aquí, el usuario puede acceder a las distintas funciones del sistema:
    - Ver todas las citas
    - Buscar citas por ID
    - Generar reportes
    - Cerrar sesión

    ? No contiene lógica de negocio, solo muestra enlaces que se conectan al Servlet (controlador)
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Secretario</title>

    <%-- Enlace al archivo CSS para dar estilo al menú --%>
    <%-- "${pageContext.request.contextPath}" asegura que funcione sin importar la ruta del proyecto --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>

<body>
    <%-- Muestra el nombre del usuario guardado en la sesión actual --%>
    <h1>Bienvenido, <%= session.getAttribute("usuario") %></h1>

    <%-- Muestra el rol del usuario (en este caso debería ser ?Secretario?) --%>
    <h2>Rol: <%= session.getAttribute("rol") %></h2>

    <%-- Contenedor principal del menú --%>
    <div class="menu menu-secre">

        <%-- Enlace que redirige al servlet (controlador) para listar todas las citas --%>
        <%-- La URL llama a /ctSecre con el parámetro op=listarCitas --%>
        <a href="${pageContext.request.contextPath}/ctSecre?op=listarCitas">Ver todas las citas</a><br>

        <%-- Enlace que lleva directamente a una vista JSP donde se puede buscar una cita por ID --%>
        <a href="${pageContext.request.contextPath}/vistas/vs_buscarCita.jsp">Buscar cita por ID</a><br>

        <%-- Enlace que llama al servlet con la operación de generar reporte PDF (aún no implementada) --%>
        <a href="${pageContext.request.contextPath}/ctSecre?op=generarReporteCitas">Generar reporte PDF</a><br>

        <%-- Enlace para cerrar sesión, normalmente limpia los atributos de sesión --%>
        <a href="${pageContext.request.contextPath}/vistas/logout.jsp">Cerrar sesión</a>
    </div>
</body>
</html>
