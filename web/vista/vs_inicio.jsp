<%-- 
    Document   : vs_inicio
    Created on : 22/06/2025, 12:32:34 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>DentalUp</title>
    <!-- se hace el llamado a la ruta de la hoja de estilos -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body> 
        <div class="logo">Clínica Odontológica <b>DentalUp</b></div>
        
    <main class="main-options">
        <a href="vs_login.jsp" class="login-button">Iniciar Sesión</a><!-- Llamado a las demas clases de vista --> 
        <h1>Bienvenido a <b>DentalUp</b></h1>
        <div class="options-container">
            <a href="vs_consultaHistoria.jsp" class="option-card">Consultar Historia Clínica</a>
            <a href="vs_agendarCita.jsp" class="option-card">Agendar Cita</a>
            <a href="vs_tratamientos.jsp" class="option-card">Ver Tratamientos</a>
        </div>
    </main>

    <div>
        <br>
        <br>
        <br>
        <br>
        <footer>
            <p>&copy; 2025 Clínica Odontológica. Todos los derechos reservados.</p>
        </footer>
    </div>
    
</body>
</html>
