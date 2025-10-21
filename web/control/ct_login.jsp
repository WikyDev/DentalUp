<%-- 
    Document   : ct_login.jsp
    Created on : 16/05/2025
    Author     : Daniel Martinez 
    
--%>
<%@ page language="java"
         import="java.sql.*"
         contentType="text/html; charset=UTF-8"
         session="true" %>
<%
  // 1) Capturo parámetros del formulario
  String nombreUsuario = request.getParameter("nombre_user");
  String password      = request.getParameter("password");
  String inputRol      = request.getParameter("rol");

  // 2) Los paso al modelo
  request.setAttribute("nombre_user", nombreUsuario);
  request.setAttribute("password",       password);
%>

<%-- 3) Incluyo el modelo que deja en request: userValid, userId, storedRol --%>
<jsp:include page="../modelo/md_login.jsp" flush="true"/>

<%
  // 4) Recupero los resultados
  Boolean userValid = (Boolean) request.getAttribute("userValid");
  Integer userId    = (Integer) request.getAttribute("userId");
  String  storedRol = (String)  request.getAttribute("storedRol");

  // 5a) Si usuario/clave inválidos → vuelvo al login con mensaje
  if (userValid == null || !userValid) {
      session.setAttribute("errorMessage", "Usuario o contraseña inválidos.");
      response.sendRedirect(request.getContextPath() + "/vista/vs_login.jsp");
      return;
  }

  // 5b) Si rol equivocado → vuelvo al login con mensaje específico
  if (storedRol == null || !storedRol.equals(inputRol)) {
      session.setAttribute("errorMessage", "Rol incorrecto para este usuario.");
      response.sendRedirect(request.getContextPath() + "/vista/vs_login.jsp");
      return;
  }

  session.setAttribute("id_user", userId);
  session.setAttribute("rol",         storedRol);

  String destino;
  switch (storedRol) {
      case "admin":      destino = "/vista/vs_menuAdmin.jsp";  break;
      case "secretario": destino = "/vista/vs_menuSecre.jsp";  break;
      case "odontologo": destino = "/vista/vs_menuOdonto.jsp"; break;
      default:           destino = "/vista/vs_login.jsp";      break;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Redirigiendo…</title>
  <style>
    body { font-family: DM Sans, sans-serif; text-align: center; margin-top: 80px; }
    .success { color: #080; font-size: 1.2em; }
  </style>
</head>
<body>
  <div class="success">Sesión iniciada con éxito.</div>
  <script>
    // Después de 1.5s, redirijo al menú adecuado
    setTimeout(function(){
      window.location = '<%= request.getContextPath() + destino %>';
    }, 1500);
  </script>
</body>
</html>