<%-- 
    Document   : vs_desarrolladores
    Created on : 5/12/2025
    Author     : WikyLix
--%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentalUp - Desarrolladores</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/desarrolladores.css">
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
    </nav>

    <header class="hero">
        <div class="hero-content">
            <h1>Conoce al Equipo Detrás de DentalUp</h1>
            <p class="hero-subtitle">Código, Creatividad y Mucho Café ?</p>
            <p class="hero-description">
                Somos un equipo de desarrolladores apasionados por crear soluciones innovadoras 
                en el sector de la salud dental. Combinamos tecnología de punta con diseño intuitivo 
                para hacer que tu experiencia dental sea más fácil y accesible.
            </p>
        </div>
    </header>

    <section class="equipo-dev">
        <h2>Los Cerebros Detrás del Código</h2>
        <p class="section-desc">5 desarrolladores, infinitas líneas de código, y una misión: revolucionar la odontología digital</p>
        
        <div class="dev-grid">
            <div class="dev-card">
                <div class="dev-image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/antony.jpeg" alt="Anthony Brand Ramos" class="dev-image">
                    <div class="dev-badge">Full Stack</div>
                </div>
                <div class="dev-info">
                    <h3>Anthony Brand Ramos</h3>
                    <p class="dev-role">Diseñador UX/UI / Desarrollador Backend</p>
                    <p class="dev-bio">
                        Arquitecto del backend y maestro de las bases de datos. 
                        Cuando no está optimizando queries, probablemente esté debuggeando 
                        con una taza de café en la mano.
                    </p>
                    <div class="dev-skills">
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">MySQL</span>
                        <span class="skill-tag">UX/UI</span>
                    </div>
                </div>
            </div>

            <div class="dev-card">
                <div class="dev-image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/wiky.png" alt="Carlos Méndez" class="dev-image">
                    <div class="dev-badge">Frontend</div>
                </div>
                <div class="dev-info">
                    <h3>Wilson Andres Ospina</h3>
                    <p class="dev-role">Front-End Developer</p>
                    <p class="dev-bio">
                        Artista del píxel perfecto y cazador de bugs de CSS. 
                        Responsable de que cada botón haga exactamente lo que debe hacer, 
                        y que se vea increíble haciéndolo.
                    </p>
                    <div class="dev-skills">
                        <span class="skill-tag">JavaScript</span>
                        <span class="skill-tag">CSS3</span>
                        <span class="skill-tag">UX/UI</span>
                        <span class="skill-tag">HTML5</span>
                    </div>
                </div>
            </div>

            <div class="dev-card">
                <div class="dev-image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/suarez.jpeg" alt="Luis Torres" class="dev-image">
                    <div class="dev-badge">Backend</div>
                </div>
                <div class="dev-info">
                    <h3>Jhon Suarez</h3>
                    <p class="dev-role">Back-End Developer</p>
                    <p class="dev-bio">
                        Ingeniero de la lógica del servidor y guardián de la seguridad. 
                        Si hay un endpoint que necesita optimización o un algoritmo que 
                        resolver, este es tu desarrollador.
                    </p>
                    <div class="dev-skills">
                        <span class="skill-tag">HeidiSQL</span>
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">MySQL</span>
                    </div>
                </div>
            </div>

            <div class="dev-card">
                <div class="dev-image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/daniel.jpeg" alt="Miguel Ángel" class="dev-image">
                    <div class="dev-badge">Backend</div>
                </div>
                <div class="dev-info">
                    <h3>Daniel Alejandro Martinez</h3>
                    <p class="dev-role">Back-End Developer</p>
                    <p class="dev-bio">
                        Mago de la infraestructura y automatizador nato. 
                        Mantiene todo funcionando sin problemas 24/7, porque los servidores 
                        nunca duermen (pero él a veces sí).
                    </p>
                    <div class="dev-skills">
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">MySQL</span>
                        <span class="skill-tag">HeidiSQL</span>
                    </div>
                </div>
            </div>

            <div class="dev-card">
                <div class="dev-image-container">
                    <img src="${pageContext.request.contextPath}/imagenes/yisus.jpeg" alt="Ana Martínez" class="dev-image">
                    <div class="dev-badge">QA Engineer</div>
                </div>
                <div class="dev-info">
                    <h3>Jesús Estenllos loaiza</h3>
                    <p class="dev-role">Scrum Master</p>
                    <p class="dev-bio">
                        Dirigente al mando de tareas para el equipo de trabajo,
                        creó estructura sobre las proyecciones que debían tomarse
                        durante la semana de trabajo.
                    </p>
                    <div class="dev-skills">
                        <span class="skill-tag">Jira</span>
                        <span class="skill-tag">Documentación</span>
                        <span class="skill-tag">Testing</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="tech-stack">
        <h2>Nuestra Caja de Herramientas</h2>
        <p class="section-desc">Las tecnologías que hacen posible DentalUp</p>
        
        <div class="tech-grid">
            <div class="tech-category">
                <h3>Frontend</h3>
                <ul class="tech-list">
                    <li>HTML5 & CSS3</li>
                    <li>JavaScript ES6+</li>
                </ul>
            </div>

            <div class="tech-category">
                <h3>Backend</h3>
                <ul class="tech-list">
                    <li>Java</li>
                    <li>JSP</li>
                    <li>Libraries </li>
                    <li>JDK-24</li>
                </ul>
            </div>

            <div class="tech-category">
                <h3>Base de Datos</h3>
                <ul class="tech-list">
                    <li>MySQL</li>
                    <li>HeidiSQL</li>
                </ul>
            </div>
        </div>
    </section>

    <section class="fun-facts">
        <h2>Datos Curiosos del Equipo</h2>
        <div class="facts-container">
            <div class="fact-card">
                <img src="${pageContext.request.contextPath}/imagenes/cafe.png" alt="Icono Profesionales" class="fact-icon">
                <h3>100+</h3>
                <p>Tazas de café consumidas diariamente</p>
            </div>
            <div class="fact-card">
                <img src="${pageContext.request.contextPath}/imagenes/falla.png" alt="Icono Profesionales" class="fact-icon">
                <h3>50+</h3>
                <p>Bugs resueltos con éxito</p>
            </div>
            <div class="fact-card">
                <img src="${pageContext.request.contextPath}/imagenes/codigo.png" alt="Icono Profesionales" class="fact-icon">
                <h3>5000+</h3>
                <p>Líneas de código escritas</p>
            </div>
            <div class="fact-card">
                <img src="${pageContext.request.contextPath}/imagenes/github.png" alt="Icono Profesionales" class="fact-icon">
                <h3>80 - 24/7</h3>
                <p>Commits a cualquier hora del día</p>
            </div>
        </div>
    </section>
</body>
</html>