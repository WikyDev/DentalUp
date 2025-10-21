<%-- 
    Document   : vs_login.jsp
    Created on : 09/05/2025
    Author     : Daniel Martinez 
--%>
<%@ page contentType="text/html; charset=UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login - DentalUp</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
  <div class="login-wrapper">
    <!-- Logo de la app -->
    <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
    <!-- resto del formulario -->
    <div class="login-card">
      <h2 class="login-title">Ingreso al Sistema</h2>

      <%-- Mostrar mensaje de error si existe en sesión --%>
      <% 
         String err = (String) session.getAttribute("errorMessage");
         if (err != null) { 
      %>
        <div class="error-message"><%= err %></div>
        <% session.removeAttribute("errorMessage"); %>
      <% } %>

      <form action="<%= request.getContextPath() %>/control/ct_login.jsp" method="post" class="login-form">
        <div class="input-group">
          <input type="text" name="nombre_user" placeholder="Usuario" required>
        </div>
        <div class="input-group">
          <input type="password" name="password" placeholder="Contraseña" required>
        </div>
        <div class="input-group">
          <select name="rol" required>
            <option value="admin">Administrador</option>
            <option value="secretario">Secretario</option>
            <option value="odontologo">Odontólogo</option>
          </select>
        </div>
        <button type="submit" class="btn-login">Ingresar</button>
      </form>

      <div class="divider"></div>

      <form action="<%= request.getContextPath() %>/vista/vs_inicio.jsp" method="get">
        <button type="submit" class="btn-secondary">Volver al inicio</button>
      </form>
    </div>
  </div>
</body>
</html>
