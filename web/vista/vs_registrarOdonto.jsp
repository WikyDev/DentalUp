<%-- 
    Document   : vs_registrarOdonto
    Created on : 23/06/2025, 2:11:41 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Registrar Odontólogo</title>
</head>
<body>
  <h2>Registro de Odontólogo</h2>
  <form action="<%=request.getContextPath()%>/control/ct_admin.jsp" method="post">
    <input type="hidden" name="accion" value="guardarOdontologo">
    <label>Usuario:</label><input type="text" name="nombre_user" placeholder="Cree un nombre de usuario" required><br>
    <label>Contraseña:</label><input type="password" name="password" placeholder="Cree una contraseña" required><br>
    <label>Nombre completo:</label><input type="text" name="nombre_completo" placeholder="Ingrese el nombre completo" required><br> 
    <label>Especialidad:</label><input type="text" name="especialidad" placeholder="Ingrese la especialidad" required><br>
    <label>Email:</label><input type="text" name="correo" placeholder="Ingrese el correo del odontólogo" required><br>
    <button type="submit">Registrar</button>
  </form>
</body>
</html>
