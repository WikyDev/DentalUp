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

    
</head>
<body>

<div class="buscar-wrapper">
    <div class="buscar-card">

        <!-- ENCABEZADO -->
        <header class="buscar-header">
            <div class="titulos">
                <h1>Todas las citas registradas</h1>
                <p class="subtitulo">
                    Listado general de citas del sistema con filtros por cédula y estado.
                </p>
            </div>
        </header>

        <!-- FILTROS -->
        <section class="buscar-formulario">
            <form action="${pageContext.request.contextPath}/ctSecre"
                  method="get"
                  class="form-filtros">
                <input type="hidden" name="op" value="verTodasCitas"/>

                <div class="campo-formulario">
                    <label for="cedulaPaciente">Cédula del paciente</label>
                    <input type="number"
                           id="cedulaPaciente"
                           name="cedulaPaciente"
                           placeholder=""
                           value="<%= cedulaFiltro %>">
                </div>

                <div class="campo-formulario">
                    <label for="estadoCita">Estado de la cita</label>
                    <select id="estadoCita" name="estadoCita">
                        <option value="TODOS"     <%= "TODOS".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Todos</option>
                        <option value="PENDIENTE" <%= "PENDIENTE".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Pendiente</option>
                        <option value="ATENDIDA"  <%= "ATENDIDA".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Atendida</option>
                        <option value="CANCELADA" <%= "CANCELADA".equalsIgnoreCase(estadoFiltro) ? "selected" : "" %>>Cancelada</option>
                    </select>
                </div>

                <div class="acciones-formulario">
                    <button type="submit" class="btn-primario">Aplicar filtros</button>

                    <!-- Limpiar filtros: vuelve al mismo op sin parámetros -->
                    <a href="${pageContext.request.contextPath}/ctSecre?op=verTodasCitas"
                       class="btn-secundario">Limpiar</a>

                    <!-- Volver al menú: SIEMPRE pasando por el servlet -->
                    <a href="${pageContext.request.contextPath}/ctSecre?op=menu"
                       class="btn-secundario">Volver al menú</a>
                </div>
            </form>
        </section>

        <!-- TABLA -->
        <section class="resultado-busqueda">
            <%
                if (lista == null || lista.isEmpty()) {
            %>
            <p class="mensaje-exito">
                No se encontraron citas con los filtros actuales.
            </p>
            <%
                } else {
            %>
            <div class="tabla-wrapper">
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
                    <%
                        for (mdCita c : lista) {
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
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                }
            %>
        </section>

    </div>
</div>

</body>
</html>
