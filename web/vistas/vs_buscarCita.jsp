<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>
<%@ page import="controlador.ctSecre" %>


<!DOCTYPE html>
<html>
<head>
    <title>Buscar citas por paciente</title>
    <meta charset="UTF-8">

    <!-- Asegúrate que la ruta coincida con tu estructura de carpetas -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/estilosBuscarCita.css">
</head>
<body>

<div class="buscar-wrapper">
    <div class="buscar-card">

        <!-- HEADER -->
        <header class="buscar-header">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imagenes/logo.png"
                     alt="Logo DentalUp">
            </div>
            <div class="titulos">
                <h1>Buscar citas por cédula</h1>
                <p class="subtitulo">Consulta rápida de todas las citas de un paciente</p>
            </div>
        </header>

        <!-- FORMULARIO -->
        <section class="buscar-formulario">

            <%
                // Recuperamos el parámetro para poder reutilizarlo en el value del input
                String cedParam = request.getParameter("cedula_paciente");
                ArrayList<mdCita> lista = null;
                String error = null;
                String mensaje = null;
                Integer cedBuscada = null;

                if (cedParam != null && !cedParam.trim().isEmpty()) {
                    try {
                        cedBuscada = Integer.parseInt(cedParam);

                        ctSecre secre = new ctSecre();
                        lista = secre.buscarCitasPorPaciente(cedBuscada);

                        if (lista == null || lista.isEmpty()) {
                            mensaje = "No se encontraron citas para el paciente con cédula " + cedBuscada + ".";
                        }

                    } catch (NumberFormatException e) {
                        error = "La cédula debe ser un número válido.";
                    }
                }
            %>

            <form action="vs_buscarCita.jsp" method="get">
                <div class="campo-formulario">
                    <label for="cedula_paciente">Cédula del paciente</label>
                    <input type="number"
                           id="cedula_paciente"
                           name="cedula_paciente"
                           required
                           placeholder="Ingresa la cédula del paciente"
                           value="<%= (cedParam != null ? cedParam : "") %>">
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

        <!-- RESULTADOS -->
        <section class="resultado-busqueda">

            <% if (error != null) { %>
                <p class="mensaje-error"><%= error %></p>
            <% } %>

            <% if (mensaje != null) { %>
                <p class="mensaje-exito"><%= mensaje %></p>
            <% } %>

            <% if (lista != null && !lista.isEmpty()) { %>
                <h3 style="font-size:15px; margin-bottom:10px;">
                    Resultados para la cédula: <strong><%= cedBuscada %></strong>
                </h3>

                <div class="tabla-contenedor" style="margin-top:10px; overflow-x:auto;">
                    <table border="0" cellspacing="0" cellpadding="8" style="width:100%; font-size:13px;">
                        <thead style="background-color:#e5e7eb;">
                            <tr>
                                <th style="text-align:left;">N°Cita</th>
                                <th style="text-align:left;">Paciente</th>
                                <th style="text-align:left;">Cédula Paciente</th>
                                <th style="text-align:left;">Odontólogo0</th>
                                <th style="text-align:left;">Cédula Odontólogo</th>
                                <th style="text-align:left;">Fecha y hora</th>
                                <th style="text-align:left;">Motivo</th>
                                <th style="text-align:left;">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (mdCita c : lista) { %>
                            <tr style="background-color:#ffffff; border-bottom:1px solid #e5e7eb;">
                                <td><%= c.getIdCita() %></td>
                                <td><%= c.getNombrePaciente() %></td>
                                <td><%= c.getIdPaciente() %></td>
                                <td><%= c.getNombreOdontologo() %></td>
                                <td><%= c.getIdOdontologo() %></td>
                                <td><%= c.getFechaCita() %></td>
                                <td><%= c.getMotivo() %></td>
                                <td><%= c.getEstado() %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>

            <% if (cedParam == null || cedParam.trim().isEmpty()) { %>
                <p class="mensaje-exito">
                    Ingresa la cédula del paciente y presiona <strong>Buscar</strong> para ver sus citas.
                </p>
            <% } %>

        </section>

        <!-- NOTA / AYUDA -->
        <section class="nota-ayuda">
            <p>💡 Tip: la cédula del paciente debe coincidir con la registrada en el sistema al crear la cita.</p>
        </section>

    </div>
</div>

</body>
</html>
