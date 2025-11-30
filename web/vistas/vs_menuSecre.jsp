
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
<!-- Vista menú del secretario -->
<html>
<head>
    <title>Menú del Secretario</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/estilosMenuSecre.css">
</head>
<body>

<div class="secre-bg"></div>

<div class="secre-wrapper">
    <header class="secre-header">
        <div class="secre-logo">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="DentalUp">
        </div>
        <p class="secre-tagline">La gestión de tu agenda es nuestra prioridad</p>
        <h1 class="secre-title">
            Hola,
            <span>
                <%= (session != null && session.getAttribute("usuario") != null)
                        ? session.getAttribute("usuario")
                        : "Secretario(a)" %>
            </span>
        </h1>
        <p class="secre-subtitle">Selecciona la opción que necesitas gestionar</p>
    </header>

    <main class="secre-menu">

        <!-- REGISTRAR CITA -->
        <a class="secre-card secre-card-primary"
           href="${pageContext.request.contextPath}/vistas/vs_registrarCita.jsp">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_registrar_cita.png"
                     alt="Registrar cita">
            </div>
<<<<<<< HEAD
            <div class="secre-card-body">
                <h2>Registrar cita</h2>
                <p>Agenda una nueva cita para un paciente.</p>
=======
            <h1>
                Bienvenido, 
                <span class="usuario-nombre"><%= session.getAttribute("usuario") %></span> &#x1F4BB
            </h1>
            <h2>Gestión administrativa de la clínica</h2>
        </header>

        <h3>Seleccione una opción:</h3>

        <div class="menu-opciones">
            <!-- Ver todas las citas -->
            <a href="${pageContext.request.contextPath}/ctSecre?op=listarCitas" class="boton boton-agendar">
                <img class="icono-cita" alt="Ver todas las citas" 
                     src="${pageContext.request.contextPath}/imagenes/cita.gif">
                <span class="texto-agendar">Ver todas las citas</span>
            </a>

            <!-- Buscar cita por ID -->
            <a href="${pageContext.request.contextPath}/vistas/vs_buscarCita.jsp" class="boton boton-agendar">
                <img class="icono-cita" alt="Buscar cita por ID" 
                     src="${pageContext.request.contextPath}/imagenes/calendario.gif">
                <span class="texto-agendar">Buscar cita por ID</span>
            </a>

            <!-- Generar reporte PDF de citas -->
            <a href="${pageContext.request.contextPath}/ctSecre?op=generarReporteCitas" class="boton boton-agendar">
                <img class="icono-cita" alt="Generar reporte PDF" 
                     src="${pageContext.request.contextPath}/imagenes/historial.gif">
                <span class="texto-agendar">Generar reporte de citas (PDF)</span>
            </a>

            <!-- Consejo del día (opcional, para mantener el mismo diseño) -->
            <div class="consejo-dia">
                <img class="icono-cita" alt="Consejo del día" 
                     src="${pageContext.request.contextPath}/imagenes/consejo.gif">
                <strong>Consejo del día:</strong>
                <span>? Mantén la agenda al día para evitar cruces de citas.</span>
>>>>>>> 6102a44899e5a5eda78dcef8f79dca99af319913
            </div>
            <div class="secre-card-arrow">?</div>
        </a>

        <!-- AGENDA DEL DÍA -->
        <a class="secre-card"
           href="${pageContext.request.contextPath}/ctSecre?op=agendaDia">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_agenda.png"
                     alt="Agenda del día">
            </div>
            <div class="secre-card-body">
                <h2>Agenda de citas</h2>
                <p>Visualiza las citas programadas para una fecha.</p>
            </div>
            <div class="secre-card-arrow">?</div>
        </a>

        <!-- BUSCAR CITAS POR PACIENTE -->
        <a class="secre-card"
           href="${pageContext.request.contextPath}/vistas/vs_buscarCita.jsp">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_buscar_cita.png"
                     alt="Buscar citas">
            </div>
            <div class="secre-card-body">
                <h2>Buscar citas por paciente</h2>
                <p>Consulta el historial de citas usando la cédula.</p>
            </div>
            <div class="secre-card-arrow">?</div>
        </a>

        <!-- VER HISTORIAS CLÍNICAS (para futuro) -->
        <a class="secre-card"
           href="${pageContext.request.contextPath}/ctSecre?op=verHistorias">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_historia.png"
                     alt="Ver historias clínicas">
            </div>
            <div class="secre-card-body">
                <h2>Ver historias clínicas</h2>
                <p>Accede a la historia clínica asociada a cada paciente.</p>
            </div>
            <div class="secre-card-arrow">?</div>
        </a>

        <!-- CONSEJO DEL DÍA (sin enlace) -->
        <div class="secre-card secre-card-tip">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_tip.png"
                     alt="Consejo del día">
            </div>
            <div class="secre-card-body">
                <h2>Consejo del día</h2>
                <p>Confirma siempre los datos del paciente antes de guardar una cita.</p>
            </div>
        </div>

        <!-- CERRAR SESIÓN -->
        <a class="secre-card secre-card-danger"
           href="${pageContext.request.contextPath}/vistas/logout.jsp">
            <div class="secre-card-icon">
                <img src="${pageContext.request.contextPath}/imagenes/icon_logout.png"
                     alt="Cerrar sesión">
            </div>
            <div class="secre-card-body">
                <h2>Cerrar sesión</h2>
                <p>Finaliza tu sesión de forma segura.</p>
            </div>
            <div class="secre-card-arrow">?</div>
        </a>

        <div class="secre-help">
            <span>¿Necesitas ayuda?</span>
            <a href="mailto:soporte@dentalup.com">Contacta con soporte</a>
        </div>

    </main>
</div>

</body>
</html>
