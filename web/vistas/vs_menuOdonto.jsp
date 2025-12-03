<%-- Vista limpia: sin lógica embebida (solo lectura de sesión) --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosMenus.css">
</head>
<body>

    <h1>
        Bienvenido, <%= session.getAttribute("usuario") %> &#x200D;&#x2695;&#xFE0F;
    </h1>

    <h2>Rol: <%= session.getAttribute("rol") %></h2>

    <div class="menu menu-odontologo">

        <!-- Ver citas del odontólogo -->
        <a href="${pageContext.request.contextPath}/CitaServlet?accion=listarOdontologo">Ver mis Citas</a>

      

        <!-- Gráfica conectada al Servlet correcto -->
        <a href="${pageContext.request.contextPath}/vistas/vs_grafica.jsp"><br>
            Gráfica por Motivo
        </a>
        <!-- historia clinica -->    
        <a class="botonMenu" href="${pageContext.request.contextPath}/ctHistoriaOdontologo?id_paciente="><br>
         Gestionar Historia Clínica
        </a>



        <!-- Logout -->
        <a href="${pageContext.request.contextPath}/vistas/logout.jsp"><br>
            Cerrar sesión
        </a>
    </div>

</body>
</html>
