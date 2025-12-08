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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilosSubMenus.css">
    <style>
        /* Estilos adicionales para la tabla */
        .tabla-wrapper {
            width: 100%;
            overflow-x: auto;
            margin-top: 20px;
            border-radius: 14px;
            background: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .tabla-citas {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9em;
        }
        
        .tabla-citas thead {
            background: linear-gradient(135deg, #647CF5 0%, #73A6F2 100%);
            color: white;
        }
        
        .tabla-citas th {
            padding: 14px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9em;
        }
        
        .tabla-citas td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
            color: #2d3748;
        }
        
        .tabla-citas tbody tr:hover {
            background: #f7fafc;
        }
        
        .tabla-citas tbody tr:last-child td {
            border-bottom: none;
        }
        
        .nota-ayuda {
            margin-top: 20px;
            padding: 14px 18px;
            background: #e6fffa;
            border: 2px solid #81e6d9;
            border-radius: 12px;
            color: #2c7a7b;
            font-size: 0.9em;
        }
        
        .nota-ayuda code {
            background: white;
            padding: 2px 6px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            color: #647CF5;
        }
        
        .acciones-formulario {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .acciones-formulario .btn,
        .acciones-formulario a.btn {
            flex: 1;
            margin-top: 0;
        }
        
        .btn-secundario {
            display: block;
            padding: 14px;
            text-align: center;
            font-weight: 600;
            font-size: 1em;
            border-radius: 14px;
            background: white;
            border: 2px solid #e2e8f0;
            color: #2d3748;
            text-decoration: none;
            box-sizing: border-box;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .btn-secundario:hover {
            background: #f7fafc;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .subtitulo {
            color: #cbd5e0;
            font-size: 0.95em;
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <div id="img-fondo"></div>
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/imagenes/logo.png" alt="Logo DentalUp">
        </div>
        
        <h2>Buscar citas por paciente</h2>
        <p class="subtitulo" style="text-align: center; margin-bottom: 20px;">
            Ingresa la <strong>cédula del paciente</strong> para ver sus citas registradas.
        </p>

        <!-- FORMULARIO -->
        <form action="vs_buscarCita.jsp" method="get">
            <label for="cedulaPaciente">Cédula del paciente</label>
            <input
                type="number"
                id="cedulaPaciente"
                name="cedulaPaciente"
                placeholder="Ingrese la cédula"
                value="<%= (cedulaParam != null ? cedulaParam : "") %>">

            <div class="acciones-formulario">
                <button type="submit" class="btn">Buscar</button>
                <a href="vs_buscarCita.jsp" class="btn-secundario">Limpiar</a>
                <a href="vs_menuSecre.jsp" class="btn-secundario">Volver al menú</a>
            </div>
        </form>

        <!-- MENSAJES -->
        <% if (mensajeError != null) { %>
            <div class="error"><%= mensajeError %></div>
        <% } else if (mensajeInfo != null) { %>
            <div class="mensaje"><%= mensajeInfo %></div>
        <% } %>

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
                        <td><%= c.getCedulaPaciente() %></td>
                        <td><%= nombreCompletoPac %></td>
                        <td><%= c.getCedulaOdontologo() %></td>
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
        <div class="nota-ayuda">
            <p>
                💡 <strong>Ayuda:</strong> La cédula debe estar registrada en el sistema y tener citas asociadas.
            </p>
        </div>

    </div>
</body>
</html>