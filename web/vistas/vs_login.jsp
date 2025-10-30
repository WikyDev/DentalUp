<%-- 
    Document   : registro_paciente
    Created on : 28/10/2025, 11:25:45?a. m.
    Author     : WikyLix
--%>

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
      <!--<div class="error-message"></div>-->
       <% 
        if (request.getParameter("error") != null) {
            String tipoError = request.getParameter("error");
            if ("true".equals(tipoError)) {
        %>
                <p style="color:red;">Usuario o contraseña incorrectos.</p>
        <%
            } else if ("rol".equals(tipoError)) {
        %>
                <p style="color:red;">El rol del usuario no está definido.</p>
        <%
            }
        }
        %>
        <form action="../control_inter/ct_login.jsp" method="post">
            <div class="input-group">
               <input type="text" name="usuario" placeholder="Usuario" required><br> 
            </div>
            <div class="input-group">
               <input type="password" name="password" placeholder="Contraseña" required><br> 
            </div>
     
            <button type="submit" class="btn-login">Ingresar</button>
        </form>
        
        <!-- Botón para registro de Pacientes -->
        <form action="vs_registro_paciente.jsp" method="get">
            <button type="submit" class="btn-registro">Registrar paciente</button>
        </form>
        
        <%if ("ok".equals(request.getParameter("registro"))) {%>
        <p style="color:green;">Paciente registrado con éxito. Ya puede iniciar sesión.</p>
        <%
            }
        %>

  </div>
</body>
</html>
