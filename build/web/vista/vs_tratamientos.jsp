<%-- 
    Document   : vs_tratamientos
    Created on : 15/05/2025, 11:35:50 p. m.
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tratamientos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tratamientos.css">
</head>
<body>
    <header>
        <h1>Tratamientos que ofrecemos</h1>
        <h3><i>Algunos de los tratamientos que ofrecemos.</i></h3>
    </header>

    <main class="container">
        <section class="tratamiento">
            <img src="${pageContext.request.contextPath}/imagenes/img1.jpg" alt="Ortodoncia">
            <h2>Ortodoncia</h2>
            <p>Mejora la alineación dental y la mordida con nuestros tratamientos de ortodoncia moderna.</p>
            <a href="${pageContext.request.contextPath}/vista/vs_agendarCita.jsp" class="btn">Agendar Cita</a>
        </section>

        <section class="tratamiento">
            <img src="${pageContext.request.contextPath}/imagenes/img2.jpg" alt="Limpieza dental" style="width: 300px; height: 240px">
            <h2>Limpieza Dental</h2>
            <p>Elimina el sarro y mejora la salud bucal con una limpieza profesional.</p>
            <a href="${pageContext.request.contextPath}/vista/vs_agendarCita.jsp" class="btn">Agendar Cita</a>
        </section>

        <section class="tratamiento">
            <img src="${pageContext.request.contextPath}/imagenes/img3.jpg" alt="Endodoncia">
            <h2>Endodoncia</h2>
            <p>Tratamiento de conductos para salvar piezas dentales dañadas sin extraerlas.</p>
            <a href="${pageContext.request.contextPath}/vista/vs_agendarCita.jsp" class="btn">Agendar Cita</a>
        </section>

        <section class="tratamiento">
            <img src="${pageContext.request.contextPath}/imagenes/img4.jpg" alt="Blanqueamiento dental" style="width: 300px; height: 450px">
            <h2>Blanqueamiento Dental</h2>
            <p>Recupera el brillo y blancura de tu sonrisa con técnicas seguras y efectivas.</p>
            <a href="${pageContext.request.contextPath}/vista/vs_agendarCita.jsp" class="btn">Agendar Cita</a>
        </section>
    </main>
</body>
</html>
