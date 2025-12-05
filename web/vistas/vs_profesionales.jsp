<%-- 
    Document   : vs_profesionales
    Created on : 4/12/2025, 8:01:09?p. m.
    Author     : WikyLix
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentalUp - Profesionales</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profesionales.css">
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
        <span class="nav-link">Servicios</span>
        <span class="nav-link">Desarrolladores</span>
        <span class="nav-link">Profesionales</span>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-inicio">Volver al Inicio</a>
    </nav>

    <header class="hero">
        <div class="hero-content">
            <h1>Nuestros Profesionales</h1>
            <p class="hero-subtitle">Expertos Certificados en Salud Dental</p>
            <p class="hero-description">
                Contamos con un equipo multidisciplinario de especialistas certificados internacionalmente, 
                comprometidos con tu bienestar y con la excelencia en cada tratamiento. Conoce a los profesionales 
                que harán realidad tu mejor sonrisa.
            </p>
        </div>
    </header>

    <section class="equipo">
        <h2>Conoce a Nuestro Equipo</h2>
        <p class="section-desc">Profesionales con años de experiencia y pasión por la odontología</p>
        
        <div class="profesional-card">
            <h3>Dra. Laura Gomez</h3>
            <img src="${pageContext.request.contextPath}/imagenes/doctor1.jpg" alt="Dr. Carlos Méndez" class="profesional-icon">
            <span class="profesional-especialidad">Ortodoncista Senior</span>
            <p class="profesional-desc">15 años de experiencia en ortodoncia invisible y brackets. Certificado por la Asociación Americana de Ortodoncistas.</p>
        </div>
        
        <div class="profesional-card">
            <h3>Dr. Miguel Ospina</h3>
            <img src="${pageContext.request.contextPath}/imagenes/doctor2.jpg" alt="Dra. Ana Rodríguez" class="profesional-icon">
            <span class="profesional-especialidad">Implantóloga</span>
            <p class="profesional-desc">Especialista en implantes dentales con técnicas de cirugía guiada por computadora.</p>
        </div>
        
        <div class="profesional-card">
            <h3>Dra. Camila Perez</h3>
            <img src="${pageContext.request.contextPath}/imagenes/doctor3.jpg" alt="Dr. Miguel Torres" class="profesional-icon">
            <span class="profesional-especialidad">Endodoncista</span>
            <p class="profesional-desc">Experto en tratamientos de conducto con microscopio dental. Certificación internacional en endodoncia avanzada.</p>
        </div>
        
        <div class="profesional-card">
            <h3>Dr. Pablo Torres</h3>
            <img src="${pageContext.request.contextPath}/imagenes/doctor4.jpg" alt="Dra. Laura Gómez" class="profesional-icon">
            <span class="profesional-especialidad">Periodoncista</span>
            <p class="profesional-desc">Especializada en regeneración de tejidos y cirugía periodontal. Miembro activo de la Sociedad Europea de Periodoncia.</p>
        </div>
    </section>

    <section class="certificaciones">
        <h2>Certificaciones y Reconocimientos</h2>
        <p class="section-desc">Nuestro compromiso con la excelencia está respaldado por certificaciones internacionales</p>
        
        <div class="certificacion-card">
            <h3>Certificación Internacional</h3>
            <img src="${pageContext.request.contextPath}/imagenes/admin.png" alt="Certifiación" class="certificacion-icon">
            <p class="certificacion-desc">Todos nuestros especialistas cuentan con certificaciones internacionales vigentes y participan en programas de educación continua.</p>
        </div>
        
        <div class="certificacion-card">
            <h3>Tecnología Aprobada</h3>
            <img src="${pageContext.request.contextPath}/imagenes/tecno.png" alt="tecnología" class="certificacion-icon">
            <p class="certificacion-desc">Utilizamos únicamente equipos y materiales aprobados por organismos internacionales de salud y regulación dental.</p>
        </div>
        
        <div class="certificacion-card">
            <h3>Formación Continua</h3>
            <img src="${pageContext.request.contextPath}/imagenes/dentista.png" alt="Formación" class="certificacion-icon">
            <p class="certificacion-desc">Nuestro equipo asiste regularmente a congresos y cursos especializados para mantenerse actualizado con las últimas técnicas.</p>
        </div>
    </section>
</body>
</html>
