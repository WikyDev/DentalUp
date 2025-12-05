<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentalUp - Inicio</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">

</head>
<body>
    <div id="img-fondo"></div>
    <nav class="navbar">
        <div class="grupo-logo-nombre">
            <div class="logo">
              <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
            </div>
            <span class="brand-name">DentalUp</span>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Inicio</a>
        <a href="${pageContext.request.contextPath}/vistas/vs_desarrolladores.jsp" class="nav-link">Desarrolladores</a>
        <a href="${pageContext.request.contextPath}/vistas/vs_profesionales.jsp" class="nav-link">Profesionales</a>
        <a href="${pageContext.request.contextPath}/vistas/vs_login.jsp" class="cita-btn-unico btn-ingresar">Ingresar</a>
    </nav>
    
    <header class="hero">
        <div class="hero-content">
        <div class="hero-text">
          <h1>Bienvenido a DentalUp</h1>
          <b class="main-message">Por favor, inicia sesión</b>
          <b class="secondary-message">o regístrate para acceder</b>
          <p class="intro-text">Tecnología de vanguardia y un equipo de especialistas certificados para brindarte la mejor atención dental. Transformamos sonrisas, cambiamos vidas..</p>

          <a href="${pageContext.request.contextPath}/vistas/vs_login.jsp" class="cita-btn-unico">Agenda tu Cita</a>

        </div>      
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/imagenes/doc.jpg" alt="Foto de portada" class="main-img"/>
            <img src="${pageContext.request.contextPath}/imagenes/sonrisa.gif" alt="Gif acceso" class="gif-corner" />
        </div></div>
    </header> 
    
    <section class="services">
        <h2>Servicios Premium</h2>
        <p class="section-desc">Ofrecemos una amplia gama de tratamientos dentales con tecnología de vanguardia y un equipo altamente capacitado.</p>
        <div class="service-card">
            <h3>Ortodoncia</h3>
            <img src="${pageContext.request.contextPath}/imagenes/ortodoncia.gif" alt="Icono Ortodoncia" class="service-icon">
            <p class="service-desc">Alineación perfecta con tecnología invisible. Resultados garantizados y seguimiento personalizado.</p>
        </div>
        <div class="service-card">
            <h3>Blanqueamiento</h3>
            <img src="${pageContext.request.contextPath}/imagenes/blanqueo.gif" alt="Icono Blanqueamiento" class="service-icon">
            <p class="service-desc">Sonrisa más blanca en una sola sesión. Tecnología LED avanzada sin sensibilidad.</p>
        </div>
        <div class="service-card">
            <h3>Implantes</h3>
            <img src="${pageContext.request.contextPath}/imagenes/implante.gif" alt="Icono Implantes" class="service-icon">
            <p class="service-desc">Soluciones permanentes con materiales de última generación. Recupera tu sonrisa natural.</p>
        </div>
        <div class="service-card">
            <h3>Limpieza Dental</h3>
            <img src="${pageContext.request.contextPath}/imagenes/limpieza.gif" alt="Icono Limpieza" class="service-icon">
            <p class="service-desc">Prevención y cuidado profesional. Equipos de última tecnología para tu salud bucal.</p>
        </div>
    </section>
    <section class="stats">
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/paciente-feliz.png" alt="paciente feliz" class="stat-icon">
            <b class="stat-number">+5.000</b>
            <span class="stat-desc">Pacientes Felices</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/experiencia.png" alt="Icono Experiencia" class="stat-icon">
            <b class="stat-number">+15</b>
            <span class="stat-desc">Años de Experiencia</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/satisfaccion.png" alt="Icono Satisfacción" class="stat-icon">
            <b class="stat-number">98%</b>
            <span class="stat-desc">Satisfacción</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/especialistas.png" alt="Icono Especialistas" class="stat-icon">
            <b class="stat-number">+20</b>
            <span class="stat-desc">Especialistas</span>
        </div>
    </section>
    <section class="ventajas">
        <h2>Ventajas Competitivas</h2>
        <p class="section-desc">¿Por qué elegirnos?</p>
        <p class="section-desc">Combinamos tecnología avanzada, experiencia profesional y un trato humano excepcional para ofrecerte la mejor atención dental.</p>
        <div class="ventaja-card">
            <h3>Gran Tecnología de Punta</h3>
            <img src="${pageContext.request.contextPath}/imagenes/tecnologia.gif" alt="Icono Tecnología" class="ventaja-icon">
            <p class="ventaja-desc">Utilizamos equipos de última generación para diagnósticos precisos y tratamientos efectivos. Rayos X digitales, scanners 3D y más.</p>

        </div>
        <div class="ventaja-card">
            <h3>Atención Personalizada</h3>
            <img src="${pageContext.request.contextPath}/imagenes/atencion.gif" alt="Icono Atención" class="ventaja-icon">
            <p class="ventaja-desc">Cada paciente es único. Creamos planes de tratamiento personalizados adaptados a tus necesidades específicas y objetivos de sonrisa.</p>

        </div>
        <div class="ventaja-card">
            <h3>Profesionales Certificados</h3>
            <img src="${pageContext.request.contextPath}/imagenes/certificados.gif" alt="Icono Profesionales" class="ventaja-icon">
            <p class="ventaja-desc">Nuestro equipo cuenta con especialistas certificados internacionalmente con años de experiencia en odontología moderna.</p>
        </div>
    </section>
</body>
</html>
