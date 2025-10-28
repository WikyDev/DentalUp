<%-- 
    Document   : vs_login.jsp
    Created on : 09/05/2025
    Author     : Daniel Martinez 
--%>
<%@ page contentType="text/html; charset=UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login - DentalUp</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
  <div class="login-container">
    <h2>Ingreso al sistema</h2>

    <%-- Mostrar mensaje de error si existe en sesión --%>
    <% String err = (String) session.getAttribute("errorMessage");
       if (err != null) { %>
      <div class="error"><%= err %></div>
      <% session.removeAttribute("errorMessage"); %>
    <% } %>

    <form action="<%= request.getContextPath() %>/control/ct_login.jsp" method="post">
      <input type="text"     name="nombre_user" placeholder="Usuario"    required>
      <input type="password" name="password"       placeholder="Contraseña" required>
      <select name="rol">
        <option value="admin">Administrador</option>
        <option value="secretario">Secretario</option>
        <option value="odontologo">Odontólogo</option>
      </select>
      <button type="submit">Ingresar</button>
    </form>
  </div>
      <div>
          <br>
          <a href="<%= request.getContextPath() %>/vista/vs_inicio.jsp">Volver al inicio</a>
      </div>
    
</body>
</html>
