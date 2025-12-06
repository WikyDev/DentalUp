<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>

<%
    ArrayList<mdCita> lista = (ArrayList<mdCita>) request.getAttribute("listaCitas");

    String cedulaFiltro = (String) request.getAttribute("cedulaFiltro");
    String estadoFiltro  = (String) request.getAttribute("estadoFiltro");

    if (cedulaFiltro == null) cedulaFiltro = "";
    if (estadoFiltro == null) estadoFiltro = "TODOS";
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ver todas las citas</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/estiloTodasCitas.css">
</head>

<body>
    <div id="img-fondo"></div>

    <div class="container">

        <h2>Todas las citas registradas</h2>

        <p class="mensaje" style="text-align:center; margin-top:-10px;">
            Listado general de citas del sistema con filtros por cédula y estado.
        </p>

        <!-- TABLA SUPERIOR -->
        <section class="tabla-section">

            <% if (lista == null || lista.isEmpty()) { %>

                <p class="mensaje">
                    No se encontraron citas con los filtros actuales.
                </p>

            <% } else { %>

            <div class="contenedor-tabla">
                <table class="tabla-citas">
                    <thead>
                        <tr>
                            <th>ID Cita</th>
                            <th>Cédula Paciente</th>
                            <th>Nombre Paciente</th>
                            <th>Cédula Odontólogo</th>
                            <th>Nombre Odontólogo</th>
                            <th>Fecha</th>
                            <th>Motivo</th>
                            <th>Estado</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for (mdCita c : lista) { 
                            String nomPac = c.getNombrePaciente() != null ? c.getNombrePaciente() : "";
                            String apePac = c.getApellidoPaciente() != null ? c.getApellidoPaciente() : "";
                            String nombreCompleto = (nomPac + " " + apePac).trim();
                        %>
                        <tr>
                            <td><%= c.getIdCita() %></td>
                            <td><%= c.getCedulaPaciente() %></td>
                            <td><%= nombreCompleto %></td>
                            <td><%= c.getCedulaOdontologo() %></td>
                            <td><%= c.getNombreOdontologo() != null ? c.getNombreOdontologo() : "" %></td>
                            <td><%= c.getFechaCita() %></td>
                            <td><%= c.getMotivo() %></td>
                            <td><%= c.getEstado() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <% } %>

        </section>

        <!-- FORMULARIO DE FILTROS ABAJO -->
        <section class="filtros-section">

            <form action="${pageContext.request.contextPath}/ctSecre"
                  method="get"
                  class="filtros-form">

                <input type="hidden" name="op" value="verTodasCitas"/>

                <div class="grupo-filtros">

                    <div class="campo">
                        <label for="cedulaPaciente">Cédula del paciente</label>
                        <input type="number"
                               id="cedulaPaciente"
                               name="cedulaPaciente"
                               value="<%= cedulaFiltro %>">
                    </div>

                    <div class="campo">
                        <label for="estadoCita">Estado de la cita</label>
                        <select id="estadoCita" name="estadoCita">
                            <option value="TODOS"     <%= "TODOS".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Todos</option>
                            <option value="PENDIENTE" <%= "PENDIENTE".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Pendiente</option>
                            <option value="ATENDIDA"  <%= "ATENDIDA".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Atendida</option>
                            <option value="CANCELADA" <%= "CANCELADA".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Cancelada</option>
                        </select>
                    </div>

                </div>

                <div class="botones-filtros">
                    <button type="submit" class="btn">Aplicar filtros</button>

                    <a href="${pageContext.request.contextPath}/ctSecre?op=verTodasCitas"
                       class="btn btn-secundario">Limpiar</a>

                    <a href="${pageContext.request.contextPath}/ctSecre?op=menu"
                       class="btn btn-secundario">Volver al menú</a>
                </div>
            </form>

        </section>

    </div>

</body>
</html>
