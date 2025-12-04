<%-- 
    Document   : vs_crear_odontologo
    Created on : 27/11/2025, 7:00:43 p. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
</head>
<body>
    <div id="img-fondo"></div>
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        <h2>Registrar Odontólogo </h2>
        <%
            String msg = (String) request.getAttribute("mensaje");
            if (msg != null) {
        %>
        <div class="mensaje"><%= msg %></div>
        <% } %>
        <form action="${pageContext.request.contextPath}/AdminServlet" method="post">
            <input type="hidden" name="accion" value="paso2PerfilOdontologo">
            <label>Cédula:</label>
            <input type="text" name="cedula_odontologo" required>
            <label>Nombre completo:</label>
            <input type="text" name="nombre_completo" required>
            <label>Especialidad:</label>
            <input type="text" name="especialidad" required>
            <label>Correo:</label>
            <input type="email" name="correo" required>
            <label>Usuario para login:</label>
            <input type="text" name="usuario" required>
            <label>Contraseña:</label>
            <input type="password" name="password" required>
            <button type="submit" class="btn">Crear Perfil</button>
        </form>
        <!-- Botón para volver -->
        <a href="${pageContext.request.contextPath}/vistas/vs_menuAdmin.jsp" class="btn">Volver al menú</a>    
    </div>      
</body>
</html>