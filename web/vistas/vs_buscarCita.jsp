<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>
<%@ page import="controlador.ctSecre" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>
<%@ page import="controlador.ctSecre" %>

<%
    // ---------------- LÓGICA DE BÚSQUEDA ----------------
    String cedulaParam   = request.getParameter("cedulaPaciente");
    ArrayList<mdCita> listaCitas = null;
    String mensajeError  = null;
    String mensajeInfo   = null;

    if (cedulaParam != null && !cedulaParam.trim().isEmpty()) {
        try {
            int cedula = Integer.parseInt(cedulaParam.trim());

            // Controlador del secretario
            ctSecre secre = new ctSecre();
            listaCitas = secre.buscarCitasPorPaciente(cedula);

            if (listaCitas == null || listaCitas.isEmpty()) {
                mensajeInfo = "No se encontraron citas para el paciente con cédula " + cedula + ".";
            }

        } catch (NumberFormatException e) {
            mensajeError = "La cédula debe contener solo números.";
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar citas por paciente</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <!-- Ruta al CSS (ajústala si tu estructura es distinta) -->
    <link rel="stylesheet" href="../css/estilosBuscarCita.css">
</head>
<body>

<div class="buscar-wrapper">
    <div class="buscar-card">

        <!-- HEADER -->
        <header class="buscar-header">
            <div class="logo">
                <!-- Cambia la ruta del logo si está en otra carpeta -->
                <img src="../img/icono-diente.png" alt="DentalUp">
            </div>
            <div class="titulos">
                <h1>Buscar citas por paciente</h1>
                <p class="subtitulo">
                    Ingresa la <strong>cédula del paciente</strong> para ver sus citas registradas.
                </p>
            </div>
        </header>

        <!-- FORMULARIO -->
        <section class="buscar-formulario">
            <form action="vs_buscarCita.jsp" method="get">
                <div class="campo-formulario">
                    <label for="cedulaPaciente">Cédula del paciente</label>
                    <input
                        type="number"
                        id="cedulaPaciente"
                        name="cedulaPaciente"
                        placeholder=""
                        value="<%= (cedulaParam != null ? cedulaParam : "") %>">
                </div>

                <div class="acciones-formulario">
                    <button type="submit" class="btn-primario">Buscar</button>
                    <a href="vs_buscarCita.jsp" class="btn-secundario">Limpiar</a>
                    <a href="vs_menuSecre.jsp" class="btn-secundario">Volver al menú</a>
                </div>
            </form>
        </section>

        <!-- MENSAJES -->
        <section class="resultado-busqueda">
            <% if (mensajeError != null) { %>
                <p class="mensaje-error"><%= mensajeError %></p>
            <% } else if (mensajeInfo != null) { %>
                <p class="mensaje-exito"><%= mensajeInfo %></p>
            <% } else if (cedulaParam == null || cedulaParam.trim().isEmpty()) { %>
                <p class="mensaje-exito">
                    Ingresa una cédula y presiona <strong>Buscar</strong> para ver las citas del paciente.
                </p>
            <% } %>
        </section>

        <!-- TABLA DE RESULTADOS -->
        <% if (listaCitas != null && !listaCitas.isEmpty()) { %>
            <div class="tabla-wrapper">
                <table class="tabla-citas">
                    <thead>
                    <tr>
                        <th>ID Cita</th>
                        <th>Cédula paciente</th>
                        <th>Nombre paciente</th>
                        <th>Cédula odontólogo</th>
                        <th>Nombre odontólogo</th>
                        <th>Fecha</th>
                        <th>Motivo</th>
                        <th>Estado</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (mdCita c : listaCitas) {
                            String nomPac = c.getNombrePaciente();
                            String apePac = c.getApellidoPaciente();
                            String nombreCompletoPac = "";
                            if (nomPac != null) nombreCompletoPac += nomPac;
                            if (apePac != null && !apePac.isEmpty()) nombreCompletoPac += " " + apePac;
                    %>
                    <tr>
                        <td><%= c.getIdCita() %></td>
                        <td><%= c.getCedulaPaciente() %></td> <!-- aquí va la cédula del paciente -->
                        <td><%= nombreCompletoPac %></td>
                        <td><%= c.getCedulaOdontologo() %></td> <!-- aquí va la cédula del odontólogo -->
                        <td><%= (c.getNombreOdontologo() != null ? c.getNombreOdontologo() : "") %></td>
                        <td><%= c.getFechaCita() %></td>
                        <td><%= c.getMotivo() %></td>
                        <td><%= c.getEstado() %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        <% } %>

        <!-- NOTA / AYUDA -->
        <section class="nota-ayuda">
            <p>
                💡 Tip: la cédula debe existir en <code>pacientes.cedula_paciente</code> y el paciente
                debe tener citas registradas en <code>citas</code>.
            </p>
        </section>

    </div>
</div>

</body>
</html>
