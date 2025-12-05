<%-- Vista limpia: sin lógica embebida (solo lectura de sesión) --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Odontólogo</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
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

        <!-- MENU-container A LA DERECHA (DEBE IR DENTRO DEL TOP-LAYOUT) -->
        <div class="menu-container">
            <header>
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
                </div>
                <h1>
                    Bienvenido, <%= session.getAttribute("usuario") %> &#x200D;&#x2695;&#xFE0F;
                </h1>

                <h2>Rol: <%= session.getAttribute("rol") %></h2>
                <h2>Tu salud dental es nuestra prioridad</h2>
            </header>

            <div class="menu-opciones">
                <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/id.png">
                    <span class="texto-agendar">Ver mis Citas</span>
                </a>

                <!-- Gráfica conectada al Servlet correcto -->
                <a href="${pageContext.request.contextPath}/vistas/vs_grafica.jsp" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/grafica.png">
                    <span class="texto-agendar">Gráfica por Motivo</span>
                </a>
                    
                <!-- historia clinica -->  
                <a href="${pageContext.request.contextPath}/ctHistoriaOdontologo?id_paciente=" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/historial.png">
                    <span class="texto-agendar">Gestionar Historia Clínica</span>
                </a>
                    
                <div class="consejo-dia">
                    <img class="icono-cita" alt="Recuerda cepillarte después de cada comida" src="${pageContext.request.contextPath}/imagenes/consejo.gif">
                    <strong>Consejo del día:</strong>
                    <span>? Cada día da lo mejor de tí para ser un gran Profesional</span>
                </div>

                <a href="../vistas/logout.jsp" class="boton boton-agendar">
                    <img class="icono-cita" alt="Cerrar sesión" src="${pageContext.request.contextPath}/imagenes/cerrar_sesion.gif">
                    <span class="texto-agendar">Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
