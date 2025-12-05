<%-- 
    Document   : vs_verTodaslasCitasSecre
    Created on : 4 dic 2025, 3:43:13 p.m.
    Author     : Daniel
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.mdCita" %>

<%
    // Recuperamos las citas que envió el SecreServlet
    ArrayList<mdCita> listaCitas =
            (ArrayList<mdCita>) request.getAttribute("listaCitas");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ver todas las citas - Secretario</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/imagenes/diente.ico">
    <!-- Ajusta esta ruta al CSS que estés usando para las vistas del secre -->
    <link rel="stylesheet" href="../css/estilosBuscarCita.css">
</head>
<body>

<div class="buscar-wrapper">
    <div class="buscar-card">

        <!-- HEADER -->
        <header class="buscar-header">
            <div class="titulos">
                <h1>Todas las citas registradas</h1>
                <p class="subtitulo">
                    Listado general de citas del sistema DentalUp.
                </p>
            </div>
        </header>

        <!-- ACCIONES -->
        <section class="buscar-formulario">
            <div class="acciones-formulario">
                <a href="vs_menuSecre.jsp" class="btn-secundario">Volver al menú</a>
            </div>
        </section>

        <!-- TABLA DE CITAS -->
        <section class="resultado-busqueda">
            <%
                if (listaCitas == null || listaCitas.isEmpty()) {
            %>
                <p class="mensaje-exito">
                    No hay citas registradas en este momento.
                </p>
            <%
                } else {
            %>
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

                                String nomPac = c.getNombrePaciente() != null ? c.getNombrePaciente() : "";
                                String apePac = c.getApellidoPaciente() != null ? c.getApellidoPaciente() : "";
                                String pacCompleto = (nomPac + " " + apePac).trim();
                        %>
                            <tr>
                                <td><%= c.getIdCita() %></td>
                                <td><%= c.getCedulaPaciente() %></td>
                                <td><%= pacCompleto %></td>
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

