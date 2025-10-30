<%-- 
    Document   : vs_menuPaciente
    Created on : 29/10/2025, 7:26:27 p. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Vista menu del paciente -->
<html>
<head>
    <title>Menú del Paciente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>
    <div class="menu-container">
        <h1>Bienvenido, <%= session.getAttribute("usuario") %> 🦷</h1>
        <h3>Seleccione una opción:</h3>

        <!-- Opciones para el paciente -->
        <div class="menu-opciones">
            <a href="../vistas/vs_agendarCita.jsp" class="boton">Agendar Cita</a>
            <!-- Por el momento esta opcion no se encuentra funcional -->
            <a href="../vistas/vs_historiaClinica.jsp" class="boton">Ver Historia Clínica</a>
            <a href="${pageContext.request.contextPath}/CitaServlet?accion=listar" class="boton">Ver mis Citas</a>
            <!-- Boton para cerrar la sesion -->
            <a href="logout.jsp" class="boton cancelar">Cerrar Sesión</a>
        </div>
    </div>
</body>
</html>

