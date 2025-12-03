<%-- Vista limpia: sin lógica embebida --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú del Administrador</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<!-- muestra el nombre_user y rol que este en la base de datos -->
<body>
    <video autoplay muted loop playsinline preload="auto" id="video-bg">
        <source src="${pageContext.request.contextPath}/imagenes/menus.mp4" type="video/mp4">
    </video>
    <div class="menu-container">
        <header>
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
            </div>
            <h1>
                Bienvenido, 
                <span class="usuario-nombre"><%= session.getAttribute("usuario") %></span> 🦷
            </h1>
            <h2>
                Rol: <%= session.getAttribute("rol") %>
            </h2>
        </header>

        <h3>Seleccione una opción:</h3>

        <div class="menu-opciones">
            <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoAdmin" class="boton boton-agendar">
                <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/calendario.gif">
                <span class="texto-agendar">Crear nuevo administrador</span>
            </a>


            <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoOdontologo" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver historial Clínico" src="${pageContext.request.contextPath}/imagenes/historial.gif">
                <span class="texto-agendar">Crear nuevo odontólogo</span>
            </a>

            <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoSecretario" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver mis Citas" src="${pageContext.request.contextPath}/imagenes/cita.gif">
                <span class="texto-agendar">Crear nuevo secretario</span>
            </a>
                
            <a href="${pageContext.request.contextPath}/AdminServlet?accion=listarUsuarios" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver mis Citas" src="${pageContext.request.contextPath}/imagenes/cita.gif">
                <span class="texto-agendar">Lista de usuarios</span>
            </a>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/vistas/logout.jsp">Cerrar sesión</a>
</body>
</html>