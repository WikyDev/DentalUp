<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Vista menú del paciente -->
<html>
<head>
    <title>Menú del Paciente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
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
            <h2>Tu salud dental es nuestra prioridad</h2>
        </header>

        <h3>Seleccione una opción:</h3>

        <div class="menu-opciones">
            <a href="${pageContext.request.contextPath}/CitaServlet?accion=agendar" class="boton boton-agendar">
                <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/calendario.gif">
                <span class="texto-agendar">Agendar cita</span>
            </a>


            <a href="${pageContext.request.contextPath}/HistoriaServlet?accion=verHistoriasPaciente" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver historial Clínico" src="${pageContext.request.contextPath}/imagenes/historial.gif">
                <span class="texto-agendar">Ver historia clínica</span>
            </a>

            <a href="${pageContext.request.contextPath}/CitaServlet?accion=listar" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver mis Citas" src="${pageContext.request.contextPath}/imagenes/cita.gif">
                <span class="texto-agendar">Mis citas</span>
            </a>
            
            <div class="consejo-dia">
                    <img class="icono-cita" alt="Recuerda cepillarte después de cada comida" src="${pageContext.request.contextPath}/imagenes/consejo.gif">
                <strong>Consejo del día:</strong>
                <span>💡 Recuerda cepillarte después de cada comida</span>
            </div>

            <a href="../vistas/logout.jsp" class="boton boton-agendar">
                <img class="icono-cita" alt="Cerrar sesión" src="${pageContext.request.contextPath}/imagenes/cerrar_sesion.gif">
                <span class="texto-agendar">Cerrar sesión</span>
            </a>
        </div>

        <div class="ayuda">
            <span>¿Necesitas ayuda?</span>
            <a href="mailto:soporte@tudental.com" class="boton ayuda">Contacta con nosotros</a>
        </div>
    </div>
</body>
</html>