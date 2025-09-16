<%-- 
    Document   : menu
    Created on : 9/05/2025, 4:37:35 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - DentalUp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="login-container">
        <h2>Ingreso al sistema</h2>
        <form action="LoginController" method="post">
            <input type="text" name="nombre_usuario" placeholder="Usuario" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <select name="rol">
                <option value="admin">Administrador</option>
                <option value="secretario">Secretario</option>
                <option value="odontologo">Odontólogo</option>
            </select>
            <button type="submit">Ingresar</button>
        </form>
    </div>
</body>
</html>
