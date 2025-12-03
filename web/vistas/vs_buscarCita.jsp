<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>
<%@ page import="controlador.ctSecre" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buscar Citas por Paciente</title>
    <meta charset="UTF-8">
    <!-- CSS ya creado -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/estilosBuscarCita.css">
</head>
<body>

    <!-- Video de fondo -->
    <video autoplay muted loop playsinline preload="auto" id="video-bg">
        <source src="${pageContext.request.contextPath}/imagenes/menus.mp4" type="video/mp4">
    </video>

    <div class="buscar-wrapper">
        <div class="buscar-card">

            <!-- HEADER -->
            <header class="buscar-header">
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/imagenes/logo.png"
                         alt="Logo DentalUp">
                </div>
                <div class="titulos">
                    <h1>Buscar citas por ID de Paciente</h1>
                    <p class="subtitulo">Consulta rápida de las citas registradas</p>
                </div>
            </header>

            <!-- BARRA DE BÚSQUEDA ARRIBA -->
            <section class="buscar-formulario">
                <!-- Más adelante este action lo apuntamos al controlador ctSecre -->
                <form action="#" method="get">
                    <div class="campo-formulario">
                        <label for="id_paciente">ID del paciente</label>
                        <input type="number"
                               id="id_paciente"
                               name="id_paciente"
                               required
                               placeholder="Ingresa el ID del paciente">
                    </div>

                    <div class="acciones-formulario">
                        <button type="submit" class="btn-primario">Buscar</button>
                        <a href="${pageContext.request.contextPath}/vistas/vs_menuSecre.jsp"
                           class="btn-secundario">
                            Volver al menú
                        </a>
                    </div>
                </form>
            </section>

            <!-- RESULTADO ABAJO EN TABLA -->
            <section class="resultado-busqueda">
                <h3>Resultados de la búsqueda</h3>

                <div class="tabla-contenedor" style="margin-top:10px; overflow-x:auto;">
                    <table border="0" cellspacing="0" cellpadding="8" style="width:100%;">
                        <thead style="background-color:#e5e7eb;">
                            <tr>
                                <th>ID Cita</th>
                                <th>ID Paciente</th>
                                <th>ID Odontólogo</th>
                                <th>Fecha y hora</th>
                                <th>Motivo</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Fila de ejemplo SOLO para el diseño.
                                 Cuando conectemos el backend, aquí va el for/while con las citas reales. -->
                            <tr style="background-color:#ffffff; border-bottom:1px solid #e5e7eb;">
                                <td>123</td>
                                <td>45</td>
                                <td>7</td>
                                <td>2025-11-20 09:30</td>
                                <td>Control</td>
                                <td>Programada</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- NOTA / AYUDA -->
            <section class="nota-ayuda">
                <p>💡 Tip: cuando conectemos el backend, esta tabla se llenará automáticamente según el ID de paciente.</p>
            </section>

        </div>
    </div>

</body>
</html>
