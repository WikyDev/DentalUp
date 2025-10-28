<%@ page import="controlador.ctLogin" %>
<%
    /*
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        ctLogin ctrl = new ctLogin();
        String rol = ctrl.validarAcceso(usuario, password);
        if (rol != null) {
            if ("admin".equalsIgnoreCase(rol)) { response.sendRedirect("/vistas/vs_menuAdmin.jsp"); }
            else if ("secre".equalsIgnoreCase(rol) || "secretario".equalsIgnoreCase(rol)) { response.sendRedirect("/vistas/vs_menuSecre.jsp"); }
            else if ("odonto".equalsIgnoreCase(rol) || "odontologo".equalsIgnoreCase(rol)) { response.sendRedirect("/vistas/vs_menuOdonto.jsp"); }
            else { request.setAttribute("error","Rol desconocido: "+rol); }
        } else {
            request.setAttribute("error","Usuario o clave incorrectos");
        }
    }*/
%>

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
      

        <!-- comment 
        <form action="../control_inter/ct_login.jsp" method="post" class="login-form">
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
        -->
        
        <!-- formulario para inicio de sesion, llama a la clase ct_login.jsp
        la cual actua como una intermediaria entre la vista y la logica de ctLogin.java-->
        <form action="../control_inter/ct_login.jsp" method="post">
            <div class="input-group">
               <input type="text" name="usuario" placeholder="Usuario" required><br> 
            </div>
            <div class="input-group">
               <input type="password" name="password" placeholder="Contraseña" required><br> 
            </div>
     
            <button type="submit" class="btn-login">Ingresar</button>
        </form>
        
        <form action="registro_paciente.jsp" method="get">
            <button type="submit" class="btn-registro">Registrar paciente</button>
        </form>

      <!-- comment 
      <div class="divider"></div>
        <form action="/vista/vs_inicio.jsp" method="get">
          <button type="submit" class="btn-secondary">Volver al inicio</button>
        </form>
      </div>
      -->
  </div>
</body>
</html>
