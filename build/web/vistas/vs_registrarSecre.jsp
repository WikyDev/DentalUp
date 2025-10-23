<%@ page import="controlador.ControladorAdmin" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        // crear usuario con rol 'secre'
        ControladorAdmin ctrl = new ControladorAdmin();
        boolean ok = ctrl.crearUsuario(usuario, clave, "secre");
        request.setAttribute("mensaje", ok? "Secretario registrado":"Error al registrar secretario");
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Registrar Secretario</title>
</head>
<body>
  <h2>Registro de Secretario</h2>
  <form action="/control/ct_admin.jsp" method="post">
    <input type="hidden" name="accion" value="guardarSecretario">
    <label>Usuario:</label><input type="text" name="nombre_user" placeholder="Cree un nombre de usuario" required><br>
    <label>Contraseña:</label><input type="password" name="password" placeholder="Cree una contraseña" required><br>
    <label>Nombre completo:</label><input type="text" name="nombre_completo" placeholder="Ingrese el nombre completo" required><br>
    <label>Teléfono:</label><input type="text" name="telefono" placeholder="Ingrese el numero de telefono" required><br>
    <label>Email:</label><input type="text" name="correo" placeholder="Ingrese el correo del secretario" required><br>
    <button type="submit">Registrar</button>
  </form>
</body>
</html>
