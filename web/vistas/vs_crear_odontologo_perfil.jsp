<%-- 
    Document   : vs_crear_odontologo_perfil
    Created on : 27/11/2025, 7:04:35 p. m.
    Author     : Anthony
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil del Odontólogo</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
</head>
<body>
    <div id="img-fondo"></div>
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        <h2>Registrar Odontólogo – Paso 2 (Perfil)</h2>
        <form action="${pageContext.request.contextPath}/AdminServlet" 
              method="post" enctype="multipart/form-data">
            <input type="hidden" name="accion" value="registrarOdontologoFinal">
            <!-- Campos ocultos del paso 1 -->
            <input type="hidden" name="cedula_odontologo" value="${cedula}">
            <input type="hidden" name="nombre_completo" value="${nombre}">
            <input type="hidden" name="especialidad" value="${especialidad}">
            <input type="hidden" name="correo" value="${correo}">
            <input type="hidden" name="usuario" value="${usuario}">
            <input type="hidden" name="password" value="${password}">
            
            <label>Foto del odontólogo:</label>
            <input type="file" name="foto" accept="image/*" required>
            
            <label>Descripción profesional:</label>
            <textarea name="descripcion" rows="5" required></textarea>
            
            <button type="submit" class="btn">Finalizar Registro</button>
        </form>
        <!-- Botón para volver -->
        <a href="${pageContext.request.contextPath}/vistas/vs_menuAdmin.jsp" class="btn">Volver al menú</a>
    </div>
</body>
</html>