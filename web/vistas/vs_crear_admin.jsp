<%-- 
    Document   : vs_crear_admin
    Created on : 27/11/2025, 6:31:28 p. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Administrador</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
</head>
<body>
    <div id="img-fondo"></div>
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        <h2>Registrar Nuevo Administrador</h2>
        <!-- Mostrar mensaje del servlet -->
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
            <div class="mensaje"><%= mensaje %></div>
        <%
            }
        %>
        <form action="${pageContext.request.contextPath}/AdminServlet" method="post">
            <!-- Acción para el servlet -->
            <input type="hidden" name="accion" value="crearAdmin">
            
            <!-- Cédula -->
            <label for="cedula_admin">Cédula:</label>
            <input type="number" id="cedula_admin" name="cedula_admin"
                   required min="1" placeholder="Ingrese la cédula">
            <!-- Nombre completo -->
            <label for="nombre_completo">Nombre completo:</label>
            <input type="text" id="nombre_completo" name="nombre_completo"
                   required placeholder="Ej: Juan Torres">
            <!-- Correo -->
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo"
                   required placeholder="Ej: ejemplo@gmail.com">
            <!-- Usuario -->
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario"
                   required placeholder="Nombre de usuario para ingresar al sistema">
            <!-- Contraseña -->
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password"
                   required placeholder="Contraseña de acceso">
            <button type="submit" class="btn">Registrar Administrador</button>
        </form>
        <!-- Botón para volver -->
        <a href="${pageContext.request.contextPath}/vistas/vs_menuAdmin.jsp" class="btn">Volver al menú</a>
    </div>
</body>
</html>