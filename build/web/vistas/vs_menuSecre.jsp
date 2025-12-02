
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <!-- Video de fondo, igual que en el menú del paciente -->
    <div id="img-fondo" style="background-image: url('${pageContext.request.contextPath}/imagenes/menu.jpeg');"></div>

    <div class="top-layout">

        <!-- CONTENEDOR IZQUIERDO INFORMATIVO -->
        <div class="info-container">
            <h2 class="info-title">Tu bienestar es primero</h2>

            <p class="info-text">
                En DentalUp te ofrecemos acceso rápido a tus citas, historial clínico y
                servicios personalizados. Mantén el control de tu salud oral de manera fácil
                y segura.
            </p>

            <div class="info-list">
                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/cita.png" alt="Icono" class="info-icon">
                    <span>Especialistas certificados</span>
                </div>

                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/sonrisa.gif" alt="Icono" class="info-icon">
                    <span>Tratamientos modernos</span>
                </div>

                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/cita.png" alt="Icono" class="info-icon">
                    <span>Atención personalizada</span>
                </div>
            </div>

            <div class="frase-inspiracion">
                "Una sonrisa sana abre puertas cada día."
            </div>
        </div>

    <div class="menu-container">
        <header>
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
            </div>
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
                     src="${pageContext.request.contextPath}/imagenes/cita.png">
                <span class="texto-agendar">Ver todas las citas</span>
            </a>

            <!-- Buscar cita por ID -->
            <a href="${pageContext.request.contextPath}/vistas/vs_buscarCita.jsp" class="boton boton-agendar">
                <img class="icono-cita" alt="Buscar cita por ID" 
                     src="${pageContext.request.contextPath}/imagenes/id.png">
                <span class="texto-agendar">Buscar cita por ID</span>
            </a>

            <!-- Generar reporte PDF de citas -->
            <a href="${pageContext.request.contextPath}/ctSecre?op=generarReporteCitas" class="boton boton-agendar">
                <img class="icono-cita" alt="Generar reporte PDF" 
                     src="${pageContext.request.contextPath}/imagenes/pdf.png">
                <span class="texto-agendar">Generar reporte de citas (PDF)</span>
            </a>

            <!-- Consejo del día (opcional, para mantener el mismo diseño) -->
            <div class="consejo-dia">
                <img class="icono-cita" alt="Consejo del día" 
                     src="${pageContext.request.contextPath}/imagenes/consejo.gif">
                <strong>Consejo del día:</strong>
                <span>? Mantén la agenda al día para evitar cruces de citas.</span>
            </div>

            <!-- Cerrar sesión -->
            <a href="${pageContext.request.contextPath}/vistas/logout.jsp" class="boton boton-agendar">
                <img class="icono-cita" alt="Cerrar sesión" 
                     src="${pageContext.request.contextPath}/imagenes/cerrar_sesion.gif">
                <span class="texto-agendar">Cerrar sesión</span>
            </a>
        </div>

        <div class="ayuda">
            <span>¿Necesitas ayuda?</span>
            <a href="mailto:soporte@tudental.com" class="boton ayuda">Contacta con nosotros</a>
        </div>
    </div>
    </div>            
</body>
</html>
