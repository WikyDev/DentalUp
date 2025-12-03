<%-- 
    Document   : vs_crear_secretario
    Created on : 27/11/2025, 6:34:20 p. m.
    Author     : Anthony
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Secretario</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/formularios.css">
</head>

<body>

<div class="form-container">

    <h2 class="titulo-form">Registrar Nuevo Secretario</h2>

    <!-- Mensaje desde el servlet -->
    <%
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null) {
    %>
        <div class="mensaje">
            <%= mensaje %>
        </div>
    <%
        }
    %>

    <form action="${pageContext.request.contextPath}/AdminServlet" method="post">

        <input type="hidden" name="accion" value="crearSecretario">

        <!-- Cédula -->
        <label for="cedula_secretario">Cédula:</label>
        <input type="number" id="cedula_secretario" name="cedula_secretario"
               required min="1" placeholder="Ingrese la cédula">

        <!-- Nombre completo -->
        <label for="nombre_completo">Nombre completo:</label>
        <input type="text" id="nombre_completo" name="nombre_completo"
               required placeholder="Ej: Juan Torres">

        <!-- Teléfono -->
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono"
               required placeholder="Ej: 3124567890">

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

        <button type="submit" class="btn-registrar">Registrar Secretario</button>
    </form>

    <!-- Botón para volver -->
    <a href="${pageContext.request.contextPath}/vistas/vs_menuAdmin.jsp" class="btn-volver">← Volver al menú</a>

</div>

</body>
</html>

