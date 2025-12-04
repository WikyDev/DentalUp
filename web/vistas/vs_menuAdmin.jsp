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
                    Bienvenido, 
                    <span class="usuario-nombre"><%= session.getAttribute("usuario") %></span> 🦷
                </h1>
                <h2>
                    Rol: <%= session.getAttribute("rol") %>
                </h2>
                <h2>Tu salud dental es nuestra prioridad</h2>
            </header>

            <h3>Seleccione una opción:</h3>

            <div class="menu-opciones">
                <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoAdmin" class="boton boton-agendar">
                    <img class="icono-cita" alt="Agendar cita" src="${pageContext.request.contextPath}/imagenes/admin.png">
                    <span class="texto-agendar">Crear nuevo administrador</span>
                </a>


                <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoOdontologo" class="boton boton-agendar">
                    <img class="icono-cita" alt="Ver historial Clínico" src="${pageContext.request.contextPath}/imagenes/dentista.png">
                    <span class="texto-agendar">Crear nuevo odontólogo</span>
                </a>

                <a href="${pageContext.request.contextPath}/AdminServlet?accion=formNuevoSecretario" class="boton boton-agendar">
                    <img class="icono-cita" alt="Ver mis Citas" src="${pageContext.request.contextPath}/imagenes/especialistas.png">
                    <span class="texto-agendar">Crear nuevo secretario</span>
                </a>

                <a href="${pageContext.request.contextPath}/AdminServlet?accion=listarUsuarios" class="boton boton-agendar">
                    <img class="icono-cita" alt="Ver mis Citas" src="${pageContext.request.contextPath}/imagenes/lista.png">
                    <span class="texto-agendar">Lista de usuarios</span>
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
        </div>
    </div>
</body>
</html>