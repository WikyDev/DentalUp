<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>DentalUp</title>

        <!-- CSS del proyecto -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    </head>

    <body>

        <!-- HEADER -->
        <header class="header">
            <div class="header__content">
                <div>
                    <h1>Bienvenido a DentalUp</h1>
                    <p>Sistema de gestión dental profesional</p>
                </div>

                <form action="${pageContext.request.contextPath}/login" method="get">
                    <button class="btn btn-primary">Iniciar sesión</button>
                </form>
            </div>
        </header>

        <div class="layout">

            <!-- SIDEBAR -->
            <aside class="sidebar">

                <div class="sidebar__logo">
                    <h2>DentalUp</h2>
                    <p>Tu sonrisa perfecta</p>
                </div>

                <nav class="sidebar__nav">
                    <a class="nav-item" href="${pageContext.request.contextPath}/inicio">Inicio</a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/tratamientos">Tratamientos</a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/atencion">Atención</a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/devs">Desarrolladores</a>
                </nav>

                <div class="sidebar__contact">
                    <h3>Contáctanos</h3>
                    <p>(555) 123-4567</p>
                    <p>info@dentalup.com</p>
                    <p>Av. Principal 123</p>
                </div>

            </aside>

            <!-- MAIN CONTENT -->
            <main class="main">

                <!-- HERO -->
                <!-- HERO SUPERIOR DIVIDIDO -->
            <section class="hero-split">

                <!-- COLUMNA IZQUIERDA -->
                <div class="hero-left">

                    <span class="badge">
                        ⭐ Sistema dental líder
                    </span>

                    <h2>Bienvenido a DentalUp</h2>
                    <p class="hero-sub">
                        Plataforma integral para gestionar tu clínica dental 
                        de manera profesional y eficiente.
                    </p>

                    <!-- Tarjeta de acceso restringido -->
                    <div class="hero-card">
                        <div class="hero-card-header">
                            <img src="" alt="" class="hero-icon"> <!-- Ícono vacío -->
                            <div>
                                <h3>Acceso restringido</h3>
                                <p>Inicia sesión para acceder a todas las funcionalidades</p>
                            </div>
                        </div>

                        <ul class="hero-list">
                            <li>Gestión completa de citas y pacientes</li>
                            <li>Expedientes médicos digitales</li>
                            <li>Reportes y análisis en tiempo real</li>
                            <li>Control financiero y pagos</li>
                        </ul>
                    </div>

                    <button class="hero-btn">
                        → Iniciar sesión o registrarse →
                    </button>

                </div>

                <!-- COLUMNA DERECHA -->
                <div class="hero-right">

                    <!-- FOTO (vacía, la puedes reemplazar) -->
                    <img src="${pageContext.request.contextPath}/imagenes/acceso.jpg" 
                         alt="Imagen hero" 
                         class="hero-img">

                    <!-- tarjeta flotante -->
                    <div class="hero-overlay">
                        <img src="" alt="" class="hero-lock"> <!-- ícono vacío -->
                        <p>Contenido disponible solo para usuarios registrados</p>
                    </div>

                </div>

            </section>


                <!-- BENEFICIOS -->
                <section class="section">
                    <h2>Simplifica la gestión de tu clínica</h2>

                    <div class="benefits">

                        <div class="benefit">
                            <h3>Ahorra tiempo</h3>
                            <p>Automatiza tareas y enfócate en tus pacientes.</p>
                        </div>

                        <div class="benefit">
                            <h3>Datos seguros</h3>
                            <p>Protección avanzada y respaldo automático.</p>
                        </div>

                        <div class="benefit">
                            <h3>Fácil de usar</h3>
                            <p>Interfaz intuitiva sin capacitación compleja.</p>
                        </div>

                    </div>
                </section>

                <!-- CTA FINAL -->
                <section class="cta">
                    <h2>¿Listo para transformar tu clínica?</h2>
                    <p>Únete a cientos de dentistas que confían en DentalUp.</p>
                </section>

            </main>

        </div>

    </body>
</html>
