<%-- Vista limpia: sin lógica embebida --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Administrador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<%--<body>
    <h2>Menú Administrador</h2>
    <div class="menu menu-admin">
        <a href="/control/ct_admin.jsp?op=resumenSemanal">Ver resumen semanal</a><br>
        <a href="/control/ct_admin.jsp?op=verCitasDadas">Citas dadas</a><br>
        <a href="/control/ct_admin.jsp?op=verPacientesAlta">Pacientes dados de alta</a><br>
        <a href="/control/ct_admin.jsp?op=verPendientes">Pacientes pendientes</a><br>
        <a href="/control/ct_admin.jsp?op=registrarOdontologo">Registrar odontólogos</a><br>
        <a href="/control/ct_admin.jsp?op=registrarSecretario">Registrar secretarios</a>
    </div>
    <p style="margin-top:20px;">
      <a href="/vista/vs_login.jsp">Cerrar sesión</a>
    </p>
</body>
</html>--%>

<!-- muestra el nombre_user y rol que este en la base de datos -->
<body>
<<<<<<< HEAD
    
    <div id="img-fondo" style="background-image: url('${pageContext.request.contextPath}/imagenes/menu.jpeg');"></div>
=======
    <h1>Bienvenido, <%= session.getAttribute("usuario") %></h1>
    <h2>Rol: <%= session.getAttribute("rol") %></h2>
>>>>>>> fd03fe203541775932b193068ec514f770e08e71

    <div class="top-layout">

        <!-- CONTENEDOR IZQUIERDO INFORMATIVO -->
        <div class="info-container">
            <h2 class="info-title">Tu bienestar es primero</h2>

            <p class="info-text">
                En DentalUp te ofrecemos acceso rápido a tus citas, historial clínico y
                servicios personalizados. Mantén el control de tu salud oral de manera fácil
                y segura.
            </p>

            <div class="info-list">
                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/cita.png" alt="Icono" class="info-icon">
                    <span>Especialistas certificados</span>
                </div>

                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/sonrisa.gif" alt="Icono" class="info-icon">
                    <span>Tratamientos modernos</span>
                </div>

                <div class="info-item">
                    <img src="${pageContext.request.contextPath}/imagenes/cita.png" alt="Icono" class="info-icon">
                    <span>Atención personalizada</span>
                </div>
            </div>

            <div class="frase-inspiracion">
                "Una sonrisa sana abre puertas cada día."
            </div>
        </div>
                    
        <h1>Bienvenido, <%= session.getAttribute("usuario") %> &#x1F9D1;&#x200D;&#x2695;&#xFE0F;
     </h1>
        <h2>Rol: <%= session.getAttribute("rol") %></h2>

        <a href="logout.jsp">Cerrar sesión</a>
    </div>
</body>
</html>
