<%-- 
    Document   : login
    Author     : Wiky
    Fecha      : 12/11/2025
--%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - DentalUp</title>
  <!-- Enlace correcto al CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <video autoplay muted loop playsinline preload="auto" id="video-bg">
        <source src="${pageContext.request.contextPath}/imagenes/login.mp4" type="video/mp4">
    </video>
  <div class="login-wrapper">

  <!-- Izquierda -->
  <div class="left-section">
      <div class="logo-header">
          <div class="logo">
              <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
          </div>

          <div class="logo-text">
              <h1>DentalUp</h1>
              <p>Tu sonrisa, nuestra prioridad</p>
          </div>
      </div>

      <h2 class="welcome-title">Bienvenido a tu clínica</h2>
      <h2 class="secondary-message">dental de confianza</h2>

      <p class="welcome-description">
        Accede a tu portal de pacientes para gestionar tus citas, ver tu historial médico y mantenerte conectado con nuestro equipo de profesionales.
      </p>
  </div> <!-- ? cierre correcto de left-section -->

  <!-- Derecha: Login -->
  <div class="login-card">
      <h2 class="login-title">Portal de Inicio</h2>

      <% 
        String error = request.getParameter("error");
        String registro = request.getParameter("registro");

        if (error != null) {
          if ("true".equals(error)) {
      %>
          <div class="error-message"> Usuario o contraseña incorrectos.</div>
      <%
          } else if ("rol".equals(error)) {
      %>
          <div class="error-message"> El rol del usuario no está definido.</div>
      <%
          }
        }

        if ("ok".equals(registro)) {
      %>
          <div class="success-message"> Paciente registrado con éxito.</div>
      <%
        }
      %>

      <form action="../control_inter/ct_login.jsp" method="post">
          <div class="input-group">
              <label for="login-usuario">Nombre de usuario</label>
              <input type="text" name="usuario" id="login-usuario" placeholder="Usuario" required>
          </div>

          <div class="input-group">
              <label for="login-password">Contraseña</label>
              <input type="password" name="password" id="login-password" placeholder="*******" required>
          </div>

          <div class="remember-forgot">
              <label class="remember-me">
                  <input type="checkbox" name="recordarme">
                  <span>Recordarme</span>
              </label>
              <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>
          </div>

          <button type="submit" class="btn-login">Iniciar Sesión</button>
      </form>

      <div class="divider">o</div>

      <form action="vs_registro_paciente.jsp" method="get">
          <button type="submit" class="btn-registro">Registrarse</button>
      </form>
  </div>

</div>

</body>
</html>