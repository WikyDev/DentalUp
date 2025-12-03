<%-- 
    Document   : vs_historiaClinicaOdontologo
    Author     : Jhoon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.mdHistoriaClinica" %>

<%
    // Recuperar atributos del controlador
    ArrayList<mdHistoriaClinica> lista = 
        (ArrayList<mdHistoriaClinica>) request.getAttribute("listaHistorias");

    mdHistoriaClinica seleccionada = 
        (mdHistoriaClinica) request.getAttribute("historiaSeleccionada");

    // ID del paciente enviado desde el servlet
    String idPaciente = (request.getAttribute("cedula_paciente") != null)
            ? request.getAttribute("cedula_paciente").toString()
            : "";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Historia Clínica - Odontólogo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>

<h2>Historia Clínica del Paciente</h2>

<!-- Buscar por ID de paciente -->
<form method="get" action="ctHistoriaOdontologo">
    <label>ID Paciente:</label>
    <input type="number" name="cedula_paciente" required value="<%= idPaciente %>">
    <button type="submit">Buscar</button>
</form>

<hr><br>

<!-- Tabla de historias encontradas -->
<% if (lista != null && !lista.isEmpty()) { %>

    <h3>Registros encontrados:</h3>

    <table border="1" cellpadding="8">
        <tr>
            <th>ID Historia</th>
            <th>Fecha</th>
            <th>Motivo</th>
            <th>Diagnóstico</th>
            <th>Tratamiento</th>
            <th>Odontólogo</th>
            <th>observaciones</th>
            <th>Acción</th>
        </tr>

        <% for (mdHistoriaClinica h : lista) { %>
            <tr>
                <td><%= h.getIdHistoria() %></td>
                <td><%= h.getFecha() %></td>
                <td><%= h.getMotivoConsulta()%></td>
                <td><%= h.getDiagnostico()%></td>
                <td><%= h.getTratamiento()%></td>
                <td><%= h.getNombreOdontologo()%></td>
                <td><%= h.getObservaciones()%></td>
                <td>
                    <a href="ctHistoriaOdontologo?accion=editar&id_historia=<%= h.getIdHistoria() %>&cedula_paciente=<%= idPaciente %>">
                        Editar
                    </a>
                </td>
            </tr>
        <% } %>
    </table>

<% } else if (!idPaciente.equals("")) { %>

    <p>No se encontraron historias para este paciente.</p>

<% } %>

<br><hr><br>

<!-- Formulario para editar una historia -->
<% if (seleccionada != null) { %>

    <h3>Editar historia clínica</h3>

    <form method="post" action="ctHistoriaOdontologo">

        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id_historia" value="<%= seleccionada.getIdHistoria() %>">
        <input type="hidden" name="cedula_paciente" value="<%= seleccionada.getCedulaPaciente()%>">

        <label>Motivo de consulta:</label><br>
        <textarea name="motivoConsulta" rows="2" cols="40"><%= seleccionada.getMotivoConsulta() %></textarea><br><br>

        <label>Diagnóstico:</label><br>
        <textarea name="diagnostico" rows="2" cols="40"><%= seleccionada.getDiagnostico() %></textarea><br><br>

        <label>Tratamiento:</label><br>
        <textarea name="tratamiento" rows="2" cols="40"><%= seleccionada.getTratamiento() %></textarea><br><br>

        <label>Observaciones:</label><br>
        <textarea name="observaciones" rows="3" cols="40"><%= seleccionada.getObservaciones() %></textarea><br><br>

        <button type="submit">Guardar cambios</button>
    </form>

<% } %>

<br>
<a href="${pageContext.request.contextPath}/vistas/vs_menuOdonto.jsp">Volver al menú</a>

</body>
</html>
