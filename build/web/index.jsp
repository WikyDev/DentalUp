<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentalUp - Inicio</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
    <video autoplay muted loop playsinline preload="auto" id="video-bg">
        <source src="${pageContext.request.contextPath}/imagenes/dashboard.mp4" type="video/mp4">
    </video>
    <nav class="navbar">
        <div class="grupo-logo-nombre">
            <div class="logo">
              <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
            </div>
            <span class="brand-name">DentalUp</span>
        </div>
        <span class="nav-link">Inicio</span>
        <span class="nav-link">Servicios</span>
        <span class="nav-link">Nosotros</span>
        <span class="nav-link">Testimonios</span>
        <span class="nav-link">Contacto</span>
    </nav>
    <header class="hero">
        <div class="hero-content">
        <div class="hero-text">
          <h1>Bienvenido a DentalUp</h1>
          <b class="main-message">Por favor, inicia sesión</b>
          <b class="secondary-message">o regístrate para acceder</b>
          <p class="intro-text">Tecnología de vanguardia y un equipo de especialistas certificados para brindarte la mejor atención dental. Transformamos sonrisas, cambiamos vidas..</p>
          <div class="hero-buttons">
            <div class="hero-buttons">
                <div class="hero-buttons">
                    <a href="vistas/vs_login.jsp" class="main-btn">Iniciar Sesión</a>
                    <a href="vistas/vs_registro_paciente.jsp" class="main-btn">Registrarse</a>
                </div>
            </div>
          </div>
        </div>
            
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/imagenes/doc.jpg" alt="Foto de portada" class="main-img"/>
            <img src="${pageContext.request.contextPath}/imagenes/sonrisa.gif" alt="Gif acceso" class="gif-corner" />
        </div>
    </header> 
    
    <section class="services">
        <h2>Servicios Premium</h2>
        <p class="section-desc">Ofrecemos una amplia gama de tratamientos dentales con tecnología de vanguardia y un equipo altamente capacitado.</p>
        <div class="service-card">
            <h3>Ortodoncia</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-ortodoncia.png" alt="Icono Ortodoncia" class="service-icon">
            <p class="service-desc">Alineación perfecta con tecnología invisible. Resultados garantizados y seguimiento personalizado.</p>
            <a href="#" class="service-link">Ver más ?</a>
        </div>
        <div class="service-card">
            <h3>Blanqueamiento</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-blanqueamiento.png" alt="Icono Blanqueamiento" class="service-icon">
            <p class="service-desc">Sonrisa más blanca en una sola sesión. Tecnología LED avanzada sin sensibilidad.</p>
            <a href="#" class="service-link">Ver más ?</a>
        </div>
        <div class="service-card">
            <h3>Implantes</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-implantes.png" alt="Icono Implantes" class="service-icon">
            <p class="service-desc">Soluciones permanentes con materiales de última generación. Recupera tu sonrisa natural.</p>
            <a href="#" class="service-link">Ver más ?</a>
        </div>
        <div class="service-card">
            <h3>Limpieza Dental</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-limpieza.png" alt="Icono Limpieza" class="service-icon">
            <p class="service-desc">Prevención y cuidado profesional. Equipos de última tecnología para tu salud bucal.</p>
            <a href="#" class="service-link">Ver más ?</a>
        </div>
    </section>
    <section class="stats">
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/icon-pacientes.png" alt="Icono Pacientes Felices" class="stat-icon">
            <b class="stat-number">+5.000</b>
            <span class="stat-desc">Pacientes Felices</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/icon-experiencia.png" alt="Icono Experiencia" class="stat-icon">
            <b class="stat-number">+15</b>
            <span class="stat-desc">Años de Experiencia</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/icon-satisfaccion.png" alt="Icono Satisfacción" class="stat-icon">
            <b class="stat-number">98%</b>
            <span class="stat-desc">Satisfacción</span>
        </div>
        <div class="stat-card">
            <img src="${pageContext.request.contextPath}/imagenes/icon-especialistas.png" alt="Icono Especialistas" class="stat-icon">
            <b class="stat-number">+20</b>
            <span class="stat-desc">Especialistas</span>
        </div>
    </section>
    <section class="ventajas">
        <h2>Ventajas Competitivas</h2>
        <p class="section-desc">¿Por qué elegirnos?</p>
        <p class="section-desc">Combinamos tecnología avanzada, experiencia profesional y un trato humano excepcional para ofrecerte la mejor atención dental.</p>
        <div class="ventaja-card">
            <h3>Tecnología de Punta</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-tecnologia.png" alt="Icono Tecnología" class="ventaja-icon">
            <p class="ventaja-desc">Utilizamos equipos de última generación para diagnósticos precisos y tratamientos efectivos. Rayos X digitales, scanners 3D y más.</p>
            <a href="#" class="ventaja-link">Conoce más ?</a>
        </div>
        <div class="ventaja-card">
            <h3>Atención Personalizada</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-atencion.png" alt="Icono Atención" class="ventaja-icon">
            <p class="ventaja-desc">Cada paciente es único. Creamos planes de tratamiento personalizados adaptados a tus necesidades específicas y objetivos de sonrisa.</p>
            <a href="#" class="ventaja-link">Conoce más ?</a>
        </div>
        <div class="ventaja-card">
            <h3>Profesionales Certificados</h3>
            <img src="${pageContext.request.contextPath}/imagenes/icon-certificados.png" alt="Icono Profesionales" class="ventaja-icon">
            <p class="ventaja-desc">Nuestro equipo cuenta con especialistas certificados internacionalmente con años de experiencia en odontología moderna.</p>
            <a href="#" class="ventaja-link">Conoce más ?</a>
        </div>
    </section>
</body>
</html>
