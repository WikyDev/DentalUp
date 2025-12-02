<%-- Vista limpia: sin logica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
<<<<<<< HEAD
    
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
                    <h1>Bienvenido, <%= session.getAttribute("usuario") %> &#x200D;&#x2695;&#xFE0F;</h1>
                    
            <h2>Rol: <%= session.getAttribute("rol") %></h2>
            <h2>Salud profesional al alcance de todos</h2>
            </header>
            
            <div class="menu-opciones">
                <!-- Por el momento las opciones de agenda por odontologo y grafica por motivo no se encuentran funcionales 
                usan llamados de la version anterior
                (se cambiaran usando servlets como lo está haciendo la opción de Ver mis citas) -->
                <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/calendario.png">
                    <span class="texto-agendar">Ver mis citas</span>
                </a>

                <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/cita.png">
                    <span class="texto-agendar">Agenda por odontólogo</span>
                </a>

                <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/grafica.png">
                    <span class="texto-agendar">Gráfica por motivo</span>
                </a>

                <a href="../vistas/logout.jsp" class="boton boton-agendar">
                    <img class="icono-cita" alt="Cerrar sesión" src="${pageContext.request.contextPath}/imagenes/cerrar_sesion.gif">
                    <span class="texto-agendar">Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>                
=======
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
>>>>>>> fd03fe203541775932b193068ec514f770e08e71
</body>
</html>
